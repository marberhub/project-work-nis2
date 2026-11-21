-- ****************************************************************************
-- seed.sql — Dati di esempio: Cinetica Componenti S.p.A. (azienda fittizia)
-- ****************************************************************************

-- 1. Sottocategorie del Core (115), con le 37 misure di base per i soggetti importanti
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('GV.OC-01', 'La missione dell''organizzazione è compresa e informa la gestione del rischio di cybersecurity.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('GV.OC-02', 'Gli stakeholder interni ed esterni sono noti e le loro esigenze e aspettative riguardo la gestione del rischio di cybersecurity sono comprese e considerate.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('GV.OC-03', 'I requisiti legali, normativi e contrattuali riguardanti la cybersecurity, compresi gli obblighi in materia di privacy e libertà civili, sono compresi e gestiti.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('GV.OC-04', 'Gli obiettivi, le capacità e i servizi critici dai quali gli stakeholder dipendono o che si aspettano dall''organizzazione sono compresi e comunicati.', 'S');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('GV.OC-05', 'I risultati, le capacità e i servizi dai quali l''organizzazione dipende sono compresi e comunicati.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('GV.RM-01', 'Gli obiettivi di gestione del rischio sono stabiliti e accettati dagli stakeholder dell''organizzazione.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('GV.RM-02', 'Le dichiarazioni sulla tolleranza e la propensione al rischio sono stabilite, comunicate e mantenute.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('GV.RM-03', 'Le attività e gli esiti della gestione del rischio di cybersecurity sono parte integrante dei processi di gestione del rischio dell''organizzazione.', 'S');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('GV.RM-04', 'È stabilita e comunicata la direzione strategica che descrive le opzioni appropriate di risposta al rischio.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('GV.RM-05', 'Sono stabiliti canali di comunicazione in tutta l''organizzazione per il rischio di cybersecurity, incluso il rischio derivante dai fornitori e da altre terze parti.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('GV.RM-06', 'È stabilito e comunicato un metodo standardizzato per calcolare, documentare, categorizzare e prioritizzare i rischi di cybersecurity.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('GV.RM-07', 'Le opportunità strategiche (i.e. i rischi positivi) sono caratterizzate e incluse nelle discussioni sul rischio di cybersecurity dell''organizzazione.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('GV.RR-01', 'Gli organi di amministrazione e direttivi sono responsabili e rispondono (accountable) per il rischio di cybersecurity e promuovono una cultura consapevole del rischio, etica e in continuo miglioramento.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('GV.RR-02', 'I ruoli, le responsabilità e i correlati poteri relativi alla gestione del rischio di cybersecurity sono stabiliti, comunicati, compresi e applicati.', 'S');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('GV.RR-03', 'Sono allocate risorse adeguate, in misura commisurata alla strategia di gestione del rischio di cybersecurity, ai ruoli, alle responsabilità e alle politiche.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('GV.RR-04', 'La cybersecurity è inclusa nelle pratiche delle risorse umane.', 'S');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('DP-GV.RR-05', 'I ruoli, le responsabilità e i correlati poteri inerenti al trattamento e la protezione dei dati personali sono stabiliti, comunicati, compresi e applicati.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('GV.PO-01', 'La politica per la gestione del rischio di cybersecurity è stabilita in base al contesto organizzativo, alla strategia di cybersecurity e alle priorità, ed è comunicata e applicata.', 'S');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('GV.PO-02', 'La politica per la gestione del rischio di cybersecurity è revisionata, aggiornata, comunicata e applicata per riflettere i cambiamenti nei requisiti, nelle minacce, nella tecnologia e nella missione dell''organizzazione.', 'S');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('GV.OV-01', 'I risultati della strategia di gestione del rischio di cybersecurity sono revisionati per informare e adeguare la strategia e la direzione.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('GV.OV-02', 'La strategia di gestione del rischio di cybersecurity è revisionata e adeguata per garantire la copertura dei requisiti e dei rischi dell''organizzazione.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('GV.OV-03', 'Le prestazioni relative alla gestione del rischio di cybersecurity dell''organizzazione sono valutate e revisionate per gli adeguamenti necessari.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('GV.SC-01', 'Sono stabiliti e accettati dagli stakeholder dell''organizzazione il programma, la strategia, gli obiettivi, le politiche e i processi di gestione del rischio di cybersecurity della catena di approvvigionamento.', 'S');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('GV.SC-02', 'I ruoli e le responsabilità in materia di cybersecurity per fornitori, clienti e partner sono stabiliti, comunicati e coordinati internamente ed esternamente.', 'S');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('GV.SC-03', 'La gestione del rischio di cybersecurity della catena di approvvigionamento è integrata nella gestione del rischio dell''organizzazione e di cybersecurity, nella valutazione del rischio e nei processi di miglioramento.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('GV.SC-04', 'I fornitori sono noti e prioritizzati in base alla criticità.', 'S');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('GV.SC-05', 'I requisiti per affrontare i rischi di cybersecurity nella catena di approvvigionamento sono stabiliti, prioritizzati e integrati nei contratti e in altri tipi di accordi con i fornitori e altre terze parti rilevanti.', 'S');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('GV.SC-06', 'Pianificazione e due diligence sono svolte per ridurre i rischi prima di intraprendere rapporti formali con i fornitori o altre terze parti.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('GV.SC-07', 'I rischi posti da un fornitore, dai suoi prodotti e servizi e da altre terze parti sono compresi, registrati, prioritizzati, valutati, trattati e monitorati nel corso della relazione.', 'S');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('GV.SC-08', 'I fornitori e le altre terze parti rilevanti sono inclusi nelle attività di pianificazione, risposta e ripristino relative agli incidenti.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('GV.SC-09', 'Le pratiche di sicurezza della catena di approvvigionamento sono integrate nei programmi di gestione del rischio di cybersecurity e dell''organizzazione e le loro prestazioni sono monitorate durante l''intero ciclo di vita dei prodotti e dei servizi tecnologici.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('GV.SC-10', 'I piani di gestione del rischio di cybersecurity della catena di approvvigionamento includono le disposizioni per le attività da svolgere dopo la conclusione di un accordo di partnership o di servizio.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('ID.AM-01', 'Sono mantenuti gli inventari dell''hardware gestito dall''organizzazione.', 'S');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('ID.AM-02', 'Sono mantenuti gli inventari del software, dei servizi e dei sistemi gestiti dall''organizzazione.', 'S');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('ID.AM-03', 'Sono mantenute le rappresentazioni delle comunicazioni di rete e dei flussi di dati di rete interni ed esterni, autorizzati dall''organizzazione.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('ID.AM-04', 'Sono mantenuti gli inventari dei servizi erogati dai fornitori.', 'S');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('ID.AM-05', 'Gli asset sono prioritizzati in base alla categorizzazione, alla criticità, alle risorse e all''impatto sulla missione.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('ID.AM-07', 'Sono mantenuti gli inventari dei dati e dei relativi metadati per selezionati tipi di dati.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('ID.AM-08', 'I sistemi, l''hardware, il software, i servizi e i dati sono gestiti durante il loro intero ciclo di vita.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('DP-ID.AM-09', 'I trattamenti di dati personali sono identificati e catalogati', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('ID.RA-01', 'Le vulnerabilità negli asset sono identificate, confermate e registrate.', 'S');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('ID.RA-02', 'Le informazioni di cyber threat intelligence sono ricevute da forum e fonti di condivisione delle informazioni.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('ID.RA-03', 'Le minacce interne ed esterne all''organizzazione sono identificate e registrate.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('ID.RA-04', 'I potenziali impatti e le probabilità di sfruttamento delle vulnerabilità da parte delle minacce sono identificati e registrati.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('ID.RA-05', 'Minacce, vulnerabilità, probabilità e impatti sono utilizzati per comprendere il rischio inerente e per informare la prioritizzazione della risposta al rischio.', 'S');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('ID.RA-06', 'Le risposte al rischio sono scelte, prioritizzate, pianificate, monitorate e comunicate.', 'S');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('ID.RA-07', 'Le modifiche e le eccezioni sono gestite, valutate per il loro impatto sul rischio, registrate e tracciate.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('ID.RA-08', 'Sono stabiliti processi per la ricezione, l''analisi e la risposta alle divulgazioni di vulnerabilità.', 'S');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('ID.RA-09', 'L''autenticità e l''integrità di hardware e software sono valutate prima dell''acquisizione e dell''uso.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('ID.RA-10', 'I fornitori critici sono valutati prima dell''acquisizione.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('DP-ID.RA-11', 'Viene effettuata una valutazione di impatto sulla protezione dei dati personali.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('ID.IM-01', 'Sono identificati miglioramenti in esito alle valutazioni.', 'S');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('ID.IM-02', 'Sono identificati miglioramenti in esito ai test e alle esercitazioni di sicurezza, compresi quelli effettuati in coordinamento con i fornitori e le terze parti interessate.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('ID.IM-03', 'Sono identificati miglioramenti dall''esecuzione di processi, procedure e attività operativi.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('ID.IM-04', 'I piani di risposta agli incidenti e gli altri piani di cybersecurity che impattano le operazioni sono stabiliti, comunicati, mantenuti e migliorati.', 'S');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('DP-ID.DM-01', 'Il ciclo di vita dei dati è definito e documentato.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('DP-ID.DM-02', 'Sono definiti, implementati e documentati i processi riguardanti l''informazione dell''interessato in merito al trattamento dei dati.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('DP-ID.DM-03', 'Sono definiti, implementati e documentati i processi di raccolta e revoca del consenso dell''interessato al trattamento di dati.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('DP-ID.DM-04', 'Sono definiti, implementati e documentati i processi per l''esercizio dei diritti (accesso, rettifica, cancellazione, ecc.) dell''interessato.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('DP-ID.DM-05', 'Sono definiti, implementati e documentati i processi di trasferimento dei dati in ambito internazionale.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('PR.AA-01', 'Le identità e le credenziali degli utenti, dei servizi e dell''hardware autorizzati sono gestite dall''organizzazione.', 'S');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('PR.AA-02', 'Le identità sono verificate e associate alle credenziali in base al contesto delle interazioni.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('PR.AA-03', 'Utenti, servizi e hardware sono autenticati.', 'S');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('PR.AA-04', 'Le asserzioni di identità sono protette, trasmesse e verificate.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('PR.AA-05', 'I permessi, i diritti e le autorizzazioni di accesso sono definiti in una politica, gestiti, applicati e rivisti e incorporano i principi del minimo privilegio e della separazione dei compiti.', 'S');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('PR.AA-06', 'L''accesso fisico agli asset è gestito, monitorato e applicato in misura appropriata al rischio.', 'S');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('PR.AT-01', 'Il personale è sensibilizzato e formato in modo da possedere le conoscenze e le competenze per svolgere compiti di carattere generale tenendo conto dei rischi di cybersecurity.', 'S');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('PR.AT-02', 'Gli individui che ricoprono ruoli specializzati sono sensibilizzati e formati in modo da possedere le conoscenze e le competenze per svolgere i pertinenti compiti tenendo conto dei rischi di cybersecurity.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('PR.DS-01', 'La riservatezza, l''integrità e la disponibilità dei dati a riposo (data-at-rest) sono protette.', 'S');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('PR.DS-02', 'La riservatezza, l''integrità e la disponibilità dei dati in transito (data-in-transit) sono protette.', 'S');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('PR.DS-10', 'La riservatezza, l''integrità e la disponibilità dei dati in uso (data-in-use) sono protette.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('PR.DS-11', 'I backup dei dati sono creati, protetti, mantenuti e verificati.', 'S');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('PR.PS-01', 'Sono stabilite e applicate pratiche di gestione della configurazione.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('PR.PS-02', 'Il software è mantenuto, sostituito e rimosso in base al rischio.', 'S');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('PR.PS-03', 'L''hardware è mantenuto, sostituito e rimosso in base al rischio.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('PR.PS-04', 'I registri di log sono generati e resi disponibili per il monitoraggio continuo.', 'S');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('PR.PS-05', 'Sono impedite l''installazione ed esecuzione di software non autorizzato.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('PR.PS-06', 'Le pratiche di sviluppo sicuro del software sono integrate e le loro prestazioni sono monitorate durante l''intero ciclo di vita del software.', 'S');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('PR.IR-01', 'Le reti e gli ambienti sono protetti dall''accesso logico e dall''uso non autorizzati.', 'S');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('PR.IR-02', 'Gli asset tecnologici dell''organizzazione sono protetti dalle minacce ambientali.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('PR.IR-03', 'Sono implementati meccanismi per soddisfare i requisiti di resilienza in situazioni normali e avverse.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('PR.IR-04', 'È mantenuta un''adeguata capacità di risorse per garantire la disponibilità.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('DE.CM-01', 'Le reti e i servizi di rete sono monitorati per individuare eventi potenzialmente avversi.', 'S');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('DE.CM-02', 'L''ambiente fisico è monitorato per individuare eventi potenzialmente avversi.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('DE.CM-03', 'L''attività del personale e l''utilizzo della tecnologia, sono monitorati per individuare eventi potenzialmente avversi.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('DE.CM-06', 'Le attività e i servizi dei fornitori di servizi esterni sono monitorati per individuare eventi potenzialmente avversi.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('DE.CM-09', 'L''hardware e il software di elaborazione, gli ambienti di runtime e i loro dati sono monitorati per individuare eventi potenzialmente avversi.', 'S');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('DE.AE-02', 'Gli eventi potenzialmente avversi sono analizzati per meglio comprenderne le attività associate.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('DE.AE-03', 'Le informazioni sono correlate da più fonti.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('DE.AE-04', 'L''impatto e la portata stimati degli eventi avversi sono compresi.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('DE.AE-06', 'Le informazioni sugli eventi avversi sono fornite al personale e agli strumenti autorizzati.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('DE.AE-07', 'La cyber threat intelligence e le altre informazioni contestuali sono integrate nell''analisi.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('DE.AE-08', 'Gli incidenti sono dichiarati quando gli eventi avversi soddisfano i criteri definiti per gli incidenti.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('RS.MA-01', 'Il piano di risposta agli incidenti è eseguito in coordinamento con le terze parti interessate una volta dichiarato un incidente.', 'S');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('RS.MA-02', 'I report sugli incidenti sono sottoposti a triage e convalidati.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('RS.MA-03', 'Gli incidenti sono categorizzati e prioritizzati.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('RS.MA-04', 'Gli incidenti sono scalati (assegnati a meccanismi di risposta con risorse crescenti) o elevati (passati in gestione a un livello superiore) a seconda delle necessità.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('RS.MA-05', 'Sono applicati i criteri per l''avvio del ripristino dagli incidenti.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('RS.AN-03', 'È eseguita un''analisi per stabilire cosa è avvenuto durante un incidente e la causa principale dell''incidente.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('RS.AN-06', 'Le azioni eseguite durante un''investigazione sono registrate e l''integrità e la provenienza delle registrazioni sono preservate.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('RS.AN-07', 'I dati e i metadati degli incidenti sono raccolti e la loro integrità e provenienza sono preservate.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('RS.AN-08', 'La magnitudo di un incidente è stimata e convalidata.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('RS.CO-02', 'Gli stakeholder interni ed esterni sono informati degli incidenti.', 'S');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('RS.CO-03', 'Le informazioni sono condivise con gli stakeholder interni ed esterni designati.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('DP-RS.CO-06', 'Gli incidenti che si configurano come violazioni di dati personali sono documentati ed eventualmente vengono informate le autorità di riferimento e gli interessati.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('RS.MI-01', 'Gli incidenti vengono contenuti.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('RS.MI-02', 'Gli incidenti vengono eradicati.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('RC.RP-01', 'La parte del piano di risposta agli incidenti relativa al ripristino viene eseguita una volta avviata dal processo di risposta agli incidenti.', 'S');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('RC.RP-02', 'Le azioni di ripristino sono selezionate, contestualizzate, prioritizzate e eseguite.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('RC.RP-03', 'L''integrità dei backup e delle altre risorse di ripristino è verificata prima che siano utilizzati per il ripristino.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('RC.RP-04', 'Le funzioni critiche per la mission dell''organizzazione e la gestione del rischio di cybersecurity sono considerate per stabilire le norme operative post-incidente.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('RC.RP-05', 'L''integrità degli asset ripristinati è verificata, i sistemi e i servizi sono ripristinati e lo stato operativo normale viene confermato.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('RC.RP-06', 'La conclusione del ripristino dell''incidente viene dichiarata sulla base di criteri definiti e la documentazione relativa all''incidente è completata.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('RC.CO-03', 'Le attività di ripristino e i progressi nel ripristino delle capacità operative sono comunicati agli stakeholder interni ed esterni designati.', 'N');
INSERT INTO sottocategoria (codice, descrizione, misura_base_importanti) VALUES ('RC.CO-04', 'Gli aggiornamenti pubblici sul ripristino dagli incidenti sono condivisi utilizzando modalità e messaggi approvati.', 'N');

-- 2. Organizzazione (una sola riga)
INSERT INTO organizzazione (id_organizzazione, denominazione, codice_fiscale, indirizzo_sede_legale, telefono, email, domicilio_digitale, classificazione_nis) VALUES (1, 'Cinetica Componenti S.p.A.', '01234560017', 'Via dell''Industria 24, 10040 Leinì (TO)', '+39 011 5550100', 'info@cineticacomponenti.example', 'cineticacomponenti@pec.example', 'importante');

-- 3. Fornitori (ICT e non ICT)
INSERT INTO fornitore (id_fornitore, ragione_sociale, identificativo_fiscale, paese) VALUES (1, 'Proiezione Cloud S.r.l.', '02345670018', 'IT');
INSERT INTO fornitore (id_fornitore, ragione_sociale, identificativo_fiscale, paese) VALUES (2, 'Fotogramma Automazione GmbH', 'DE345678901', 'DE');
INSERT INTO fornitore (id_fornitore, ragione_sociale, identificativo_fiscale, paese) VALUES (3, 'Montaggio Software S.r.l.', '03456780019', 'IT');
INSERT INTO fornitore (id_fornitore, ragione_sociale, identificativo_fiscale, paese) VALUES (4, 'Sequenza Reti S.p.A.', '04567890010', 'IT');
INSERT INTO fornitore (id_fornitore, ragione_sociale, identificativo_fiscale, paese) VALUES (5, 'Controcampo Security S.r.l.', '05678900011', 'IT');
INSERT INTO fornitore (id_fornitore, ragione_sociale, identificativo_fiscale, paese) VALUES (6, 'Carrello Logistica S.r.l.', '06789010012', 'IT');
INSERT INTO fornitore (id_fornitore, ragione_sociale, identificativo_fiscale, paese) VALUES (7, 'Titoli di Coda Paghe S.r.l.', '07890120013', 'IT');

-- 4. Persone: personale interno (id_fornitore nullo) e referenti dei fornitori
INSERT INTO persona (id_persona, nome, cognome, qualifica, email, telefono, id_fornitore) VALUES (1, 'Marcello', 'Rubini', 'Responsabile dei sistemi informativi', 'm.rubini@cineticacomponenti.example', '+39 011 5550101', NULL);
INSERT INTO persona (id_persona, nome, cognome, qualifica, email, telefono, id_fornitore) VALUES (2, 'Luisa', 'Anselmi', 'Responsabile amministrazione e finanza', 'l.anselmi@cineticacomponenti.example', '+39 011 5550102', NULL);
INSERT INTO persona (id_persona, nome, cognome, qualifica, email, telefono, id_fornitore) VALUES (3, 'Guido', 'Anselmi', 'Responsabile dell''ufficio tecnico', 'g.anselmi@cineticacomponenti.example', '+39 011 5550103', NULL);
INSERT INTO persona (id_persona, nome, cognome, qualifica, email, telefono, id_fornitore) VALUES (4, 'Antonio', 'Ricci', 'Responsabile della produzione', 'a.ricci@cineticacomponenti.example', '+39 011 5550104', NULL);
INSERT INTO persona (id_persona, nome, cognome, qualifica, email, telefono, id_fornitore) VALUES (5, 'Salvatore', 'Di Vita', 'Amministratore di sistema e di rete', 's.divita@cineticacomponenti.example', '+39 011 5550105', NULL);
INSERT INTO persona (id_persona, nome, cognome, qualifica, email, telefono, id_fornitore) VALUES (6, 'Adriana', 'Astarelli', 'Tecnico dei sistemi informativi', 'a.astarelli@cineticacomponenti.example', '+39 011 5550106', NULL);
INSERT INTO persona (id_persona, nome, cognome, qualifica, email, telefono, id_fornitore) VALUES (7, 'Filumena', 'Marturano', 'Responsabile qualità e conformità', 'f.marturano@cineticacomponenti.example', '+39 011 5550107', NULL);
INSERT INTO persona (id_persona, nome, cognome, qualifica, email, telefono, id_fornitore) VALUES (8, 'Bruno', 'Cortona', 'Responsabile logistica e acquisti', 'b.cortona@cineticacomponenti.example', '+39 011 5550108', NULL);
INSERT INTO persona (id_persona, nome, cognome, qualifica, email, telefono, id_fornitore) VALUES (9, 'Roberto', 'Mariani', 'Responsabile della manutenzione impianti', 'r.mariani@cineticacomponenti.example', '+39 011 5550109', NULL);
INSERT INTO persona (id_persona, nome, cognome, qualifica, email, telefono, id_fornitore) VALUES (10, 'Jep', 'Gambardella', 'Account manager', 'j.gambardella@proiezionecloud.example', '+39 02 5550201', 1);
INSERT INTO persona (id_persona, nome, cognome, qualifica, email, telefono, id_fornitore) VALUES (11, 'Mario', 'Ruoppolo', 'Tecnico di assistenza', 'm.ruoppolo@fotogramma.example', '+49 89 5550202', 2);
INSERT INTO persona (id_persona, nome, cognome, qualifica, email, telefono, id_fornitore) VALUES (12, 'Beatrice', 'Russo', 'Referente commerciale', 'b.russo@sequenzareti.example', '+39 06 5550203', 4);
INSERT INTO persona (id_persona, nome, cognome, qualifica, email, telefono, id_fornitore) VALUES (13, 'Titta', 'Di Girolamo', 'Analista del centro operativo di sicurezza', 't.digirolamo@controcampo.example', '+39 02 5550204', 5);

-- 5. Incarichi NIS, con un avvicendamento del punto di contatto
INSERT INTO incarico (id_incarico, id_organizzazione, id_persona, ruolo, data_inizio, data_fine) VALUES (1, 1, 3, 'PDC', DATE '2025-02-01', DATE '2025-12-31');
INSERT INTO incarico (id_incarico, id_organizzazione, id_persona, ruolo, data_inizio, data_fine) VALUES (2, 1, 1, 'PDC', DATE '2026-01-01', NULL);
INSERT INTO incarico (id_incarico, id_organizzazione, id_persona, ruolo, data_inizio, data_fine) VALUES (3, 1, 2, 'SOST_PDC', DATE '2025-02-01', NULL);
INSERT INTO incarico (id_incarico, id_organizzazione, id_persona, ruolo, data_inizio, data_fine) VALUES (4, 1, 5, 'REF_CSIRT', DATE '2026-01-01', NULL);
INSERT INTO incarico (id_incarico, id_organizzazione, id_persona, ruolo, data_inizio, data_fine) VALUES (5, 1, 6, 'SOST_REF_CSIRT', DATE '2026-01-01', NULL);
INSERT INTO incarico (id_incarico, id_organizzazione, id_persona, ruolo, data_inizio, data_fine) VALUES (6, 1, 1, 'SOST_REF_CSIRT', DATE '2026-01-01', NULL);

-- 6. Attività e servizi, con categoria di rilevanza (1-4) e responsabile
INSERT INTO servizio (id_servizio, id_organizzazione, nome, descrizione, categoria_rilevanza, stato, id_responsabile) VALUES (1, 1, 'Produzione: stampaggio a iniezione', 'Stampaggio a iniezione di componenti in plastica', 3, 'attivo', 4);
INSERT INTO servizio (id_servizio, id_organizzazione, nome, descrizione, categoria_rilevanza, stato, id_responsabile) VALUES (2, 1, 'Produzione: assemblaggio e collaudo', 'Assemblaggio robotizzato e collaudo a fine linea', 3, 'attivo', 4);
INSERT INTO servizio (id_servizio, id_organizzazione, nome, descrizione, categoria_rilevanza, stato, id_responsabile) VALUES (3, 1, 'Supervisione e controllo degli impianti', 'Supervisione impianti, dati di processo, allarmi', 4, 'attivo', 9);
INSERT INTO servizio (id_servizio, id_organizzazione, nome, descrizione, categoria_rilevanza, stato, id_responsabile) VALUES (4, 1, 'Progettazione dei componenti e degli stampi', 'Disegni, stampi e distinte base dei componenti', 3, 'attivo', 3);
INSERT INTO servizio (id_servizio, id_organizzazione, nome, descrizione, categoria_rilevanza, stato, id_responsabile) VALUES (5, 1, 'Ordini e scambio dati con i clienti', 'Programmi di consegna dei clienti e avvisi', 3, 'attivo', 8);
INSERT INTO servizio (id_servizio, id_organizzazione, nome, descrizione, categoria_rilevanza, stato, id_responsabile) VALUES (6, 1, 'Logistica e spedizioni', 'Magazzino prodotti finiti e spedizioni', 2, 'attivo', 8);
INSERT INTO servizio (id_servizio, id_organizzazione, nome, descrizione, categoria_rilevanza, stato, id_responsabile) VALUES (7, 1, 'Amministrazione, finanza e personale', 'Contabilità, tesoreria, acquisti e personale', 2, 'attivo', 2);
INSERT INTO servizio (id_servizio, id_organizzazione, nome, descrizione, categoria_rilevanza, stato, id_responsabile) VALUES (8, 1, 'Posta elettronica e collaborazione', 'Posta elettronica, calendario e documenti', 1, 'attivo', 1);
INSERT INTO servizio (id_servizio, id_organizzazione, nome, descrizione, categoria_rilevanza, stato, id_responsabile) VALUES (9, 1, 'Portale fornitori', 'Scambio documenti con i fornitori (sostituito)', 2, 'dismesso', 1);

-- 7. Asset informatici e industriali
INSERT INTO asset (id_asset, id_organizzazione, codice_inventario, nome, descrizione, tipo, stato, ubicazione, id_responsabile) VALUES (1, 1, 'OT-001', 'PLC pressa a iniezione, linea 1', 'Controllore della pressa della linea 1', 'sistema_industriale', 'in_esercizio', 'Reparto stampaggio, linea 1', 9);
INSERT INTO asset (id_asset, id_organizzazione, codice_inventario, nome, descrizione, tipo, stato, ubicazione, id_responsabile) VALUES (2, 1, 'OT-002', 'PLC pressa a iniezione, linea 2', 'Controllore della pressa della linea 2', 'sistema_industriale', 'in_esercizio', 'Reparto stampaggio, linea 2', 9);
INSERT INTO asset (id_asset, id_organizzazione, codice_inventario, nome, descrizione, tipo, stato, ubicazione, id_responsabile) VALUES (3, 1, 'OT-003', 'Cella robotizzata di assemblaggio', 'Robot e controllore della cella', 'sistema_industriale', 'in_esercizio', 'Reparto assemblaggio', 9);
INSERT INTO asset (id_asset, id_organizzazione, codice_inventario, nome, descrizione, tipo, stato, ubicazione, id_responsabile) VALUES (4, 1, 'OT-004', 'Banco di collaudo di fine linea', 'PC industriale per il collaudo funzionale', 'sistema_industriale', 'in_esercizio', 'Reparto assemblaggio', 9);
INSERT INTO asset (id_asset, id_organizzazione, codice_inventario, nome, descrizione, tipo, stato, ubicazione, id_responsabile) VALUES (5, 1, 'OT-005', 'Server di supervisione SCADA', 'Supervisione, storico dati di processo, allarmi', 'sistema_industriale', 'in_esercizio', 'Sala controllo', 9);
INSERT INTO asset (id_asset, id_organizzazione, codice_inventario, nome, descrizione, tipo, stato, ubicazione, id_responsabile) VALUES (6, 1, 'IT-001', 'Cluster di virtualizzazione', 'Due nodi fisici per le macchine virtuali', 'hardware', 'in_esercizio', 'Sala server', 5);
INSERT INTO asset (id_asset, id_organizzazione, codice_inventario, nome, descrizione, tipo, stato, ubicazione, id_responsabile) VALUES (7, 1, 'IT-002', 'Server del MES', 'Macchina dedicata al sistema di produzione', 'hardware', 'in_esercizio', 'Sala server', 5);
INSERT INTO asset (id_asset, id_organizzazione, codice_inventario, nome, descrizione, tipo, stato, ubicazione, id_responsabile) VALUES (8, 1, 'IT-003', 'NAS di backup', 'Archivio dei salvataggi giornalieri', 'hardware', 'in_esercizio', 'Sala server, armadio 2', 5);
INSERT INTO asset (id_asset, id_organizzazione, codice_inventario, nome, descrizione, tipo, stato, ubicazione, id_responsabile) VALUES (9, 1, 'IT-004', 'Server del portale fornitori', 'Server fisico non più in uso', 'hardware', 'dismesso', 'Magazzino', 6);
INSERT INTO asset (id_asset, id_organizzazione, codice_inventario, nome, descrizione, tipo, stato, ubicazione, id_responsabile) VALUES (10, 1, 'IT-005', 'NAS per la copia fuori sede', 'Acquisto previsto per copia dei salvataggi', 'hardware', 'pianificato', NULL, 5);
INSERT INTO asset (id_asset, id_organizzazione, codice_inventario, nome, descrizione, tipo, stato, ubicazione, id_responsabile) VALUES (11, 1, 'SW-001', 'Applicazione MES', 'Pianificazione, avanzamento e tracciabilità', 'software', 'in_esercizio', NULL, 5);
INSERT INTO asset (id_asset, id_organizzazione, codice_inventario, nome, descrizione, tipo, stato, ubicazione, id_responsabile) VALUES (12, 1, 'SW-002', 'CAD e dati di prodotto', 'Progettazione e archivio delle revisioni', 'software', 'in_esercizio', NULL, 6);
INSERT INTO asset (id_asset, id_organizzazione, codice_inventario, nome, descrizione, tipo, stato, ubicazione, id_responsabile) VALUES (13, 1, 'SW-003', 'Gateway scambio dati con i clienti', 'Traduzione e trasmissione dei messaggi EDI', 'software', 'in_esercizio', NULL, 5);
INSERT INTO asset (id_asset, id_organizzazione, codice_inventario, nome, descrizione, tipo, stato, ubicazione, id_responsabile) VALUES (14, 1, 'DT-001', 'Archivio disegni e stampi', 'Disegni, modelli e distinte base', 'dati', 'in_esercizio', NULL, 3);
INSERT INTO asset (id_asset, id_organizzazione, codice_inventario, nome, descrizione, tipo, stato, ubicazione, id_responsabile) VALUES (15, 1, 'CL-001', 'ERP in cloud', 'Contabilità, acquisti, magazzino e ordini', 'servizio_cloud', 'in_esercizio', NULL, 1);
INSERT INTO asset (id_asset, id_organizzazione, codice_inventario, nome, descrizione, tipo, stato, ubicazione, id_responsabile) VALUES (16, 1, 'CL-002', 'Posta e collaborazione in cloud', 'Caselle di posta, calendario, documenti', 'servizio_cloud', 'in_esercizio', NULL, 1);
INSERT INTO asset (id_asset, id_organizzazione, codice_inventario, nome, descrizione, tipo, stato, ubicazione, id_responsabile) VALUES (17, 1, 'NT-001', 'Firewall perimetrale', 'Separa Internet, uffici e rete di fabbrica', 'rete', 'in_esercizio', 'Sala server', 5);
INSERT INTO asset (id_asset, id_organizzazione, codice_inventario, nome, descrizione, tipo, stato, ubicazione, id_responsabile) VALUES (18, 1, 'NT-002', 'Rete di fabbrica', 'Switch e cablaggio dei reparti produttivi', 'rete', 'in_esercizio', 'Reparti produttivi', 5);
INSERT INTO asset (id_asset, id_organizzazione, codice_inventario, nome, descrizione, tipo, stato, ubicazione, id_responsabile) VALUES (19, 1, 'NT-003', 'Rete degli uffici', 'Switch, cablaggio e rete senza fili', 'rete', 'in_esercizio', 'Uffici', 6);
INSERT INTO asset (id_asset, id_organizzazione, codice_inventario, nome, descrizione, tipo, stato, ubicazione, id_responsabile) VALUES (20, 1, 'NT-004', 'Collegamento a Internet', 'Linea in fibra con indirizzi pubblici', 'rete', 'in_esercizio', 'Sala server', 5);
INSERT INTO asset (id_asset, id_organizzazione, codice_inventario, nome, descrizione, tipo, stato, ubicazione, id_responsabile) VALUES (21, 1, 'NT-005', 'Accesso remoto per i manutentori', 'VPN per assistenza da remoto sugli impianti', 'rete', 'in_esercizio', 'Sala server', 5);
INSERT INTO asset (id_asset, id_organizzazione, codice_inventario, nome, descrizione, tipo, stato, ubicazione, id_responsabile) VALUES (22, 1, 'SF-001', 'Sala server', 'Alimentazione protetta e climatizzazione', 'sito_fisico', 'in_esercizio', 'Palazzina uffici, piano terra', 5);

-- 8. Quali asset supportano direttamente quali servizi
INSERT INTO asset_servizio (id_asset, id_servizio, ruolo) VALUES (1, 1, 'controllo della pressa della linea 1');
INSERT INTO asset_servizio (id_asset, id_servizio, ruolo) VALUES (2, 1, 'controllo della pressa della linea 2');
INSERT INTO asset_servizio (id_asset, id_servizio, ruolo) VALUES (3, 2, 'assemblaggio dei componenti');
INSERT INTO asset_servizio (id_asset, id_servizio, ruolo) VALUES (4, 2, 'collaudo di fine linea');
INSERT INTO asset_servizio (id_asset, id_servizio, ruolo) VALUES (5, 3, 'supervisione e allarmi');
INSERT INTO asset_servizio (id_asset, id_servizio, ruolo) VALUES (11, 1, 'pianificazione e tracciabilità');
INSERT INTO asset_servizio (id_asset, id_servizio, ruolo) VALUES (11, 2, 'pianificazione e tracciabilità');
INSERT INTO asset_servizio (id_asset, id_servizio, ruolo) VALUES (12, 4, 'progettazione');
INSERT INTO asset_servizio (id_asset, id_servizio, ruolo) VALUES (14, 4, 'archivio dei progetti');
INSERT INTO asset_servizio (id_asset, id_servizio, ruolo) VALUES (13, 5, 'scambio dei messaggi con i clienti');
INSERT INTO asset_servizio (id_asset, id_servizio, ruolo) VALUES (15, 5, 'gestione degli ordini');
INSERT INTO asset_servizio (id_asset, id_servizio, ruolo) VALUES (15, 6, 'magazzino e documenti di trasporto');
INSERT INTO asset_servizio (id_asset, id_servizio, ruolo) VALUES (15, 7, 'contabilità e acquisti');
INSERT INTO asset_servizio (id_asset, id_servizio, ruolo) VALUES (16, 8, 'posta e documenti');
INSERT INTO asset_servizio (id_asset, id_servizio, ruolo) VALUES (9, 9, 'server del portale');

-- 9. Dipendenze tra asset: il primo richiede il secondo
INSERT INTO dipendenza_asset (id_asset_dipendente, id_asset_richiesto, tipo_dipendenza) VALUES (1, 18, 'rete');
INSERT INTO dipendenza_asset (id_asset_dipendente, id_asset_richiesto, tipo_dipendenza) VALUES (2, 18, 'rete');
INSERT INTO dipendenza_asset (id_asset_dipendente, id_asset_richiesto, tipo_dipendenza) VALUES (3, 18, 'rete');
INSERT INTO dipendenza_asset (id_asset_dipendente, id_asset_richiesto, tipo_dipendenza) VALUES (4, 18, 'rete');
INSERT INTO dipendenza_asset (id_asset_dipendente, id_asset_richiesto, tipo_dipendenza) VALUES (5, 18, 'rete');
INSERT INTO dipendenza_asset (id_asset_dipendente, id_asset_richiesto, tipo_dipendenza) VALUES (5, 1, 'dati');
INSERT INTO dipendenza_asset (id_asset_dipendente, id_asset_richiesto, tipo_dipendenza) VALUES (5, 2, 'dati');
INSERT INTO dipendenza_asset (id_asset_dipendente, id_asset_richiesto, tipo_dipendenza) VALUES (5, 6, 'infrastruttura');
INSERT INTO dipendenza_asset (id_asset_dipendente, id_asset_richiesto, tipo_dipendenza) VALUES (11, 7, 'infrastruttura');
INSERT INTO dipendenza_asset (id_asset_dipendente, id_asset_richiesto, tipo_dipendenza) VALUES (11, 5, 'dati');
INSERT INTO dipendenza_asset (id_asset_dipendente, id_asset_richiesto, tipo_dipendenza) VALUES (12, 6, 'infrastruttura');
INSERT INTO dipendenza_asset (id_asset_dipendente, id_asset_richiesto, tipo_dipendenza) VALUES (12, 19, 'rete');
INSERT INTO dipendenza_asset (id_asset_dipendente, id_asset_richiesto, tipo_dipendenza) VALUES (13, 6, 'infrastruttura');
INSERT INTO dipendenza_asset (id_asset_dipendente, id_asset_richiesto, tipo_dipendenza) VALUES (13, 20, 'rete');
INSERT INTO dipendenza_asset (id_asset_dipendente, id_asset_richiesto, tipo_dipendenza) VALUES (13, 15, 'dati');
INSERT INTO dipendenza_asset (id_asset_dipendente, id_asset_richiesto, tipo_dipendenza) VALUES (14, 6, 'infrastruttura');
INSERT INTO dipendenza_asset (id_asset_dipendente, id_asset_richiesto, tipo_dipendenza) VALUES (14, 8, 'dati');
INSERT INTO dipendenza_asset (id_asset_dipendente, id_asset_richiesto, tipo_dipendenza) VALUES (15, 20, 'rete');
INSERT INTO dipendenza_asset (id_asset_dipendente, id_asset_richiesto, tipo_dipendenza) VALUES (16, 20, 'rete');
INSERT INTO dipendenza_asset (id_asset_dipendente, id_asset_richiesto, tipo_dipendenza) VALUES (6, 22, 'infrastruttura');
INSERT INTO dipendenza_asset (id_asset_dipendente, id_asset_richiesto, tipo_dipendenza) VALUES (7, 22, 'infrastruttura');
INSERT INTO dipendenza_asset (id_asset_dipendente, id_asset_richiesto, tipo_dipendenza) VALUES (8, 22, 'infrastruttura');
INSERT INTO dipendenza_asset (id_asset_dipendente, id_asset_richiesto, tipo_dipendenza) VALUES (18, 17, 'rete');
INSERT INTO dipendenza_asset (id_asset_dipendente, id_asset_richiesto, tipo_dipendenza) VALUES (19, 17, 'rete');
INSERT INTO dipendenza_asset (id_asset_dipendente, id_asset_richiesto, tipo_dipendenza) VALUES (20, 17, 'rete');
INSERT INTO dipendenza_asset (id_asset_dipendente, id_asset_richiesto, tipo_dipendenza) VALUES (21, 17, 'rete');
INSERT INTO dipendenza_asset (id_asset_dipendente, id_asset_richiesto, tipo_dipendenza) VALUES (21, 20, 'rete');

-- 10. Forniture: riferite a un asset oppure a un servizio; una è conclusa
INSERT INTO fornitura (id_fornitura, id_fornitore, id_asset, id_servizio, tipo_fornitura, oggetto, riferimento_contratto, data_inizio, data_fine, fornitura_ict, fornitura_non_fungibile) VALUES (1, 1, 15, NULL, 'cloud', 'ERP in modalità SaaS', 'CC-2023-014', DATE '2023-01-01', NULL, 'S', 'S');
INSERT INTO fornitura (id_fornitura, id_fornitore, id_asset, id_servizio, tipo_fornitura, oggetto, riferimento_contratto, data_inizio, data_fine, fornitura_ict, fornitura_non_fungibile) VALUES (2, 1, 16, NULL, 'cloud', 'Posta elettronica e collaborazione', 'CC-2023-015', DATE '2023-01-01', NULL, 'S', 'N');
INSERT INTO fornitura (id_fornitura, id_fornitore, id_asset, id_servizio, tipo_fornitura, oggetto, riferimento_contratto, data_inizio, data_fine, fornitura_ict, fornitura_non_fungibile) VALUES (3, 1, 9, NULL, 'cloud', 'Pubblicazione del portale fornitori', 'CC-2019-003', DATE '2019-03-01', DATE '2023-06-30', 'S', 'N');
INSERT INTO fornitura (id_fornitura, id_fornitore, id_asset, id_servizio, tipo_fornitura, oggetto, riferimento_contratto, data_inizio, data_fine, fornitura_ict, fornitura_non_fungibile) VALUES (4, 2, 1, NULL, 'manutenzione', 'Assistenza da remoto sulla pressa, linea 1', 'CC-2021-021', DATE '2021-05-01', NULL, 'S', 'S');
INSERT INTO fornitura (id_fornitura, id_fornitore, id_asset, id_servizio, tipo_fornitura, oggetto, riferimento_contratto, data_inizio, data_fine, fornitura_ict, fornitura_non_fungibile) VALUES (5, 2, 2, NULL, 'manutenzione', 'Assistenza da remoto sulla pressa, linea 2', 'CC-2021-021', DATE '2021-05-01', NULL, 'S', 'S');
INSERT INTO fornitura (id_fornitura, id_fornitore, id_asset, id_servizio, tipo_fornitura, oggetto, riferimento_contratto, data_inizio, data_fine, fornitura_ict, fornitura_non_fungibile) VALUES (6, 2, 3, NULL, 'manutenzione', 'Manutenzione della cella robotizzata', 'CC-2022-008', DATE '2022-02-01', NULL, 'S', 'N');
INSERT INTO fornitura (id_fornitura, id_fornitore, id_asset, id_servizio, tipo_fornitura, oggetto, riferimento_contratto, data_inizio, data_fine, fornitura_ict, fornitura_non_fungibile) VALUES (7, 3, 11, NULL, 'software', 'Licenza, aggiornamenti e assistenza del MES', 'CC-2020-011', DATE '2020-09-01', NULL, 'S', 'S');
INSERT INTO fornitura (id_fornitura, id_fornitore, id_asset, id_servizio, tipo_fornitura, oggetto, riferimento_contratto, data_inizio, data_fine, fornitura_ict, fornitura_non_fungibile) VALUES (8, 4, 20, NULL, 'connettivita', 'Collegamento a Internet in fibra', 'CC-2024-002', DATE '2024-01-01', NULL, 'S', 'N');
INSERT INTO fornitura (id_fornitura, id_fornitore, id_asset, id_servizio, tipo_fornitura, oggetto, riferimento_contratto, data_inizio, data_fine, fornitura_ict, fornitura_non_fungibile) VALUES (9, 5, 17, NULL, 'sicurezza', 'Gestione firewall e monitoraggio eventi', 'CC-2025-006', DATE '2025-04-01', NULL, 'S', 'N');
INSERT INTO fornitura (id_fornitura, id_fornitore, id_asset, id_servizio, tipo_fornitura, oggetto, riferimento_contratto, data_inizio, data_fine, fornitura_ict, fornitura_non_fungibile) VALUES (10, 6, NULL, 6, 'logistica', 'Trasporto prodotti finiti ai clienti', 'CC-2022-019', DATE '2022-07-01', NULL, 'N', 'N');
INSERT INTO fornitura (id_fornitura, id_fornitore, id_asset, id_servizio, tipo_fornitura, oggetto, riferimento_contratto, data_inizio, data_fine, fornitura_ict, fornitura_non_fungibile) VALUES (11, 7, NULL, 7, 'consulenza', 'Elaborazione delle buste paga', 'CC-2018-001', DATE '2018-01-01', NULL, 'N', 'N');

-- 11. Profilo attuale: primo assessment, consolidato, sulle 37 misure di base
INSERT INTO assessment (id_assessment, id_organizzazione, id_assessor, data_inizio, data_consolidamento) VALUES (1, 1, 7, DATE '2026-05-11', DATE '2026-06-30');

INSERT INTO valutazione (id_assessment, codice_sottocategoria, grado_copertura, livello_maturita, note) VALUES (1, 'GV.OC-04', 0.2, 1, NULL);
INSERT INTO valutazione (id_assessment, codice_sottocategoria, grado_copertura, livello_maturita, note) VALUES (1, 'GV.RM-03', 0.8, 2, NULL);
INSERT INTO valutazione (id_assessment, codice_sottocategoria, grado_copertura, livello_maturita, note) VALUES (1, 'GV.RR-02', 0.4, 3, NULL);
INSERT INTO valutazione (id_assessment, codice_sottocategoria, grado_copertura, livello_maturita, note) VALUES (1, 'GV.RR-04', 1, 5, NULL);
INSERT INTO valutazione (id_assessment, codice_sottocategoria, grado_copertura, livello_maturita, note) VALUES (1, 'GV.PO-01', 1, 5, NULL);
INSERT INTO valutazione (id_assessment, codice_sottocategoria, grado_copertura, livello_maturita, note) VALUES (1, 'GV.PO-02', 0.4, 1, NULL);
INSERT INTO valutazione (id_assessment, codice_sottocategoria, grado_copertura, livello_maturita, note) VALUES (1, 'GV.SC-01', 1, 3, NULL);
INSERT INTO valutazione (id_assessment, codice_sottocategoria, grado_copertura, livello_maturita, note) VALUES (1, 'GV.SC-02', 0.2, 1, NULL);
INSERT INTO valutazione (id_assessment, codice_sottocategoria, grado_copertura, livello_maturita, note) VALUES (1, 'GV.SC-04', 0.4, 2, 'Elenco fornitori senza ordine di criticità');
INSERT INTO valutazione (id_assessment, codice_sottocategoria, grado_copertura, livello_maturita, note) VALUES (1, 'GV.SC-05', 0, NULL, NULL);
INSERT INTO valutazione (id_assessment, codice_sottocategoria, grado_copertura, livello_maturita, note) VALUES (1, 'GV.SC-07', 0.8, 3, NULL);
INSERT INTO valutazione (id_assessment, codice_sottocategoria, grado_copertura, livello_maturita, note) VALUES (1, 'ID.AM-01', 0.4, 2, 'Inventario su foglio di calcolo, annuale');
INSERT INTO valutazione (id_assessment, codice_sottocategoria, grado_copertura, livello_maturita, note) VALUES (1, 'ID.AM-02', 0.4, 2, NULL);
INSERT INTO valutazione (id_assessment, codice_sottocategoria, grado_copertura, livello_maturita, note) VALUES (1, 'ID.AM-04', 0.2, 1, NULL);
INSERT INTO valutazione (id_assessment, codice_sottocategoria, grado_copertura, livello_maturita, note) VALUES (1, 'ID.RA-01', 0.8, 2, NULL);
INSERT INTO valutazione (id_assessment, codice_sottocategoria, grado_copertura, livello_maturita, note) VALUES (1, 'ID.RA-05', 0.6, 1, NULL);
INSERT INTO valutazione (id_assessment, codice_sottocategoria, grado_copertura, livello_maturita, note) VALUES (1, 'ID.RA-06', 0.8, 3, NULL);
INSERT INTO valutazione (id_assessment, codice_sottocategoria, grado_copertura, livello_maturita, note) VALUES (1, 'ID.RA-08', 0, NULL, 'Nessun processo per segnalazioni di vulnerabilità');
INSERT INTO valutazione (id_assessment, codice_sottocategoria, grado_copertura, livello_maturita, note) VALUES (1, 'ID.IM-01', 0.4, 2, NULL);
INSERT INTO valutazione (id_assessment, codice_sottocategoria, grado_copertura, livello_maturita, note) VALUES (1, 'ID.IM-04', 0, NULL, NULL);
INSERT INTO valutazione (id_assessment, codice_sottocategoria, grado_copertura, livello_maturita, note) VALUES (1, 'PR.AA-01', 0.6, 2, NULL);
INSERT INTO valutazione (id_assessment, codice_sottocategoria, grado_copertura, livello_maturita, note) VALUES (1, 'PR.AA-03', 0.8, 4, NULL);
INSERT INTO valutazione (id_assessment, codice_sottocategoria, grado_copertura, livello_maturita, note) VALUES (1, 'PR.AA-05', 0.2, 2, NULL);
INSERT INTO valutazione (id_assessment, codice_sottocategoria, grado_copertura, livello_maturita, note) VALUES (1, 'PR.AA-06', 1, 5, NULL);
INSERT INTO valutazione (id_assessment, codice_sottocategoria, grado_copertura, livello_maturita, note) VALUES (1, 'PR.AT-01', 0.2, 2, NULL);
INSERT INTO valutazione (id_assessment, codice_sottocategoria, grado_copertura, livello_maturita, note) VALUES (1, 'PR.DS-01', 0.8, 4, NULL);
INSERT INTO valutazione (id_assessment, codice_sottocategoria, grado_copertura, livello_maturita, note) VALUES (1, 'PR.DS-02', 0.6, 2, NULL);
INSERT INTO valutazione (id_assessment, codice_sottocategoria, grado_copertura, livello_maturita, note) VALUES (1, 'PR.DS-11', 0.6, 3, NULL);
INSERT INTO valutazione (id_assessment, codice_sottocategoria, grado_copertura, livello_maturita, note) VALUES (1, 'PR.PS-02', 0.8, 2, NULL);
INSERT INTO valutazione (id_assessment, codice_sottocategoria, grado_copertura, livello_maturita, note) VALUES (1, 'PR.PS-04', 1, 4, NULL);
INSERT INTO valutazione (id_assessment, codice_sottocategoria, grado_copertura, livello_maturita, note) VALUES (1, 'PR.PS-06', 0.4, 1, NULL);
INSERT INTO valutazione (id_assessment, codice_sottocategoria, grado_copertura, livello_maturita, note) VALUES (1, 'PR.IR-01', 0.8, 2, NULL);
INSERT INTO valutazione (id_assessment, codice_sottocategoria, grado_copertura, livello_maturita, note) VALUES (1, 'DE.CM-01', 1, 5, NULL);
INSERT INTO valutazione (id_assessment, codice_sottocategoria, grado_copertura, livello_maturita, note) VALUES (1, 'DE.CM-09', 0.8, 3, NULL);
INSERT INTO valutazione (id_assessment, codice_sottocategoria, grado_copertura, livello_maturita, note) VALUES (1, 'RS.MA-01', 0.8, 3, NULL);
INSERT INTO valutazione (id_assessment, codice_sottocategoria, grado_copertura, livello_maturita, note) VALUES (1, 'RS.CO-02', 0.2, 2, NULL);
INSERT INTO valutazione (id_assessment, codice_sottocategoria, grado_copertura, livello_maturita, note) VALUES (1, 'RC.RP-01', 0.8, 3, NULL);

-- 12. Evidenze del primo assessment, alcune collegate ad asset
INSERT INTO evidenza (id_evidenza, id_assessment, codice_sottocategoria, id_asset, descrizione, riferimento) VALUES (1, 1, 'ID.AM-01', NULL, 'Inventario dell''hardware su foglio di calcolo', 'documenti/inventario_hardware_2026.xlsx');
INSERT INTO evidenza (id_evidenza, id_assessment, codice_sottocategoria, id_asset, descrizione, riferimento) VALUES (2, 1, 'PR.DS-11', 8, 'Rapporto dei salvataggi giornalieri sul NAS', 'documenti/rapporto_backup_2026-05.pdf');
INSERT INTO evidenza (id_evidenza, id_assessment, codice_sottocategoria, id_asset, descrizione, riferimento) VALUES (3, 1, 'PR.IR-01', 17, 'Regole del firewall uffici - rete di fabbrica', 'documenti/regole_firewall.pdf');
INSERT INTO evidenza (id_evidenza, id_assessment, codice_sottocategoria, id_asset, descrizione, riferimento) VALUES (4, 1, 'PR.AA-06', 22, 'Registro degli accessi alla sala server', 'documenti/registro_accessi_sala_server.pdf');
INSERT INTO evidenza (id_evidenza, id_assessment, codice_sottocategoria, id_asset, descrizione, riferimento) VALUES (5, 1, 'GV.SC-04', NULL, 'Elenco dei fornitori estratto dal gestionale', 'documenti/elenco_fornitori.pdf');

-- 13. Secondo assessment, in corso: prime valutazioni dopo l'adozione di questa base dati
INSERT INTO assessment (id_assessment, id_organizzazione, id_assessor, data_inizio, data_consolidamento) VALUES (2, 1, 7, DATE '2026-11-02', NULL);

INSERT INTO valutazione (id_assessment, codice_sottocategoria, grado_copertura, livello_maturita, note) VALUES (2, 'ID.AM-01', 0.8, 3, 'Inventario nella base dati, con responsabile');
INSERT INTO valutazione (id_assessment, codice_sottocategoria, grado_copertura, livello_maturita, note) VALUES (2, 'ID.AM-02', 0.8, 3, 'Software, servizi e sistemi censiti');
INSERT INTO valutazione (id_assessment, codice_sottocategoria, grado_copertura, livello_maturita, note) VALUES (2, 'ID.AM-04', 0.8, 3, 'Forniture censite con tipo, periodo, contratto');
INSERT INTO valutazione (id_assessment, codice_sottocategoria, grado_copertura, livello_maturita, note) VALUES (2, 'GV.SC-04', 0.8, 3, 'Fornitori legati ai servizi che ne dipendono');
INSERT INTO valutazione (id_assessment, codice_sottocategoria, grado_copertura, livello_maturita, note) VALUES (2, 'GV.OC-04', 0.8, 3, 'Servizi censiti con categoria di rilevanza');
INSERT INTO valutazione (id_assessment, codice_sottocategoria, grado_copertura, livello_maturita, note) VALUES (2, 'GV.RR-02', 0.6, 3, 'Responsabili e incarichi NIS registrati');
INSERT INTO valutazione (id_assessment, codice_sottocategoria, grado_copertura, livello_maturita, note) VALUES (2, 'ID.RA-08', 0.2, 1, 'Definita una casella di posta per segnalazioni');
INSERT INTO valutazione (id_assessment, codice_sottocategoria, grado_copertura, livello_maturita, note) VALUES (2, 'PR.DS-11', 0.6, 3, NULL);
INSERT INTO valutazione (id_assessment, codice_sottocategoria, grado_copertura, livello_maturita, note) VALUES (2, 'ID.AM-03', 0.4, 2, 'Flussi di rete descritti dalle dipendenze');

INSERT INTO evidenza (id_evidenza, id_assessment, codice_sottocategoria, id_asset, descrizione, riferimento) VALUES (6, 2, 'ID.AM-01', 5, 'Scheda del server SCADA, con dipendenze dirette', 'queries.sql, interrogazione 7');
INSERT INTO evidenza (id_evidenza, id_assessment, codice_sottocategoria, id_asset, descrizione, riferimento) VALUES (7, 2, 'ID.AM-04', NULL, 'Estrazione delle dipendenze da terze parti', 'queries.sql, interrogazione 3');
INSERT INTO evidenza (id_evidenza, id_assessment, codice_sottocategoria, id_asset, descrizione, riferimento) VALUES (8, 2, 'GV.OC-04', NULL, 'Estrazione dei servizi erogati', 'queries.sql, interrogazione 1');

