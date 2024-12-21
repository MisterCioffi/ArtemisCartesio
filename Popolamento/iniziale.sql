
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

