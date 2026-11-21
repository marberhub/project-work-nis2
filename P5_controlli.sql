-- ****************************************************************************
-- Controlli manuali di coerenza
-- ****************************************************************************

-- CONTROLLO 1. Incarichi PDC, SOST_PDC e REF_CSIRT sovrapposti nel tempo
--    per la stessa organizzazione e lo stesso ruolo (ne vale uno alla volta).
--    SOST_REF_CSIRT è escluso: possono esserci più sostituti insieme.
SELECT i1.id_incarico AS incarico_1, i2.id_incarico AS incarico_2, i1.ruolo
  FROM incarico i1
  JOIN incarico i2 ON i2.id_organizzazione = i1.id_organizzazione
                  AND i2.ruolo = i1.ruolo
                  AND i2.id_incarico > i1.id_incarico
 WHERE i1.id_organizzazione = 1
   AND i1.ruolo <> 'SOST_REF_CSIRT'
   AND i1.data_inizio <= COALESCE(i2.data_fine, DATE '9999-12-31')
   AND i2.data_inizio <= COALESCE(i1.data_fine, DATE '9999-12-31');

-- CONTROLLO 2. La stessa persona con PDC e SOST_PDC in periodi sovrapposti
SELECT i1.id_incarico AS incarico_pdc, i2.id_incarico AS incarico_sostituto, i1.id_persona
  FROM incarico i1
  JOIN incarico i2 ON i2.id_organizzazione = i1.id_organizzazione
                  AND i2.id_persona = i1.id_persona
 WHERE i1.id_organizzazione = 1
   AND i1.ruolo = 'PDC'
   AND i2.ruolo = 'SOST_PDC'
   AND i1.data_inizio <= COALESCE(i2.data_fine, DATE '9999-12-31')
   AND i2.data_inizio <= COALESCE(i1.data_fine, DATE '9999-12-31');

-- CONTROLLO 3. Incarichi duplicati: stessa persona e stesso ruolo in periodi sovrapposti
SELECT i1.id_incarico AS incarico_1, i2.id_incarico AS incarico_2, i1.id_persona, i1.ruolo
  FROM incarico i1
  JOIN incarico i2 ON i2.id_organizzazione = i1.id_organizzazione
                  AND i2.id_persona = i1.id_persona
                  AND i2.ruolo = i1.ruolo
                  AND i2.id_incarico > i1.id_incarico
 WHERE i1.id_organizzazione = 1
   AND i1.data_inizio <= COALESCE(i2.data_fine, DATE '9999-12-31')
   AND i2.data_inizio <= COALESCE(i1.data_fine, DATE '9999-12-31');

-- CONTROLLO 4. Assessment consolidato incompleto: manca la valutazione di una
--    misura di base (sottocategoria con misura_base_importanti = 'S').
SELECT a.id_assessment, sc.codice AS misura_mancante
  FROM assessment a
  JOIN sottocategoria sc ON sc.misura_base_importanti = 'S'
 WHERE a.id_organizzazione = 1
   AND a.data_consolidamento IS NOT NULL
   AND NOT EXISTS (SELECT 1
                     FROM valutazione v
                    WHERE v.id_assessment = a.id_assessment
                      AND v.codice_sottocategoria = sc.codice);

-- CONTROLLO 5. Assessment consolidato modificato: righe del log su assessment,
--    valutazione ed evidenza successive alla data di consolidamento
--    (da scrivere a mano; qui quella del primo assessment). Le righe
--    riferite a un assessment ancora in corso sono legittime: da leggere.
SELECT l.id_log, l.nome_tabella, l.chiave, l.operazione, l.data_ora
  FROM log_modifiche l
 WHERE l.nome_tabella IN ('assessment', 'valutazione', 'evidenza')
   AND l.data_ora > TIMESTAMP '2026-06-30 23:59:59'
   AND (l.dati_prima LIKE '%"id_assessment": 1,%' OR l.dati_dopo LIKE '%"id_assessment": 1,%'
        OR l.chiave = 'id_assessment=1');

-- CONTROLLO 6. Cicli nelle dipendenze tra asset, solo di lunghezza 2
--    (A richiede B e B richiede A). I cicli più lunghi richiederebbero una
--    ricerca ricorsiva, che questo percorso non usa: sono descritti nella relazione.
SELECT d1.id_asset_dipendente AS asset_a, d1.id_asset_richiesto AS asset_b
  FROM dipendenza_asset d1
  JOIN dipendenza_asset d2 ON d2.id_asset_dipendente = d1.id_asset_richiesto
                          AND d2.id_asset_richiesto = d1.id_asset_dipendente
 WHERE d1.id_asset_dipendente < d1.id_asset_richiesto;

-- CONTROLLO 7. Coerenza dell'organizzazione: asset e servizio collegati
--    appartengono a organizzazioni diverse
SELECT x.id_asset, x.id_servizio
  FROM asset_servizio x
  JOIN asset a ON a.id_asset = x.id_asset
  JOIN servizio s ON s.id_servizio = x.id_servizio
 WHERE a.id_organizzazione <> s.id_organizzazione;

-- CONTROLLO 8. Coerenza dell'organizzazione: dipendenza tra asset di organizzazioni diverse
SELECT d.id_asset_dipendente, d.id_asset_richiesto
  FROM dipendenza_asset d
  JOIN asset a1 ON a1.id_asset = d.id_asset_dipendente
  JOIN asset a2 ON a2.id_asset = d.id_asset_richiesto
 WHERE a1.id_organizzazione <> a2.id_organizzazione;

-- CONTROLLO 9. Coerenza dell'organizzazione: evidenza riferita a un asset di
--    un'altra organizzazione rispetto all'assessment
SELECT e.id_evidenza
  FROM evidenza e
  JOIN assessment a ON a.id_assessment = e.id_assessment
  JOIN asset s ON s.id_asset = e.id_asset
 WHERE a.id_organizzazione <> s.id_organizzazione;

-- CONTROLLO 10. Servizi attivi senza alcun asset che li supporti
SELECT s.id_servizio, s.nome
  FROM servizio s
 WHERE s.id_organizzazione = 1
   AND s.stato = 'attivo'
   AND NOT EXISTS (SELECT 1 FROM asset_servizio x WHERE x.id_servizio = s.id_servizio);

-- CONTROLLO 11. Asset dismessi o pianificati che supportano un servizio attivo
SELECT a.id_asset, a.codice_inventario, a.stato, s.nome AS servizio
  FROM asset a
  JOIN asset_servizio x ON x.id_asset = a.id_asset
  JOIN servizio s ON s.id_servizio = x.id_servizio
 WHERE a.id_organizzazione = 1
   AND a.stato <> 'in_esercizio'
   AND s.stato = 'attivo';

-- CONTROLLO 12. Forniture in corso (senza data di fine) riferite a un asset dismesso
SELECT f.id_fornitura, a.codice_inventario
  FROM fornitura f
  JOIN asset a ON a.id_asset = f.id_asset
 WHERE a.id_organizzazione = 1
   AND a.stato = 'dismesso'
   AND f.data_fine IS NULL;

-- CONTROLLO 13. Più di una organizzazione: il modello è pensato per una sola
--    (con più righe vanno ripetuti i controlli 7-9 per ciascuna).
SELECT COUNT(*) AS organizzazioni
  FROM organizzazione
HAVING COUNT(*) <> 1;
