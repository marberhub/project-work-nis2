-- ****************************************************************************
-- Interrogazioni per il profilo ACN 
-- ****************************************************************************

-- ---------------------------------------------------------------------
-- 1. Servizi erogati, dal più rilevante. L'etichetta è calcolata con CASE.
-- ---------------------------------------------------------------------
SELECT s.nome,
       s.categoria_rilevanza,
       CASE s.categoria_rilevanza
            WHEN 1 THEN 'minimo' WHEN 2 THEN 'basso' WHEN 3 THEN 'medio' WHEN 4 THEN 'alto'
       END AS etichetta,
       s.stato,
       p.cognome,
       p.nome AS nome_responsabile
  FROM servizio s
  JOIN persona p ON p.id_persona = s.id_responsabile
 WHERE s.id_organizzazione = 1
 ORDER BY s.categoria_rilevanza DESC, s.nome;

-- ---------------------------------------------------------------------
-- 2. Asset critici: asset in esercizio che supportano direttamente almeno
--    un servizio attivo di categoria >= 3. Dato derivato, mai memorizzato.
-- ---------------------------------------------------------------------
SELECT a.codice_inventario,
       a.nome,
       a.tipo,
       a.ubicazione,
       p.cognome,
       p.nome AS nome_responsabile,
       MAX(s.categoria_rilevanza) AS categoria,
       COUNT(*) AS servizi_supportati
  FROM asset a
  JOIN asset_servizio x ON x.id_asset = a.id_asset
  JOIN servizio s ON s.id_servizio = x.id_servizio
  JOIN persona p ON p.id_persona = a.id_responsabile
 WHERE a.id_organizzazione = 1
   AND a.stato = 'in_esercizio'
   AND s.stato = 'attivo'
   AND s.categoria_rilevanza >= 3
 GROUP BY a.id_asset, a.codice_inventario, a.nome, a.tipo, a.ubicazione, p.cognome, p.nome
 ORDER BY categoria DESC, a.codice_inventario;

-- ---------------------------------------------------------------------
-- 3. Dipendenze da terze parti: forniture in corso alla data di riferimento da modificare opportunatamente.
--    Due casi uniti: forniture riferite a un servizio e forniture riferite
--    a un asset, con i servizi che l'asset supporta direttamente.
-- ---------------------------------------------------------------------
SELECT fo.ragione_sociale AS fornitore,
       fo.paese,
       f.tipo_fornitura,
       s.nome AS servizio,
       CAST(NULL AS VARCHAR(50)) AS asset,
       f.fornitura_ict AS ict,
       f.fornitura_non_fungibile AS non_fungibile
  FROM fornitura f
  JOIN fornitore fo ON fo.id_fornitore = f.id_fornitore
  JOIN servizio s ON s.id_servizio = f.id_servizio
 WHERE s.id_organizzazione = 1
   AND f.data_inizio <= DATE '2026-11-18'
   AND (f.data_fine IS NULL OR f.data_fine >= DATE '2026-11-18')
UNION ALL
SELECT fo.ragione_sociale,
       fo.paese,
       f.tipo_fornitura,
       s.nome,
       a.nome,
       f.fornitura_ict,
       f.fornitura_non_fungibile
  FROM fornitura f
  JOIN fornitore fo ON fo.id_fornitore = f.id_fornitore
  JOIN asset a ON a.id_asset = f.id_asset
  LEFT JOIN asset_servizio x ON x.id_asset = a.id_asset
  LEFT JOIN servizio s ON s.id_servizio = x.id_servizio
 WHERE a.id_organizzazione = 1
   AND f.data_inizio <= DATE '2026-11-18'
   AND (f.data_fine IS NULL OR f.data_fine >= DATE '2026-11-18')
 ORDER BY fornitore, servizio, asset;

-- ---------------------------------------------------------------------
-- 4. Punti di contatto: incarichi NIS validi alla data di riferimento da modificare opportunatamente 
-- ---------------------------------------------------------------------
SELECT i.ruolo, p.cognome, p.nome, p.qualifica, p.email, p.telefono, i.data_inizio
  FROM incarico i
  JOIN persona p ON p.id_persona = i.id_persona
 WHERE i.id_organizzazione = 1
   AND i.data_inizio <= DATE '2026-11-18'
   AND (i.data_fine IS NULL OR i.data_fine >= DATE '2026-11-18')
 ORDER BY i.ruolo, p.cognome;

-- ---------------------------------------------------------------------
-- 5. Profilo attuale: misure di base con copertura fino a 0.4
--    nell'ultimo assessment consolidato (MAX della data di consolidamento)
-- ---------------------------------------------------------------------
SELECT v.codice_sottocategoria,
       v.grado_copertura,
       v.livello_maturita,
       SUBSTRING(sc.descrizione FROM 1 FOR 70) AS descrizione
  FROM valutazione v
  JOIN sottocategoria sc ON sc.codice = v.codice_sottocategoria
 WHERE sc.misura_base_importanti = 'S'
   AND v.grado_copertura <= 0.4
   AND v.id_assessment IN (SELECT a.id_assessment
                             FROM assessment a
                            WHERE a.id_organizzazione = 1
                              AND a.data_consolidamento = (SELECT MAX(a2.data_consolidamento)
                                                             FROM assessment a2
                                                            WHERE a2.id_organizzazione = 1))
 ORDER BY v.grado_copertura, v.codice_sottocategoria;

-- ---------------------------------------------------------------------
-- 6. Evidenze riferite ad asset dell'inventario
--    (collegamento tra profilo attuale e inventario)
-- ---------------------------------------------------------------------
SELECT e.id_assessment, e.codice_sottocategoria, a.codice_inventario, a.nome AS asset, e.descrizione
  FROM evidenza e
  JOIN asset a ON a.id_asset = e.id_asset
 WHERE a.id_organizzazione = 1
 ORDER BY e.id_assessment, e.codice_sottocategoria;

-- ---------------------------------------------------------------------
-- 7. Dipendenze dirette tra asset: di che cosa ha bisogno ogni asset.
--    La tabella asset compare due volte, con due alias.
-- ---------------------------------------------------------------------
SELECT d1.codice_inventario AS asset,
       d1.nome,
       d2.codice_inventario AS richiede,
       d2.nome AS nome_richiesto,
       d.tipo_dipendenza
  FROM dipendenza_asset d
  JOIN asset d1 ON d1.id_asset = d.id_asset_dipendente
  JOIN asset d2 ON d2.id_asset = d.id_asset_richiesto
 WHERE d1.id_organizzazione = 1
 ORDER BY d1.codice_inventario, d2.codice_inventario;

-- ---------------------------------------------------------------------
-- 8. Responsabilità: quanti asset e quanti servizi segue ogni persona
-- ---------------------------------------------------------------------
SELECT p.cognome, p.nome, 'asset' AS oggetto, COUNT(*) AS numero
  FROM asset a
  JOIN persona p ON p.id_persona = a.id_responsabile
 WHERE a.id_organizzazione = 1
 GROUP BY p.id_persona, p.cognome, p.nome
UNION ALL
SELECT p.cognome, p.nome, 'servizi', COUNT(*)
  FROM servizio s
  JOIN persona p ON p.id_persona = s.id_responsabile
 WHERE s.id_organizzazione = 1
 GROUP BY p.id_persona, p.cognome, p.nome
 ORDER BY cognome, nome, oggetto;

-- ---------------------------------------------------------------------
-- 9. Storico: come è cambiato un servizio (id_servizio = 6, Logistica e spedizioni, cambiato da dml.sql).
--    Il log si popola con i trigger di trigger_postgresql.sql, quindi dopo
--    il seed è vuoto: provare dopo aver eseguito dml.sql. Lo stato passato
--    si legge nelle colonne dati_prima e dati_dopo.
-- ---------------------------------------------------------------------
SELECT l.id_log, l.data_ora, l.operazione, l.utente, l.dati_prima, l.dati_dopo
  FROM log_modifiche l
 WHERE l.nome_tabella = 'servizio'
   AND l.chiave = 'id_servizio=6'
 ORDER BY l.id_log;

-- ---------------------------------------------------------------------
-- 10. Esportazione del profilo ACN dalla vista (il file CSV lo crea il
--     client: \copy di psql o l'esportazione di pgAdmin).
--     Servizi e asset: stato attuale. Incarichi e forniture: in corso
--     alla data di riferimento da modificare opportunatamente.
-- ---------------------------------------------------------------------
SELECT v.sezione, v.elemento, v.riferimento, v.tipo, v.categoria, v.servizio, v.asset,
       v.cognome, v.nome, v.email, v.telefono, v.dettaglio,
       v.ict, v.non_fungibile, v.paese, v.data_inizio, v.data_fine
  FROM v_profilo_acn v
 WHERE v.id_organizzazione = 1
   AND (v.data_inizio IS NULL OR v.data_inizio <= DATE '2026-11-18')
   AND (v.data_fine IS NULL OR v.data_fine >= DATE '2026-11-18')
 ORDER BY v.ordine, v.categoria DESC, v.elemento, v.servizio, v.asset;
