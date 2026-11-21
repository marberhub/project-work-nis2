-- ****************************************************************************
-- trigger_postgresql.sql — Storico delle modifiche (SINTASSI POSTGRESQL)
--
-- Scrive in log_modifiche una riga per ogni INSERT, UPDATE o DELETE 
-- sulle 12 tabelle dei dati (tutte tranne sottocategoria, che è un 
-- riferimento caricato dal Core).
--   * nome_tabella = tabella modificata; chiave = chiave primaria nella
--     forma colonna=valore (più colonne separate da virgola);
--   * dati_prima / dati_dopo = riga in formato JSON (testo), vuoti dove
--     non esistono (INSERT: dati_prima; DELETE: dati_dopo);
--   * id_log = MAX+1, come per gli altri identificativi (limite:
--     accessi concorrenti); utente e data_ora hanno il valore predefinito
--     della tabella (CURRENT_USER e CURRENT_TIMESTAMP).
-- Un UPDATE che non cambia nulla non scrive nel log.
-- ****************************************************************************

CREATE OR REPLACE FUNCTION log_modifica() RETURNS TRIGGER AS $$
DECLARE
    v_riga   JSONB;
    v_chiave VARCHAR(100) := '';
    v_colonna TEXT;
    v_prima  TEXT := NULL;
    v_dopo   TEXT := NULL;
BEGIN
    IF TG_OP = 'UPDATE' AND OLD IS NOT DISTINCT FROM NEW THEN
        RETURN NULL;                              -- nessuna modifica effettiva
    END IF;
    IF TG_OP = 'DELETE' THEN
        v_riga := to_jsonb(OLD);
        v_prima := CAST(v_riga AS TEXT);
    ELSIF TG_OP = 'INSERT' THEN
        v_riga := to_jsonb(NEW);
        v_dopo := CAST(v_riga AS TEXT);
    ELSE
        v_riga := to_jsonb(NEW);
        v_prima := CAST(to_jsonb(OLD) AS TEXT);
        v_dopo := CAST(v_riga AS TEXT);
    END IF;
    -- le colonne della chiave arrivano come argomenti del trigger
    FOREACH v_colonna IN ARRAY TG_ARGV LOOP
        IF v_chiave <> '' THEN
            v_chiave := v_chiave || ',';
        END IF;
        v_chiave := v_chiave || v_colonna || '=' || (v_riga ->> v_colonna);
    END LOOP;
    INSERT INTO log_modifiche (id_log, nome_tabella, chiave, operazione, dati_prima, dati_dopo)
    SELECT COALESCE(MAX(id_log), 0) + 1, TG_TABLE_NAME, v_chiave, TG_OP, v_prima, v_dopo
      FROM log_modifiche;
    RETURN NULL;                                  -- trigger AFTER: il valore restituito è ignorato
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_log_organizzazione AFTER INSERT OR UPDATE OR DELETE ON organizzazione
    FOR EACH ROW EXECUTE FUNCTION log_modifica('id_organizzazione');
CREATE TRIGGER trg_log_persona AFTER INSERT OR UPDATE OR DELETE ON persona
    FOR EACH ROW EXECUTE FUNCTION log_modifica('id_persona');
CREATE TRIGGER trg_log_incarico AFTER INSERT OR UPDATE OR DELETE ON incarico
    FOR EACH ROW EXECUTE FUNCTION log_modifica('id_incarico');
CREATE TRIGGER trg_log_servizio AFTER INSERT OR UPDATE OR DELETE ON servizio
    FOR EACH ROW EXECUTE FUNCTION log_modifica('id_servizio');
CREATE TRIGGER trg_log_asset AFTER INSERT OR UPDATE OR DELETE ON asset
    FOR EACH ROW EXECUTE FUNCTION log_modifica('id_asset');
CREATE TRIGGER trg_log_fornitore AFTER INSERT OR UPDATE OR DELETE ON fornitore
    FOR EACH ROW EXECUTE FUNCTION log_modifica('id_fornitore');
CREATE TRIGGER trg_log_fornitura AFTER INSERT OR UPDATE OR DELETE ON fornitura
    FOR EACH ROW EXECUTE FUNCTION log_modifica('id_fornitura');
CREATE TRIGGER trg_log_assessment AFTER INSERT OR UPDATE OR DELETE ON assessment
    FOR EACH ROW EXECUTE FUNCTION log_modifica('id_assessment');
CREATE TRIGGER trg_log_valutazione AFTER INSERT OR UPDATE OR DELETE ON valutazione
    FOR EACH ROW EXECUTE FUNCTION log_modifica('id_assessment', 'codice_sottocategoria');
CREATE TRIGGER trg_log_evidenza AFTER INSERT OR UPDATE OR DELETE ON evidenza
    FOR EACH ROW EXECUTE FUNCTION log_modifica('id_evidenza');
CREATE TRIGGER trg_log_asset_servizio AFTER INSERT OR UPDATE OR DELETE ON asset_servizio
    FOR EACH ROW EXECUTE FUNCTION log_modifica('id_asset', 'id_servizio');
CREATE TRIGGER trg_log_dipendenza_asset AFTER INSERT OR UPDATE OR DELETE ON dipendenza_asset
    FOR EACH ROW EXECUTE FUNCTION log_modifica('id_asset_dipendente', 'id_asset_richiesto');
