Project work della laurea triennale in Informatica (L-31), traccia n. 19: progettare e realizzare una base dati relazionale per catalogare
asset, servizi, dipendenze e responsabilità utili alla compilazione dei profili richiesti dall'ACN nell'ambito della NIS2.
Il caso di studio è Cinetica Componenti S.p.A., un'azienda di fantasia che fabbrica componenti in plastica per autoveicoli ed è classificata come 
soggetto NIS "importante". Azienda, persone, fornitori, asset e valutazioni sono inventati; le persone hanno nomi di personaggi del cinema italiano.

Ordine di esecuzione
1. schema.sql              (crea tabelle, indici e vista)
2. seed.sql                (carica i dati; il log delle modifiche è ancora vuoto)
3. trigger_postgresql.sql  (facoltativo, solo PostgreSQL: da qui in poi le modifiche sono registrate)
4. funzione_postgresql.sql (facoltativo, solo PostgreSQL)
Poi, in qualsiasi ordine: queries.sql, controlli.sql, dml.sql. Per ricominciare: drop.sql, poi di nuovo i punti 1–4.

Il seed va caricato prima dei trigger. Il file dei trigger si esegue una sola volta per database. Su un altro prodotto SQL si eseguono solo i primi due file
e i file senza il suffisso _postgresql.
Il CSV lo crea il client (lo standard SQL non scrive file). Con psql, dalla cartella sql, dalla funzione:
psql -d nis2 -c "\copy (SELECT sezione, elemento, riferimento, tipo, categoria, servizio, asset, cognome, nome, email, telefono, dettaglio, ict, 
non_fungibile, paese, data_inizio, data_fine FROM profilo_acn(1, 3, DATE '2026-11-18') ORDER BY ordine, categoria DESC, elemento, servizio, asset) 
TO '../output/profilo_acn.csv' WITH (FORMAT csv, HEADER, DELIMITER ';', ENCODING 'UTF8')"
oppure, con qualsiasi client, si esegue l'interrogazione 10 di queries.sql (dalla vista) e si usa la funzione di esportazione del client (per esempio pgAdmin).
I due metodi producono lo stesso file. Parametri della funzione: organizzazione, soglia di categoria degli asset critici (3 se omessa), data di riferimento 
per incarichi e forniture in corso (oggi se omessa).

Linee guida per il popolamento e la manutenzione
1.	Inserire: assegnare gli id con INSERT … SELECT COALESCE(MAX(id),0)+1 … (schema in dml.sql); riferire le altre tabelle con chiave naturale
2.  (email, codice di inventario, nome del servizio) tramite sottoselect. Ordine: fornitori e persone, servizi e asset, poi i collegamenti
3.  (asset_servizio, dipendenza_asset), forniture, incarichi.
4.	Aggiornare, non cancellare: cambiare stato, categoria_rilevanza, data_fine; cancellare solo per correggere un errore di inserimento, prima i collegamenti
5.	e poi la riga referenziata (non c'è ON DELETE).
6.	Avvicendamenti: chiudere l'incarico in corso (data_fine) e aprirne uno nuovo; la base dati non impedisce la sovrapposizione, la rileva controlli.sql.
7.	Assessment: un assessment si chiude valorizzando data_consolidamento, dopo aver valutato le 37 misure di base; da quel momento non si modifica (controlli 4 e 5).
8.	Un nuovo assessment parte da zero.
9.	Dopo ogni modifica eseguire controlli.sql: ogni riga restituita è un'anomalia.
10.	Storico: con i trigger attivi ogni modifica è registrata in log_modifiche (tabella, chiave, riga prima e dopo, utente, data e ora).
11.	Lo stato passato si legge a mano da dati_prima e dati_dopo; non ci sono interrogazioni "alla data X".

