-- ****************************************************************************
-- Elimina tutte le tabelle dello schema
-- Nota:
-- Le tabelle vanno eliminate dalle dipendenti alle referenziate, perché
-- le chiavi esterne non hanno la clausola ON DELETE. Gli indici sono
-- eliminati con la rispettiva tabella.
-- ****************************************************************************

DROP VIEW v_profilo_acn;
DROP TABLE log_modifiche;
DROP TABLE evidenza;
DROP TABLE valutazione;
DROP TABLE assessment;
DROP TABLE sottocategoria;
DROP TABLE fornitura;
DROP TABLE dipendenza_asset;
DROP TABLE asset_servizio;
DROP TABLE asset;
DROP TABLE servizio;
DROP TABLE incarico;
DROP TABLE persona;
DROP TABLE fornitore;
DROP TABLE organizzazione;
