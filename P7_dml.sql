-- ****************************************************************************
-- Istruzioni di inserimento, aggiornamento e cancellazione
-- Servono anche da linee guida per il popolamento e la manutenzione dei dati.
-- ****************************************************************************

START TRANSACTION;

-- 1. Nuova persona (personale interno, senza fornitore)
INSERT INTO persona (id_persona, nome, cognome, qualifica, email, telefono, id_fornitore)
SELECT COALESCE(MAX(id_persona), 0) + 1, 'Cabiria', 'Ferrari', 'Tecnico di rete',
       'c.ferrari@cineticacomponenti.example', '+39 011 5550110', CAST(NULL AS INTEGER)
  FROM persona;

-- 2. Nuovo asset pianificato, con responsabile cercato per email
INSERT INTO asset (id_asset, id_organizzazione, codice_inventario, nome, descrizione, tipo, stato, ubicazione, id_responsabile)
SELECT COALESCE(MAX(id_asset), 0) + 1, 1, 'NT-006', 'Switch di riserva per la rete di fabbrica',
       'Switch di scorta per i reparti', 'rete', 'pianificato', 'Magazzino',
       (SELECT id_persona FROM persona WHERE email = 'c.ferrari@cineticacomponenti.example')
  FROM asset;

-- 3. Il nuovo asset supporta un servizio e dipende da un altro asset
--    (le tabelle di collegamento non hanno id: la chiave è la coppia)
INSERT INTO asset_servizio (id_asset, id_servizio, ruolo)
VALUES ((SELECT id_asset FROM asset WHERE id_organizzazione = 1 AND codice_inventario = 'NT-006'),
        (SELECT id_servizio FROM servizio WHERE id_organizzazione = 1 AND nome = 'Supervisione e controllo degli impianti'),
        'ricambio della rete');
INSERT INTO dipendenza_asset (id_asset_dipendente, id_asset_richiesto, tipo_dipendenza)
VALUES ((SELECT id_asset FROM asset WHERE id_organizzazione = 1 AND codice_inventario = 'NT-006'),
        (SELECT id_asset FROM asset WHERE id_organizzazione = 1 AND codice_inventario = 'NT-001'),
        'rete');

-- 4. Nuova fornitura riferita al nuovo asset (un fornitore già censito)
INSERT INTO fornitura (id_fornitura, id_fornitore, id_asset, id_servizio, tipo_fornitura, oggetto,
                       riferimento_contratto, data_inizio, data_fine, fornitura_ict, fornitura_non_fungibile)
SELECT COALESCE(MAX(id_fornitura), 0) + 1,
       (SELECT id_fornitore FROM fornitore WHERE identificativo_fiscale = '04567890010'),
       (SELECT id_asset FROM asset WHERE id_organizzazione = 1 AND codice_inventario = 'NT-006'),
       CAST(NULL AS INTEGER), 'hardware', 'Fornitura dello switch di riserva',
       'CC-2026-031', DATE '2026-11-18', CAST(NULL AS DATE), 'S', 'N'
  FROM fornitura;

-- 5. Cambio della categoria di rilevanza di un servizio (da 2 basso a 3 medio)
UPDATE servizio
   SET categoria_rilevanza = 3
 WHERE id_organizzazione = 1
   AND nome = 'Logistica e spedizioni';

-- 6. Messa in esercizio dell'asset pianificato del seed e nuova ubicazione
UPDATE asset
   SET stato = 'in_esercizio', ubicazione = 'Sala server, armadio 3'
 WHERE id_organizzazione = 1
   AND codice_inventario = 'IT-005';

-- 7. Avvicendamento del punto di contatto: si chiude l'incarico in corso
--    e se ne apre uno nuovo (prima il vecchio, poi il nuovo: nessuna sovrapposizione).
--    La nuova PDC non deve avere altri incarichi sovrapposti: controlli.sql, controllo 2
UPDATE incarico
   SET data_fine = DATE '2026-11-30'
 WHERE id_organizzazione = 1
   AND ruolo = 'PDC'
   AND data_fine IS NULL;
INSERT INTO incarico (id_incarico, id_organizzazione, id_persona, ruolo, data_inizio, data_fine)
SELECT COALESCE(MAX(id_incarico), 0) + 1, 1,
       (SELECT id_persona FROM persona WHERE email = 'b.cortona@cineticacomponenti.example'),
       'PDC', DATE '2026-12-01', CAST(NULL AS DATE)
  FROM incarico;

-- 8. Dismissione di un asset e fine della fornitura collegata
UPDATE asset
   SET stato = 'dismesso'
 WHERE id_organizzazione = 1
   AND codice_inventario = 'OT-004';
UPDATE fornitura
   SET data_fine = DATE '2026-11-18'
 WHERE id_asset = (SELECT id_asset FROM asset WHERE id_organizzazione = 1 AND codice_inventario = 'OT-004')
   AND data_fine IS NULL;

-- 9. Correzione di un errore: si cancella il collegamento sbagliato (prima i
--    collegamenti, poi la riga referenziata)
DELETE FROM dipendenza_asset
 WHERE id_asset_dipendente = (SELECT id_asset FROM asset WHERE id_organizzazione = 1 AND codice_inventario = 'NT-006')
   AND id_asset_richiesto = (SELECT id_asset FROM asset WHERE id_organizzazione = 1 AND codice_inventario = 'NT-001');

-- 10. Nuova valutazione nel secondo assessment, ancora in corso
--     (l'assessment consolidato non si modifica: vedi controlli.sql, controllo 5)
INSERT INTO valutazione (id_assessment, codice_sottocategoria, grado_copertura, livello_maturita, note)
VALUES (2, 'GV.RR-04', 0.4, 2, 'Prima raccolta delle responsabilità');

-- Verifica dell'ultimo inserimento
SELECT id_asset, codice_inventario, nome, stato FROM asset WHERE id_organizzazione = 1 ORDER BY id_asset DESC;

ROLLBACK;
