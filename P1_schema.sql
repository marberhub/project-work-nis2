-- ****************************************************************************
-- Caso di studio: Cinetica Componenti S.p.A. (azienda fittizia)
-- Base dati per i profili ACN (NIS2)
-- ****************************************************************************

-- organizzazione: l'azienda che compila i profili ACN 
CREATE TABLE organizzazione (
    id_organizzazione    INTEGER NOT NULL,            -- identificativo
    denominazione        VARCHAR(50) NOT NULL,        -- denominazione sociale
    codice_fiscale       VARCHAR(16) NOT NULL,        -- codice fiscale o partita IVA
    indirizzo_sede_legale VARCHAR(50) NOT NULL,       -- indirizzo della sede legale
    telefono             VARCHAR(20) NOT NULL,        -- telefono della sede
    email                VARCHAR(50) NOT NULL,        -- email ordinaria
    domicilio_digitale   VARCHAR(50) NOT NULL,        -- indirizzo PEC
    classificazione_nis  VARCHAR(10) NOT NULL,        -- essenziale o importante
    CONSTRAINT pk_organizzazione PRIMARY KEY (id_organizzazione),
    CONSTRAINT uq_org_codfisc UNIQUE (codice_fiscale),
    CONSTRAINT ck_org_codfisc CHECK (CHAR_LENGTH(codice_fiscale) IN (11, 16)),
    CONSTRAINT ck_org_email CHECK (email LIKE '%@%'),
    CONSTRAINT ck_org_pec CHECK (domicilio_digitale LIKE '%@%'),
    CONSTRAINT ck_org_nis CHECK (classificazione_nis IN ('essenziale', 'importante'))
);

-- fornitore: terze parti che forniscono prodotti o servizi 
CREATE TABLE fornitore (
    id_fornitore         INTEGER NOT NULL,            -- identificativo
    ragione_sociale      VARCHAR(50) NOT NULL,        -- ragione sociale
    identificativo_fiscale VARCHAR(20) NOT NULL,      -- partita IVA o equivalente estero
    paese                CHAR(2) NOT NULL,            -- codice paese 
    CONSTRAINT pk_fornitore PRIMARY KEY (id_fornitore),
    CONSTRAINT uq_fornitore_idfisc UNIQUE (identificativo_fiscale),
    CONSTRAINT ck_fornitore_paese CHECK (paese = UPPER(paese))
);

-- persona: personale interno e referenti dei fornitori
CREATE TABLE persona (
    id_persona           INTEGER NOT NULL,            -- identificativo
    nome                 VARCHAR(50) NOT NULL,        -- nome
    cognome              VARCHAR(50) NOT NULL,        -- cognome
    qualifica            VARCHAR(50) NOT NULL,        -- qualifica o ruolo aziendale
    email                VARCHAR(50) NOT NULL,        -- email, chiave naturale della persona
    telefono             VARCHAR(20) NOT NULL,        -- telefono
    id_fornitore         INTEGER,                     -- fornitore di appartenenza; vuoto per il personale interno
    CONSTRAINT pk_persona PRIMARY KEY (id_persona),
    CONSTRAINT uq_persona_email UNIQUE (email),
    CONSTRAINT ck_persona_email CHECK (email LIKE '%@%'),
    CONSTRAINT fk_persona_fornitore FOREIGN KEY (id_fornitore) REFERENCES fornitore (id_fornitore)
);
CREATE INDEX ix_persona_fornitore ON persona (id_fornitore);

-- incarico: ruoli NIS (punto di contatto, sostituto, referente CSIRT) con periodo di validità
CREATE TABLE incarico (
    id_incarico          INTEGER NOT NULL,            -- identificativo
    id_organizzazione    INTEGER NOT NULL,            -- organizzazione
    id_persona           INTEGER NOT NULL,            -- persona incaricata
    ruolo                VARCHAR(20) NOT NULL,        -- PDC, SOST_PDC, REF_CSIRT, SOST_REF_CSIRT
    data_inizio          DATE NOT NULL,               -- primo giorno dell'incarico
    data_fine            DATE,                        -- ultimo giorno; vuoto se l'incarico è in corso
    CONSTRAINT pk_incarico PRIMARY KEY (id_incarico),
    CONSTRAINT ck_incarico_ruolo CHECK (ruolo IN ('PDC', 'SOST_PDC', 'REF_CSIRT', 'SOST_REF_CSIRT')),
    CONSTRAINT ck_incarico_date CHECK (data_fine IS NULL OR data_fine >= data_inizio),
    CONSTRAINT fk_incarico_org FOREIGN KEY (id_organizzazione) REFERENCES organizzazione (id_organizzazione),
    CONSTRAINT fk_incarico_persona FOREIGN KEY (id_persona) REFERENCES persona (id_persona)
);
CREATE INDEX ix_incarico_org ON incarico (id_organizzazione);
CREATE INDEX ix_incarico_persona ON incarico (id_persona);

-- servizio: attività e servizi erogati, con categoria di rilevanza
CREATE TABLE servizio (
    id_servizio          INTEGER NOT NULL,            -- identificativo
    id_organizzazione    INTEGER NOT NULL,            -- organizzazione che eroga il servizio
    nome                 VARCHAR(50) NOT NULL,        -- nome del servizio
    descrizione          VARCHAR(50) NOT NULL,        -- descrizione breve
    categoria_rilevanza  SMALLINT NOT NULL,           -- 1 minimo, 2 basso, 3 medio, 4 alto
    stato                VARCHAR(10) NOT NULL DEFAULT 'attivo', -- attivo, sospeso, dismesso
    id_responsabile      INTEGER NOT NULL,            -- persona responsabile
    CONSTRAINT pk_servizio PRIMARY KEY (id_servizio),
    CONSTRAINT uq_servizio_nome UNIQUE (id_organizzazione, nome),
    CONSTRAINT ck_servizio_cat CHECK (categoria_rilevanza BETWEEN 1 AND 4),
    CONSTRAINT ck_servizio_stato CHECK (stato IN ('attivo', 'sospeso', 'dismesso')),
    CONSTRAINT fk_servizio_org FOREIGN KEY (id_organizzazione) REFERENCES organizzazione (id_organizzazione),
    CONSTRAINT fk_servizio_resp FOREIGN KEY (id_responsabile) REFERENCES persona (id_persona)
);
CREATE INDEX ix_servizio_resp ON servizio (id_responsabile);

-- asset: risorse informatiche e industriali dell'inventario
CREATE TABLE asset (
    id_asset             INTEGER NOT NULL,            -- identificativo
    id_organizzazione    INTEGER NOT NULL,            -- organizzazione proprietaria
    codice_inventario    VARCHAR(10) NOT NULL,        -- codice di inventario, chiave naturale
    nome                 VARCHAR(50) NOT NULL,        -- nome dell'asset
    descrizione          VARCHAR(50),                 -- descrizione breve
    tipo                 VARCHAR(20) NOT NULL,        -- hardware, software, dati, rete, servizio_cloud, sito_fisico, sistema_industriale
    stato                VARCHAR(15) NOT NULL,        -- pianificato, in_esercizio, dismesso
    ubicazione           VARCHAR(50),                 -- dove si trova; vuoto per gli asset non fisici
    id_responsabile      INTEGER NOT NULL,            -- persona responsabile
    CONSTRAINT pk_asset PRIMARY KEY (id_asset),
    CONSTRAINT uq_asset_codice UNIQUE (id_organizzazione, codice_inventario),
    CONSTRAINT ck_asset_tipo CHECK (tipo IN ('hardware', 'software', 'dati', 'rete', 'servizio_cloud', 'sito_fisico', 'sistema_industriale')),
    CONSTRAINT ck_asset_stato CHECK (stato IN ('pianificato', 'in_esercizio', 'dismesso')),
    CONSTRAINT fk_asset_org FOREIGN KEY (id_organizzazione) REFERENCES organizzazione (id_organizzazione),
    CONSTRAINT fk_asset_resp FOREIGN KEY (id_responsabile) REFERENCES persona (id_persona)
);
CREATE INDEX ix_asset_resp ON asset (id_responsabile);

-- asset_servizio: quali asset supportano direttamente quali servizi (N:M)
CREATE TABLE asset_servizio (
    id_asset             INTEGER NOT NULL,            -- asset che supporta il servizio
    id_servizio          INTEGER NOT NULL,            -- servizio supportato
    ruolo                VARCHAR(50),                 -- funzione dell'asset nel servizio
    CONSTRAINT pk_asset_servizio PRIMARY KEY (id_asset, id_servizio),
    CONSTRAINT fk_assserv_asset FOREIGN KEY (id_asset) REFERENCES asset (id_asset),
    CONSTRAINT fk_assserv_servizio FOREIGN KEY (id_servizio) REFERENCES servizio (id_servizio)
);
CREATE INDEX ix_assserv_servizio ON asset_servizio (id_servizio);

-- dipendenza_asset: un asset ha bisogno di un altro asset (N:M su asset)
CREATE TABLE dipendenza_asset (
    id_asset_dipendente  INTEGER NOT NULL,            -- asset che ha bisogno dell'altro
    id_asset_richiesto   INTEGER NOT NULL,            -- asset richiesto
    tipo_dipendenza      VARCHAR(20) NOT NULL,        -- funzionale, dati, rete, infrastruttura
    CONSTRAINT pk_dipendenza PRIMARY KEY (id_asset_dipendente, id_asset_richiesto),
    CONSTRAINT ck_dip_diversi CHECK (id_asset_dipendente <> id_asset_richiesto),
    CONSTRAINT ck_dip_tipo CHECK (tipo_dipendenza IN ('funzionale', 'dati', 'rete', 'infrastruttura')),
    CONSTRAINT fk_dip_dipendente FOREIGN KEY (id_asset_dipendente) REFERENCES asset (id_asset),
    CONSTRAINT fk_dip_richiesto FOREIGN KEY (id_asset_richiesto) REFERENCES asset (id_asset)
);
CREATE INDEX ix_dip_richiesto ON dipendenza_asset (id_asset_richiesto);

-- fornitura: prodotto o servizio erogato da un fornitore, riferito a un asset o un servizio
CREATE TABLE fornitura (
    id_fornitura         INTEGER NOT NULL,            -- identificativo
    id_fornitore         INTEGER NOT NULL,            -- fornitore
    id_asset             INTEGER,                     -- asset a cui si riferisce (alternativo a id_servizio)
    id_servizio          INTEGER,                     -- servizio a cui si riferisce (alternativo a id_asset)
    tipo_fornitura       VARCHAR(20) NOT NULL,        -- cloud, software, hardware, connettivita, manutenzione, sicurezza, logistica, consulenza, altro
    oggetto              VARCHAR(50) NOT NULL,        -- oggetto della fornitura
    riferimento_contratto VARCHAR(50),                -- estremi del contratto
    data_inizio          DATE NOT NULL,               -- inizio della fornitura
    data_fine            DATE,                        -- fine; vuota se la fornitura è in corso
    fornitura_ict        CHAR(1) NOT NULL DEFAULT 'N', -- S se è una fornitura ICT
    fornitura_non_fungibile CHAR(1) NOT NULL DEFAULT 'N', -- S se il fornitore non è sostituibile facilmente
    CONSTRAINT pk_fornitura PRIMARY KEY (id_fornitura),
    CONSTRAINT ck_fornitura_arco CHECK ((id_asset IS NOT NULL AND id_servizio IS NULL) OR (id_asset IS NULL AND id_servizio IS NOT NULL)),
    CONSTRAINT ck_fornitura_tipo CHECK (tipo_fornitura IN ('cloud', 'software', 'hardware', 'connettivita', 'manutenzione', 'sicurezza', 'logistica', 'consulenza', 'altro')),
    CONSTRAINT ck_fornitura_date CHECK (data_fine IS NULL OR data_fine >= data_inizio),
    CONSTRAINT ck_fornitura_ict CHECK (fornitura_ict IN ('S', 'N')),
    CONSTRAINT ck_fornitura_nonfung CHECK (fornitura_non_fungibile IN ('S', 'N')),
    CONSTRAINT fk_fornitura_fornitore FOREIGN KEY (id_fornitore) REFERENCES fornitore (id_fornitore),
    CONSTRAINT fk_fornitura_asset FOREIGN KEY (id_asset) REFERENCES asset (id_asset),
    CONSTRAINT fk_fornitura_servizio FOREIGN KEY (id_servizio) REFERENCES servizio (id_servizio)
);
CREATE INDEX ix_fornitura_fornitore ON fornitura (id_fornitore);
CREATE INDEX ix_fornitura_asset ON fornitura (id_asset);
CREATE INDEX ix_fornitura_servizio ON fornitura (id_servizio);

-- sottocategoria: sottocategorie del Core del Framework Nazionale (tabella di riferimento)
CREATE TABLE sottocategoria (
    codice               VARCHAR(11) NOT NULL,        -- codice del Core, per esempio ID.AM-01
    descrizione          VARCHAR(300) NOT NULL,       -- testo ufficiale della sottocategoria
    misura_base_importanti CHAR(1) NOT NULL DEFAULT 'N', -- S se è una misura di base per i soggetti importanti
    CONSTRAINT pk_sottocategoria PRIMARY KEY (codice),
    CONSTRAINT ck_sottocat_codice CHECK (codice LIKE '__.__-__' OR codice LIKE 'DP-__.__-__'),
    CONSTRAINT ck_sottocat_misura CHECK (misura_base_importanti IN ('S', 'N'))
);

-- assessment: valutazione del profilo attuale, a una data
CREATE TABLE assessment (
    id_assessment        INTEGER NOT NULL,            -- identificativo
    id_organizzazione    INTEGER NOT NULL,            -- organizzazione valutata
    id_assessor          INTEGER NOT NULL,            -- persona che conduce la valutazione
    data_inizio          DATE NOT NULL,               -- inizio della valutazione
    data_consolidamento  DATE,                        -- chiusura; vuota se la valutazione è in corso
    CONSTRAINT pk_assessment PRIMARY KEY (id_assessment),
    CONSTRAINT ck_assess_date CHECK (data_consolidamento IS NULL OR data_consolidamento >= data_inizio),
    CONSTRAINT fk_assess_org FOREIGN KEY (id_organizzazione) REFERENCES organizzazione (id_organizzazione),
    CONSTRAINT fk_assess_assessor FOREIGN KEY (id_assessor) REFERENCES persona (id_persona)
);
CREATE INDEX ix_assess_org ON assessment (id_organizzazione);
CREATE INDEX ix_assess_assessor ON assessment (id_assessor);

-- valutazione: grado di copertura e livello di maturità di una sottocategoria in un assessment
CREATE TABLE valutazione (
    id_assessment        INTEGER NOT NULL,            -- assessment
    codice_sottocategoria VARCHAR(11) NOT NULL,       -- sottocategoria valutata
    grado_copertura      NUMERIC(2,1) NOT NULL,       -- 0, 0.2, 0.4, 0.6, 0.8 oppure 1
    livello_maturita     SMALLINT,                    -- da 1 a 5; vuoto se la copertura è 0
    note                 VARCHAR(50),                 -- note dell'assessor
    CONSTRAINT pk_valutazione PRIMARY KEY (id_assessment, codice_sottocategoria),
    CONSTRAINT ck_valut_grado CHECK (grado_copertura IN (0, 0.2, 0.4, 0.6, 0.8, 1)),
    CONSTRAINT ck_valut_livello CHECK (livello_maturita BETWEEN 1 AND 5),
    CONSTRAINT ck_valut_coerenza CHECK ((grado_copertura = 0 AND livello_maturita IS NULL) OR (grado_copertura > 0 AND livello_maturita IS NOT NULL)),
    CONSTRAINT fk_valut_assessment FOREIGN KEY (id_assessment) REFERENCES assessment (id_assessment),
    CONSTRAINT fk_valut_sottocat FOREIGN KEY (codice_sottocategoria) REFERENCES sottocategoria (codice)
);
CREATE INDEX ix_valut_sottocat ON valutazione (codice_sottocategoria);

-- evidenza: documento o dato che sostiene una valutazione, con eventuale asset collegato
CREATE TABLE evidenza (
    id_evidenza          INTEGER NOT NULL,            -- identificativo
    id_assessment        INTEGER NOT NULL,            -- assessment della valutazione
    codice_sottocategoria VARCHAR(11) NOT NULL,       -- sottocategoria della valutazione
    id_asset             INTEGER,                     -- asset a cui si riferisce l'evidenza
    descrizione          VARCHAR(50) NOT NULL,        -- che cosa documenta
    riferimento          VARCHAR(50),                 -- percorso o indirizzo del documento
    CONSTRAINT pk_evidenza PRIMARY KEY (id_evidenza),
    CONSTRAINT fk_evid_valutazione FOREIGN KEY (id_assessment, codice_sottocategoria) REFERENCES valutazione (id_assessment, codice_sottocategoria),
    CONSTRAINT fk_evid_asset FOREIGN KEY (id_asset) REFERENCES asset (id_asset)
);
CREATE INDEX ix_evid_valutazione ON evidenza (id_assessment, codice_sottocategoria);
CREATE INDEX ix_evid_asset ON evidenza (id_asset);

-- log_modifiche: storico delle modifiche ai dati, scritto dai trigger (nessuna chiave esterna)
CREATE TABLE log_modifiche (
    id_log               INTEGER NOT NULL,            -- identificativo, calcolato come MAX+1 dal trigger
    nome_tabella         VARCHAR(30) NOT NULL,        -- tabella modificata
    chiave               VARCHAR(100) NOT NULL,       -- chiave primaria della riga, nella forma colonna=valore
    operazione           VARCHAR(6) NOT NULL,         -- INSERT, UPDATE o DELETE
    dati_prima           VARCHAR(2000),               -- riga prima della modifica; vuota per INSERT
    dati_dopo            VARCHAR(2000),               -- riga dopo la modifica; vuota per DELETE
    utente               VARCHAR(50) NOT NULL DEFAULT CURRENT_USER, -- utente del database
    data_ora             TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, -- data e ora della modifica
    CONSTRAINT pk_log_modifiche PRIMARY KEY (id_log),
    CONSTRAINT ck_log_operazione CHECK (operazione IN ('INSERT', 'UPDATE', 'DELETE'))
);
CREATE INDEX ix_log_tabella ON log_modifiche (nome_tabella, chiave);

-- ---------------------------------------------------------------------
-- v_profilo_acn: vista di esportazione per il profilo ACN 
-- Quattro sezioni unite con UNION ALL, senza ordinamento e senza filtri
-- sulle date: incarichi e forniture compaiono con data_inizio e data_fine
-- (vuote per servizi e asset). Chi la usa filtra con id_organizzazione e
-- con la data che gli serve. Soglia degli asset critici: categoria >= 3.
-- Non si usano concatenazioni: cognome e nome sono colonne separate.
-- ---------------------------------------------------------------------
CREATE VIEW v_profilo_acn AS
-- 1. servizi erogati (esclusi i dismessi)
SELECT s.id_organizzazione AS id_organizzazione,
       CAST(1 AS SMALLINT) AS ordine,
       CAST('servizi erogati' AS VARCHAR(30)) AS sezione,
       s.nome AS elemento,
       CAST(NULL AS VARCHAR(50)) AS riferimento,
       CAST(s.stato AS VARCHAR(20)) AS tipo,
       s.categoria_rilevanza AS categoria,
       CAST(NULL AS VARCHAR(50)) AS servizio,
       CAST(NULL AS VARCHAR(50)) AS asset,
       p.cognome AS cognome,
       p.nome AS nome,
       p.email AS email,
       p.telefono AS telefono,
       s.descrizione AS dettaglio,
       CAST(NULL AS CHAR(1)) AS ict,
       CAST(NULL AS CHAR(1)) AS non_fungibile,
       CAST(NULL AS CHAR(2)) AS paese,
       CAST(NULL AS DATE) AS data_inizio,
       CAST(NULL AS DATE) AS data_fine
  FROM servizio s
  JOIN persona p ON p.id_persona = s.id_responsabile
 WHERE s.stato <> 'dismesso'
UNION ALL
-- 2. asset critici: asset in esercizio che supportano direttamente un servizio attivo di categoria >= 3
SELECT a.id_organizzazione,
       CAST(2 AS SMALLINT),
       CAST('asset critici' AS VARCHAR(30)),
       a.nome,
       a.codice_inventario,
       CAST(a.tipo AS VARCHAR(20)),
       s.categoria_rilevanza,
       s.nome,
       CAST(NULL AS VARCHAR(50)),
       p.cognome,
       p.nome,
       p.email,
       p.telefono,
       a.ubicazione,
       CAST(NULL AS CHAR(1)),
       CAST(NULL AS CHAR(1)),
       CAST(NULL AS CHAR(2)),
       CAST(NULL AS DATE),
       CAST(NULL AS DATE)
  FROM asset a
  JOIN asset_servizio x ON x.id_asset = a.id_asset
  JOIN servizio s ON s.id_servizio = x.id_servizio
  JOIN persona p ON p.id_persona = a.id_responsabile
 WHERE a.stato = 'in_esercizio'
   AND s.stato = 'attivo'
   AND s.categoria_rilevanza >= 3
UNION ALL
-- 3a. dipendenze da terze parti: forniture riferite a un servizio
SELECT s.id_organizzazione,
       CAST(3 AS SMALLINT),
       CAST('dipendenze da terze parti' AS VARCHAR(30)),
       fo.ragione_sociale,
       f.riferimento_contratto,
       CAST(f.tipo_fornitura AS VARCHAR(20)),
       s.categoria_rilevanza,
       s.nome,
       CAST(NULL AS VARCHAR(50)),
       CAST(NULL AS VARCHAR(50)),
       CAST(NULL AS VARCHAR(50)),
       CAST(NULL AS VARCHAR(50)),
       CAST(NULL AS VARCHAR(20)),
       f.oggetto,
       f.fornitura_ict,
       f.fornitura_non_fungibile,
       fo.paese,
       f.data_inizio,
       f.data_fine
  FROM fornitura f
  JOIN fornitore fo ON fo.id_fornitore = f.id_fornitore
  JOIN servizio s ON s.id_servizio = f.id_servizio
UNION ALL
-- 3b. dipendenze da terze parti: forniture riferite a un asset, con i servizi che l'asset supporta direttamente
SELECT a.id_organizzazione,
       CAST(3 AS SMALLINT),
       CAST('dipendenze da terze parti' AS VARCHAR(30)),
       fo.ragione_sociale,
       f.riferimento_contratto,
       CAST(f.tipo_fornitura AS VARCHAR(20)),
       s.categoria_rilevanza,
       s.nome,
       a.nome,
       CAST(NULL AS VARCHAR(50)),
       CAST(NULL AS VARCHAR(50)),
       CAST(NULL AS VARCHAR(50)),
       CAST(NULL AS VARCHAR(20)),
       f.oggetto,
       f.fornitura_ict,
       f.fornitura_non_fungibile,
       fo.paese,
       f.data_inizio,
       f.data_fine
  FROM fornitura f
  JOIN fornitore fo ON fo.id_fornitore = f.id_fornitore
  JOIN asset a ON a.id_asset = f.id_asset
  LEFT JOIN asset_servizio x ON x.id_asset = a.id_asset
  LEFT JOIN servizio s ON s.id_servizio = x.id_servizio
UNION ALL
-- 4. punti di contatto: incarichi NIS (tutti, con le date)
SELECT i.id_organizzazione,
       CAST(4 AS SMALLINT),
       CAST('punti di contatto' AS VARCHAR(30)),
       o.denominazione,
       CAST(NULL AS VARCHAR(50)),
       CAST(i.ruolo AS VARCHAR(20)),
       CAST(NULL AS SMALLINT),
       CAST(NULL AS VARCHAR(50)),
       CAST(NULL AS VARCHAR(50)),
       p.cognome,
       p.nome,
       p.email,
       p.telefono,
       p.qualifica,
       CAST(NULL AS CHAR(1)),
       CAST(NULL AS CHAR(1)),
       CAST(NULL AS CHAR(2)),
       i.data_inizio,
       i.data_fine
  FROM incarico i
  JOIN persona p ON p.id_persona = i.id_persona
  JOIN organizzazione o ON o.id_organizzazione = i.id_organizzazione;
