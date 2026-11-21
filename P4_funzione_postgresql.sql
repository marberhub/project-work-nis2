-- ****************************************************************************
-- Come la vista v_profilo_acn (stesse colonne, stesse quattro sezioni),
-- ma con tre parametri:
--   p_id_organizzazione  organizzazione da estrarre
--   p_soglia             categoria minima degli asset critici (predefinita 3)
--   p_data               data di riferimento per incarichi e forniture in
--                        corso (predefinita: oggi)
-- Esempi:
--   SELECT * FROM profilo_acn(1);
--   SELECT * FROM profilo_acn(1, 4, DATE '2026-11-18');
-- Il file CSV lo crea il client, per esempio con psql:
--   \copy (SELECT * FROM profilo_acn(1)) TO 'profilo_acn.csv' WITH (FORMAT csv, HEADER, DELIMITER ';')
-- ****************************************************************************
CREATE OR REPLACE FUNCTION profilo_acn(
    p_id_organizzazione INTEGER,
    p_soglia SMALLINT DEFAULT 3,
    p_data DATE DEFAULT CURRENT_DATE)
RETURNS TABLE (
    id_organizzazione INTEGER, ordine SMALLINT, sezione VARCHAR(30), elemento VARCHAR(50),
    riferimento VARCHAR(50), tipo VARCHAR(20), categoria SMALLINT, servizio VARCHAR(50),
    asset VARCHAR(50), cognome VARCHAR(50), nome VARCHAR(50), email VARCHAR(50),
    telefono VARCHAR(20), dettaglio VARCHAR(50), ict CHAR(1), non_fungibile CHAR(1),
    paese CHAR(2), data_inizio DATE, data_fine DATE)
LANGUAGE sql STABLE AS $$
    -- 1. servizi erogati (esclusi i dismessi)
    SELECT s.id_organizzazione, CAST(1 AS SMALLINT), CAST('servizi erogati' AS VARCHAR(30)),
           s.nome, CAST(NULL AS VARCHAR(50)), CAST(s.stato AS VARCHAR(20)), s.categoria_rilevanza,
           CAST(NULL AS VARCHAR(50)), CAST(NULL AS VARCHAR(50)),
           p.cognome, p.nome, p.email, p.telefono, s.descrizione,
           CAST(NULL AS CHAR(1)), CAST(NULL AS CHAR(1)), CAST(NULL AS CHAR(2)),
           CAST(NULL AS DATE), CAST(NULL AS DATE)
      FROM servizio s
      JOIN persona p ON p.id_persona = s.id_responsabile
     WHERE s.id_organizzazione = p_id_organizzazione
       AND s.stato <> 'dismesso'
    UNION ALL
    -- 2. asset critici: in esercizio, a supporto diretto di un servizio attivo con categoria >= soglia
    SELECT a.id_organizzazione, CAST(2 AS SMALLINT), CAST('asset critici' AS VARCHAR(30)),
           a.nome, a.codice_inventario, CAST(a.tipo AS VARCHAR(20)), s.categoria_rilevanza,
           s.nome, CAST(NULL AS VARCHAR(50)),
           p.cognome, p.nome, p.email, p.telefono, a.ubicazione,
           CAST(NULL AS CHAR(1)), CAST(NULL AS CHAR(1)), CAST(NULL AS CHAR(2)),
           CAST(NULL AS DATE), CAST(NULL AS DATE)
      FROM asset a
      JOIN asset_servizio x ON x.id_asset = a.id_asset
      JOIN servizio s ON s.id_servizio = x.id_servizio
      JOIN persona p ON p.id_persona = a.id_responsabile
     WHERE a.id_organizzazione = p_id_organizzazione
       AND a.stato = 'in_esercizio'
       AND s.stato = 'attivo'
       AND s.categoria_rilevanza >= p_soglia
    UNION ALL
    -- 3a. forniture in corso alla data, riferite a un servizio
    SELECT s.id_organizzazione, CAST(3 AS SMALLINT), CAST('dipendenze da terze parti' AS VARCHAR(30)),
           fo.ragione_sociale, f.riferimento_contratto, CAST(f.tipo_fornitura AS VARCHAR(20)), s.categoria_rilevanza,
           s.nome, CAST(NULL AS VARCHAR(50)),
           CAST(NULL AS VARCHAR(50)), CAST(NULL AS VARCHAR(50)), CAST(NULL AS VARCHAR(50)), CAST(NULL AS VARCHAR(20)),
           f.oggetto, f.fornitura_ict, f.fornitura_non_fungibile, fo.paese, f.data_inizio, f.data_fine
      FROM fornitura f
      JOIN fornitore fo ON fo.id_fornitore = f.id_fornitore
      JOIN servizio s ON s.id_servizio = f.id_servizio
     WHERE s.id_organizzazione = p_id_organizzazione
       AND f.data_inizio <= p_data
       AND (f.data_fine IS NULL OR f.data_fine >= p_data)
    UNION ALL
    -- 3b. forniture in corso alla data, riferite a un asset, con i servizi che l'asset supporta
    SELECT a.id_organizzazione, CAST(3 AS SMALLINT), CAST('dipendenze da terze parti' AS VARCHAR(30)),
           fo.ragione_sociale, f.riferimento_contratto, CAST(f.tipo_fornitura AS VARCHAR(20)), s.categoria_rilevanza,
           s.nome, a.nome,
           CAST(NULL AS VARCHAR(50)), CAST(NULL AS VARCHAR(50)), CAST(NULL AS VARCHAR(50)), CAST(NULL AS VARCHAR(20)),
           f.oggetto, f.fornitura_ict, f.fornitura_non_fungibile, fo.paese, f.data_inizio, f.data_fine
      FROM fornitura f
      JOIN fornitore fo ON fo.id_fornitore = f.id_fornitore
      JOIN asset a ON a.id_asset = f.id_asset
      LEFT JOIN asset_servizio x ON x.id_asset = a.id_asset
      LEFT JOIN servizio s ON s.id_servizio = x.id_servizio
     WHERE a.id_organizzazione = p_id_organizzazione
       AND f.data_inizio <= p_data
       AND (f.data_fine IS NULL OR f.data_fine >= p_data)
    UNION ALL
    -- 4. punti di contatto: incarichi NIS validi alla data
    SELECT i.id_organizzazione, CAST(4 AS SMALLINT), CAST('punti di contatto' AS VARCHAR(30)),
           o.denominazione, CAST(NULL AS VARCHAR(50)), CAST(i.ruolo AS VARCHAR(20)), CAST(NULL AS SMALLINT),
           CAST(NULL AS VARCHAR(50)), CAST(NULL AS VARCHAR(50)),
           p.cognome, p.nome, p.email, p.telefono, p.qualifica,
           CAST(NULL AS CHAR(1)), CAST(NULL AS CHAR(1)), CAST(NULL AS CHAR(2)), i.data_inizio, i.data_fine
      FROM incarico i
      JOIN persona p ON p.id_persona = i.id_persona
      JOIN organizzazione o ON o.id_organizzazione = i.id_organizzazione
     WHERE i.id_organizzazione = p_id_organizzazione
       AND i.data_inizio <= p_data
       AND (i.data_fine IS NULL OR i.data_fine >= p_data)
$$;
