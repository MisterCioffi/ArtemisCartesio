
-- Popolamento MISSIONI
INSERT INTO MISSIONI (ID, Obiettivo, Data_Inizio, Data_Fine, Stato) VALUES (1, 'Esplorazione Polo Sud Lunare', TO_DATE('2025-06-15', 'YYYY-MM-DD'), TO_DATE('2025-12-20', 'YYYY-MM-DD'), 'In corso');
INSERT INTO MISSIONI (ID, Obiettivo, Data_Inizio, Data_Fine, Stato) VALUES (2, 'Studio Crateri Lunari', TO_DATE('2024-03-10', 'YYYY-MM-DD'), NULL, 'Pianificata');
INSERT INTO MISSIONI (ID, Obiettivo, Data_Inizio, Data_Fine, Stato) VALUES (3, 'Raccolta Campioni di Rocce', TO_DATE('2023-11-05', 'YYYY-MM-DD'), TO_DATE('2024-02-15', 'YYYY-MM-DD'), 'Completata');
INSERT INTO MISSIONI (ID, Obiettivo, Data_Inizio, Data_Fine, Stato) VALUES (4, 'Installazione Base Avanzata', TO_DATE('2024-05-01', 'YYYY-MM-DD'), NULL, 'Annullata');

-- Popolamento MEMBRI
INSERT INTO MEMBRI (ID, Nome, Cognome, Ruolo) VALUES (1, 'Luca', 'Rossi', 'Comandante');
INSERT INTO MEMBRI (ID, Nome, Cognome, Ruolo) VALUES (2, 'Anna', 'Bianchi', 'Ingegnere');
INSERT INTO MEMBRI (ID, Nome, Cognome, Ruolo) VALUES (3, 'Marco', 'Verdi', 'Scienziato');
INSERT INTO MEMBRI (ID, Nome, Cognome, Ruolo) VALUES (4, 'Elisa', 'Neri', 'Medico');
INSERT INTO MEMBRI (ID, Nome, Cognome, Ruolo) VALUES (5, 'Giovanni', 'Ferri', 'Manutentore');
INSERT INTO MEMBRI (ID, Nome, Cognome, Ruolo) VALUES (6, 'Sara', 'Russo', 'Manutentore');

-- Popolamento SENSORI
INSERT INTO SENSORI (ID, Data_Installazione, Data_Ultimo_Controllo, Tipo, Latitudine, Longitudine, Altitudine) VALUES (1, TO_DATE('2023-12-01', 'YYYY-MM-DD'), TO_DATE('2024-02-10', 'YYYY-MM-DD'), 'Temperatura', -85.0, 123.0, 500.0);
INSERT INTO SENSORI (ID, Data_Installazione, Data_Ultimo_Controllo, Tipo, Latitudine, Longitudine, Altitudine) VALUES (2, TO_DATE('2024-01-15', 'YYYY-MM-DD'), NULL, 'Pressione', -45.0, 67.5, 150.0);
INSERT INTO SENSORI (ID, Data_Installazione, Data_Ultimo_Controllo, Tipo, Latitudine, Longitudine, Altitudine) VALUES (3, TO_DATE('2022-08-20', 'YYYY-MM-DD'), TO_DATE('2023-11-25', 'YYYY-MM-DD'), 'Gas', -12.5, 34.6, 250.0);
INSERT INTO SENSORI (ID, Data_Installazione, Data_Ultimo_Controllo, Tipo, Latitudine, Longitudine, Altitudine) VALUES (4, TO_DATE('2024-06-10', 'YYYY-MM-DD'), NULL, 'Radiazioni', -65.4, 98.1, 300.0);

-- Popolamento UTILIZZO_SENSORI
INSERT INTO UTILIZZO_SENSORI (Sensori, Missioni) VALUES (1, 1); -- Sensore di Temperatura per esplorazione Polo Sud Lunare
INSERT INTO UTILIZZO_SENSORI (Sensori, Missioni) VALUES (2, 2); -- Sensore di Pressione per studio crateri lunari
INSERT INTO UTILIZZO_SENSORI (Sensori, Missioni) VALUES (3, 3); -- Sensore di Gas per raccolta campioni di rocce
INSERT INTO UTILIZZO_SENSORI (Sensori, Missioni) VALUES (4, 4); -- Sensore di Radiazioni per installazione base avanzata

-- Popolamento RILEVAZIONI per il sensore 1 (Temperatura)
INSERT INTO RILEVAZIONI (ID, Data, Ora, Valore, Sensori) VALUES  (1, TO_DATE('2023-12-01', 'YYYY-MM-DD'), TO_TIMESTAMP('2023-12-01 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), -85.0, 1); -- Temperatura
INSERT INTO RILEVAZIONI (ID, Data, Ora, Valore, Sensori) VALUES  (2, TO_DATE('2023-12-01', 'YYYY-MM-DD'), TO_TIMESTAMP('2023-12-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), -84.5, 1);
INSERT INTO RILEVAZIONI (ID, Data, Ora, Valore, Sensori) VALUES  (3, TO_DATE('2023-12-01', 'YYYY-MM-DD'), TO_TIMESTAMP('2023-12-01 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), -84.0, 1);
INSERT INTO RILEVAZIONI (ID, Data, Ora, Valore, Sensori) VALUES  (4, TO_DATE('2023-12-02', 'YYYY-MM-DD'), TO_TIMESTAMP('2023-12-02 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), -85.2, 1);

-- Popolamento RILEVAZIONI per il sensore 2 (Pressione)
INSERT INTO RILEVAZIONI (ID, Data, Ora, Valore, Sensori) VALUES  (5, TO_DATE('2024-01-15', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-01-15 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1015.5, 2); -- Pressione
INSERT INTO RILEVAZIONI (ID, Data, Ora, Valore, Sensori) VALUES  (6, TO_DATE('2024-01-15', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-01-15 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1016.0, 2);
INSERT INTO RILEVAZIONI (ID, Data, Ora, Valore, Sensori) VALUES  (7, TO_DATE('2024-01-15', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-01-15 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1015.8, 2);
INSERT INTO RILEVAZIONI (ID, Data, Ora, Valore, Sensori) VALUES  (8, TO_DATE('2024-01-16', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-01-16 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1015.2, 2);

-- Popolamento RILEVAZIONI per il sensore 3 (Gas)
INSERT INTO RILEVAZIONI (ID, Data, Ora, Valore, Sensori) VALUES  (9, TO_DATE('2022-08-20', 'YYYY-MM-DD'), TO_TIMESTAMP('2022-08-20 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 0.35, 3); -- Gas
INSERT INTO RILEVAZIONI (ID, Data, Ora, Valore, Sensori) VALUES  (10, TO_DATE('2022-08-20', 'YYYY-MM-DD'), TO_TIMESTAMP('2022-08-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 0.33, 3);
INSERT INTO RILEVAZIONI (ID, Data, Ora, Valore, Sensori) VALUES  (11, TO_DATE('2022-08-20', 'YYYY-MM-DD'), TO_TIMESTAMP('2022-08-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 0.32, 3);
INSERT INTO RILEVAZIONI (ID, Data, Ora, Valore, Sensori) VALUES  (12, TO_DATE('2022-08-21', 'YYYY-MM-DD'), TO_TIMESTAMP('2022-08-21 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 0.34, 3);

-- Popolamento RILEVAZIONI per il sensore 4 (Radiazioni)
INSERT INTO RILEVAZIONI (ID, Data, Ora, Valore, Sensori) VALUES  (13, TO_DATE('2024-06-10', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-06-10 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 0.08, 4); -- Radiazioni
INSERT INTO RILEVAZIONI (ID, Data, Ora, Valore, Sensori) VALUES  (14, TO_DATE('2024-06-10', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-06-10 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 0.10, 4);
INSERT INTO RILEVAZIONI (ID, Data, Ora, Valore, Sensori) VALUES  (15, TO_DATE('2024-06-10', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-06-10 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 0.09, 4);
INSERT INTO RILEVAZIONI (ID, Data, Ora, Valore, Sensori) VALUES  (16, TO_DATE('2024-06-11', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-06-11 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 0.11, 4);


-- Popolamento ROBOT
INSERT INTO ROBOT (ID, Tipo) VALUES (1, 'Rover Esplorativo');
INSERT INTO ROBOT (ID, Tipo) VALUES (2, 'Drone Aereo');
INSERT INTO ROBOT (ID, Tipo) VALUES (3, 'Robot Minatore');
INSERT INTO ROBOT (ID, Tipo) VALUES (4, 'Robot Assistente');

-- Popolamento UTILIZZO_ROBOT
INSERT INTO UTILIZZO_ROBOT (Robot, Missioni) VALUES (1, 1); -- Rover Esplorativo nella missione di esplorazione Polo Sud Lunare
INSERT INTO UTILIZZO_ROBOT (Robot, Missioni) VALUES (2, 2); -- Drone Aereo per studio crateri lunari
INSERT INTO UTILIZZO_ROBOT (Robot, Missioni) VALUES (3, 3); -- Robot Minatore per raccolta campioni di rocce
INSERT INTO UTILIZZO_ROBOT (Robot, Missioni) VALUES (1, 4); -- Rover Esplorativo per installazione base avanzata

-- Popolamento ANOMALIE
INSERT INTO ANOMALIE (ID, Data, Ora, Livello, Causa, Sensori) VALUES (1, TO_DATE('2024-12-01', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-01 10:15:00', 'YYYY-MM-DD HH24:MI:SS'), 'Alta', 'Errore di calibrazione', 1);
INSERT INTO ANOMALIE (ID, Data, Ora, Livello, Causa, Sensori) VALUES (2, TO_DATE('2024-11-15', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-11-15 14:45:00', 'YYYY-MM-DD HH24:MI:SS'), 'Media', 'Sensore non risponde', 2);
INSERT INTO ANOMALIE (ID, Data, Ora, Livello, Causa, Sensori) VALUES (3, TO_DATE('2024-10-20', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-10-20 08:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Critica', 'Guasto hardware', 3);

-- Popolamento INTERVENTI
INSERT INTO INTERVENTI (ID, Descrizione) VALUES (1, 'Sostituzione sensore di temperatura');
INSERT INTO INTERVENTI (ID, Descrizione) VALUES (2, 'Riparazione connessione sensore di pressione');
INSERT INTO INTERVENTI (ID, Descrizione) VALUES (3, 'Ricalibrazione sensore di gas');

-- Popolamento REPORT con stati personalizzati e data
INSERT INTO REPORT (ID, Stato, Data, Missioni) VALUES (2, 'Inizio missione', TO_DATE('2025-06-15', 'YYYY-MM-DD'), 1); -- Missione 1: Inizio esplorazione
INSERT INTO REPORT (ID, Stato, Data, Missioni) VALUES (1, 'Verifica attrezzature', TO_DATE('2025-06-18', 'YYYY-MM-DD'), 1); -- Missione 1: Verifica attrezzature
INSERT INTO REPORT (ID, Stato, Data, Missioni) VALUES (3, 'Fase finale esplorativa', TO_DATE('2025-12-01', 'YYYY-MM-DD'), 1); -- Missione 1: Ultima fase esplorativa
INSERT INTO REPORT (ID, Stato, Data, Missioni) VALUES (4, 'Analisi dati', TO_DATE('2025-12-10', 'YYYY-MM-DD'), 1); -- Missione 1: Analisi dei dati raccolti
INSERT INTO REPORT (ID, Stato, Data, Missioni) VALUES (5, 'Completamento missione', TO_DATE('2025-12-20', 'YYYY-MM-DD'), 1); -- Missione 1: Completamento

INSERT INTO REPORT (ID, Stato, Data, Missioni) VALUES (6, 'Preparazione missione', TO_DATE('2024-03-10', 'YYYY-MM-DD'), 2); -- Missione 2: Preparazione
INSERT INTO REPORT (ID, Stato, Data, Missioni) VALUES (7, 'Inizio studio crateri', TO_DATE('2024-03-15', 'YYYY-MM-DD'), 2); -- Missione 2: Inizio studio
INSERT INTO REPORT (ID, Stato, Data, Missioni) VALUES (8, 'Fase di campionamento', TO_DATE('2024-04-05', 'YYYY-MM-DD'), 2); -- Missione 2: Campionamento
INSERT INTO REPORT (ID, Stato, Data, Missioni) VALUES (9, 'Fase di analisi', TO_DATE('2024-05-01', 'YYYY-MM-DD'), 2); -- Missione 2: Analisi dei campioni
INSERT INTO REPORT (ID, Stato, Data, Missioni) VALUES (10, 'Risoluzione problemi', TO_DATE('2024-05-10', 'YYYY-MM-DD'), 2); -- Missione 2: Risoluzione problemi tecnici

INSERT INTO REPORT (ID, Stato, Data, Missioni) VALUES  (11, 'Raccolta campioni iniziale', TO_DATE('2023-11-05', 'YYYY-MM-DD'), 3); -- Missione 3: Inizio raccolta campioni
INSERT INTO REPORT (ID, Stato, Data, Missioni) VALUES  (12, 'Fase di laboratorio', TO_DATE('2023-12-01', 'YYYY-MM-DD'), 3); -- Missione 3: Analisi in laboratorio
INSERT INTO REPORT (ID, Stato, Data, Missioni) VALUES  (13, 'Completamento missione', TO_DATE('2024-02-15', 'YYYY-MM-DD'), 3); -- Missione 3: Completamento

INSERT INTO REPORT (ID, Stato, Data, Missioni) VALUES  (15, 'Preparazione missione', TO_DATE('2024-05-01', 'YYYY-MM-DD'), 4); -- Missione 4: Preparazione iniziale
INSERT INTO REPORT (ID, Stato, Data, Missioni) VALUES  (16, 'Risoluzione problemi logistici', TO_DATE('2024-05-05', 'YYYY-MM-DD'), 4); -- Missione 4: Problemi logistici
INSERT INTO REPORT (ID, Stato, Data, Missioni) VALUES  (17, 'Fase di approvvigionamento', TO_DATE('2024-05-10', 'YYYY-MM-DD'), 4); -- Missione 4: Fase di approvvigionamento
INSERT INTO REPORT (ID, Stato, Data, Missioni) VALUES  (18, 'Missione annullata', TO_DATE('2024-05-15', 'YYYY-MM-DD'), 4); -- Missione 4: Annullamento missione


