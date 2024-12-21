
-- Popolamento MISSIONI
INSERT INTO MISSIONI (ID, Obiettivo, Data_Inizio, Data_Fine, Stato) VALUES (1, 'Esplorazione Polo Sud Lunare', TO_DATE('2025-06-15', 'YYYY-MM-DD'), TO_DATE('2025-12-20', 'YYYY-MM-DD'), 'In corso');
INSERT INTO MISSIONI (ID, Obiettivo, Data_Inizio, Data_Fine, Stato) VALUES (2, 'Studio Crateri Lunari', TO_DATE('2024-03-10', 'YYYY-MM-DD'), NULL, 'Pianificata');
INSERT INTO MISSIONI (ID, Obiettivo, Data_Inizio, Data_Fine, Stato) VALUES (3, 'Raccolta Campioni di Rocce', TO_DATE('2023-11-05', 'YYYY-MM-DD'), TO_DATE('2024-02-15', 'YYYY-MM-DD'), 'Completata');
INSERT INTO MISSIONI (ID, Obiettivo, Data_Inizio, Data_Fine, Stato) VALUES (4, 'Installazione Base Avanzata', TO_DATE('2024-05-01', 'YYYY-MM-DD'), NULL, 'Annullata');
INSERT INTO MISSIONI (ID, Obiettivo, Data_Inizio, Data_Fine, Stato) VALUES (5, 'Esplorazione del suolo marziano', TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2024-06-30', 'YYYY-MM-DD'), 'Completata'),
INSERT INTO MISSIONI (ID, Obiettivo, Data_Inizio, Data_Fine, Stato) VALUES (6, 'Monitoraggio della pressione atmosferica', TO_DATE('2024-07-01', 'YYYY-MM-DD'), NULL, 'In corso');
INSERT INTO MISSIONI (ID, Obiettivo, Data_Inizio, Data_Fine, Stato) VALUES (7, 'Ricerca perdite di gas', TO_DATE('2025-01-01', 'YYYY-MM-DD'), NULL, 'Pianificata');
INSERT INTO MISSIONI (ID, Obiettivo, Data_Inizio, Data_Fine, Stato) VALUES (8, 'Controllo radiazioni', TO_DATE('2025-07-01', 'YYYY-MM-DD'), NULL, 'Pianificata');

-- Popolamento MEMBRI
INSERT INTO MEMBRI (ID, Nome, Cognome, Ruolo) VALUES (1, 'Luca', 'Rossi', 'Comandante');
INSERT INTO MEMBRI (ID, Nome, Cognome, Ruolo) VALUES (2, 'Anna', 'Esposito', 'Ingegnere');
INSERT INTO MEMBRI (ID, Nome, Cognome, Ruolo) VALUES (3, 'Marco', 'Verdi', 'Scienziato');
INSERT INTO MEMBRI (ID, Nome, Cognome, Ruolo) VALUES (4, 'Elisa', 'Corsetti', 'Medico');
INSERT INTO MEMBRI (ID, Nome, Cognome, Ruolo) VALUES (5, 'Giovanni', 'Ferri', 'Manutentore');
INSERT INTO MEMBRI (ID, Nome, Cognome, Ruolo) VALUES (6, 'Sara', 'Russo', 'Manutentore');
INSERT INTO MEMBRI (ID, Nome, Cognome, Ruolo) VALUES (7, 'Gianluca', 'Masotti', 'Ingegnere');
INSERT INTO MEMBRI (ID, Nome, Cognome, Ruolo) VALUES (8, 'Greta', 'Di Toro', 'Tecnico');
INSERT INTO MEMBRI (ID, Nome, Cognome, Ruolo) VALUES (9, 'Edoardo', 'Bianchi', 'Scienziato');
INSERT INTO MEMBRI (ID, Nome, Cognome, Ruolo) VALUES (10, 'Matteo', 'Adaggio', 'Ingegnere');
INSERT INTO MEMBRI (ID, Nome, Cognome, Ruolo) VALUES (11, 'Luigi', 'Cirillo', 'Ingegnere');
INSERT INTO MEMBRI (ID, Nome, Cognome, Ruolo) VALUES (12, 'Giulia', 'Ferrari', 'Scienziato');
INSERT INTO MEMBRI (ID, Nome, Cognome, Ruolo) VALUES (13, 'Alessio', 'Mancini', 'Medico');
INSERT INTO MEMBRI (ID, Nome, Cognome, Ruolo) VALUES (14, 'Elena', 'Bianchi', 'Ingegnere');
INSERT INTO MEMBRI (ID, Nome, Cognome, Ruolo) VALUES (15, 'Paolo', 'Frosti', 'Scienziato');
INSERT INTO MEMBRI (ID, Nome, Cognome, Ruolo) VALUES (16, 'Roberto', 'Corti', 'Medico');

-- Popolamento SENSORI
INSERT INTO SENSORI (ID, Data_Installazione, Data_Ultimo_Controllo, Tipo, Latitudine, Longitudine, Altitudine) VALUES (1, TO_DATE('2023-12-01', 'YYYY-MM-DD'), TO_DATE('2024-02-10', 'YYYY-MM-DD'), 'Temperatura', -85.0, 123.0, 500.0);
INSERT INTO SENSORI (ID, Data_Installazione, Data_Ultimo_Controllo, Tipo, Latitudine, Longitudine, Altitudine) VALUES (2, TO_DATE('2024-01-15', 'YYYY-MM-DD'), NULL, 'Pressione', -45.0, 67.5, 150.0);
INSERT INTO SENSORI (ID, Data_Installazione, Data_Ultimo_Controllo, Tipo, Latitudine, Longitudine, Altitudine) VALUES (3, TO_DATE('2022-08-20', 'YYYY-MM-DD'), TO_DATE('2023-11-25', 'YYYY-MM-DD'), 'Gas', -12.5, 34.6, 250.0);
INSERT INTO SENSORI (ID, Data_Installazione, Data_Ultimo_Controllo, Tipo, Latitudine, Longitudine, Altitudine) VALUES (4, TO_DATE('2024-06-10', 'YYYY-MM-DD'), NULL, 'Radiazioni', -65.4, 98.1, 300.0);
INSERT INTO SENSORI (ID, Data_Installazione, Data_Ultimo_Controllo, Tipo, Latitudine, Longitudine, Altitudine) VALUES (5, TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2024-01-01', 'YYYY-MM-DD'), 'Temperatura', 45.0, 12.0, 100.0);
INSERT INTO SENSORI (ID, Data_Installazione, Data_Ultimo_Controllo, Tipo, Latitudine, Longitudine, Altitudine) VALUES (6, TO_DATE('2023-06-01', 'YYYY-MM-DD'), NULL, 'Pressione', 46.0, 13.0, 200.0);
INSERT INTO SENSORI (ID, Data_Installazione, Data_Ultimo_Controllo, Tipo, Latitudine, Longitudine, Altitudine) VALUES (7, TO_DATE('2023-12-01', 'YYYY-MM-DD'), TO_DATE('2024-02-10', 'YYYY-MM-DD'), 'Temperatura', -85.0, 123.0, 500.0);
INSERT INTO SENSORI (ID, Data_Installazione, Data_Ultimo_Controllo, Tipo, Latitudine, Longitudine, Altitudine) VALUES (8, TO_DATE('2024-01-15', 'YYYY-MM-DD'), NULL, 'Pressione', -45.0, 67.5, 150.0);
INSERT INTO SENSORI (ID, Data_Installazione, Data_Ultimo_Controllo, Tipo, Latitudine, Longitudine, Altitudine) VALUES (9, TO_DATE('2022-08-20', 'YYYY-MM-DD'), TO_DATE('2023-11-25', 'YYYY-MM-DD'), 'Gas', -12.5, 34.6, 250.0);
INSERT INTO SENSORI (ID, Data_Installazione, Data_Ultimo_Controllo, Tipo, Latitudine, Longitudine, Altitudine) VALUES (10, TO_DATE('2024-06-10', 'YYYY-MM-DD'), NULL, 'Geologia', -65.4, 98.1, 300.0);
INSERT INTO SENSORI (ID, Data_Installazione, Data_Ultimo_Controllo, Tipo, Latitudine, Longitudine, Altitudine) VALUES (11, TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2024-01-01', 'YYYY-MM-DD'), 'Temperatura', 45.0, 12.0, 100.0);

-- Popolamento ROBOT
INSERT INTO ROBOT (ID, Tipo) VALUES (1, 'Rover Esplorativo');
INSERT INTO ROBOT (ID, Tipo) VALUES (2, 'Drone Aereo');
INSERT INTO ROBOT (ID, Tipo) VALUES (3, 'Robot Minatore');
INSERT INTO ROBOT (ID, Tipo) VALUES (4, 'Robot Assistente');
INSERT INTO ROBOT (ID, Tipo) VALUES (5, 'Perforatore');
INSERT INTO ROBOT (ID, Tipo) VALUES (6, 'Sonda Spaziale');
INSERT INTO ROBOT (ID, Tipo) VALUES (7, 'Veicolo Lunare');
INSERT INTO ROBOT (ID, Tipo) VALUES (8, 'Crawler');
INSERT INTO ROBOT (ID, Tipo) VALUES (9, 'Veicolo Autonomo');
INSERT INTO ROBOT (ID, Tipo) VALUES (10, 'Navicella Spaziale');
INSERT INTO ROBOT (ID, Tipo) VALUES (14, 'Analizzatore di campioni');
INSERT INTO ROBOT (ID, Tipo) VALUES (15, 'Veicolo di supporto');
INSERT INTO ROBOT (ID, Tipo) VALUES (16, 'Veicolo di trasporto');
INSERT INTO ROBOT (ID, Tipo) VALUES (17, 'Analizzatore di gas');

-- Popolamento INTERVENTI
INSERT INTO INTERVENTI (ID, Descrizione) VALUES (1, 'Sostituzione sensore di temperatura');
INSERT INTO INTERVENTI (ID, Descrizione) VALUES (2, 'Riparazione connessione sensore di pressione');
INSERT INTO INTERVENTI (ID, Descrizione) VALUES (3, 'Ricalibrazione sensore di gas');
INSERT INTO INTERVENTI (ID, Descrizione) VALUES (4, 'Sostituzione sensore di radiazioni'); 
INSERT INTO INTERVENTI (ID, Descrizione) VALUES (5, 'Riparazione connessione sensore di temperatura');
INSERT INTO INTERVENTI (ID, Descrizione) VALUES (6, 'Ricalibrazione sensore di pressione');
INSERT INTO INTERVENTI (ID, Descrizione) VALUES (7, 'Sostituzione sensore di gas');
INSERT INTO INTERVENTI (ID, Descrizione) VALUES (8, 'Pulizia sensore di radiazioni');
INSERT INTO INTERVENTI (ID, Descrizione) VALUES (9, 'Manutenzione sensore di temperatura');
INSERT INTO INTERVENTI (ID, Descrizione) VALUES (10, 'Manutenzione sensore di pressione');

-- Popolamento UTILIZZO_SENSORI
INSERT INTO UTILIZZO_SENSORI (Sensore, Missione) VALUES (1, 1); -- Sensore di Temperatura per esplorazione Polo Sud Lunare
INSERT INTO UTILIZZO_SENSORI (Sensore, Missione) VALUES (2, 2); -- Sensore di Pressione per studio crateri lunari
INSERT INTO UTILIZZO_SENSORI (Sensore, Missione) VALUES (3, 3); -- Sensore di Gas per raccolta campioni di rocce
INSERT INTO UTILIZZO_SENSORI (Sensore, Missione) VALUES (4, 4); -- Sensore di Radiazioni per installazione base avanzata
INSERT INTO UTILIZZO_SENSORI (Sensore, Missione) VALUES (5, 5); -- Sensore di Temperatura per esplorazione suolo marziano
INSERT INTO UTILIZZO_SENSORI (Sensore, Missione) VALUES (6, 6); -- Sensore di Pressione per monitoraggio atmosferico
INSERT INTO UTILIZZO_SENSORI (Sensore, Missione) VALUES (7, 7); -- Sensore di Gas per ricerca perdite di gas
INSERT INTO UTILIZZO_SENSORI (Sensore, Missione) VALUES (8, 8); -- Sensore di Radiazioni per controllo radiazioni
INSERT INTO UTILIZZO_SENSORI (Sensore, Missione) VALUES (9, 9); -- Sensore di Temperatura per esplorazione asteroide
INSERT INTO UTILIZZO_SENSORI (Sensore, Missione) VALUES (10, 10); -- Sensore di Pressione per ricerca di vita extraterrestre
INSERT INTO UTILIZZO_SENSORI (Sensore, Missione) VALUES (11, 11); -- Sensore di Temperatura per esplorazione suolo marziano
INSERT INTO UTILIZZO_SENSORI (Sensore, Missione) VALUES (1, 5); -- Sensore di Temperatura per esplorazione suolo marziano
INSERT INTO UTILIZZO_SENSORI (Sensore, Missione) VALUES (2, 6); -- Sensore di Pressione per monitoraggio atmosferico
INSERT INTO UTILIZZO_SENSORI (Sensore, Missione) VALUES (3, 7); -- Sensore di Gas per ricerca perdite di gas
INSERT INTO UTILIZZO_SENSORI (Sensore, Missione) VALUES (4, 8); -- Sensore di Radiazioni per controllo radiazioni
INSERT INTO UTILIZZO_SENSORI (Sensore, Missione) VALUES (5, 9); -- Sensore di Temperatura per esplorazione asteroide
INSERT INTO UTILIZZO_SENSORI (Sensore, Missione) VALUES (6, 10); -- Sensore di Pressione per ricerca di vita extraterrestre
INSERT INTO UTILIZZO_SENSORI (Sensore, Missione) VALUES (7, 11); -- Sensore di Gas per esplorazione suolo marziano


-- Popolamento RILEVAZIONI per il sensore 1 (Temperatura)
INSERT INTO RILEVAZIONI (ID, Data, Ora, Valore, Sensore) VALUES  (1, TO_DATE('2023-12-01', 'YYYY-MM-DD'), TO_TIMESTAMP('2023-12-01 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), -85.0, 1); -- Temperatura
INSERT INTO RILEVAZIONI (ID, Data, Ora, Valore, Sensore) VALUES  (2, TO_DATE('2023-12-01', 'YYYY-MM-DD'), TO_TIMESTAMP('2023-12-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), -84.5, 1);
INSERT INTO RILEVAZIONI (ID, Data, Ora, Valore, Sensore) VALUES  (3, TO_DATE('2023-12-01', 'YYYY-MM-DD'), TO_TIMESTAMP('2023-12-01 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), -84.0, 1);
INSERT INTO RILEVAZIONI (ID, Data, Ora, Valore, Sensore) VALUES  (4, TO_DATE('2023-12-02', 'YYYY-MM-DD'), TO_TIMESTAMP('2023-12-02 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), -85.2, 1);
INSERT INTO RILEVAZIONI (ID, Data, Ora, Valore, Sensore) VALUES  (5, TO_DATE('2023-12-02', 'YYYY-MM-DD'), TO_TIMESTAMP('2023-12-02 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), -85.5, 1);

-- Popolamento RILEVAZIONI per il sensore 2 (Pressione)
INSERT INTO RILEVAZIONI (ID, Data, Ora, Valore, Sensore) VALUES  (1, TO_DATE('2024-01-15', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-01-15 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1015.5, 2); -- Pressione
INSERT INTO RILEVAZIONI (ID, Data, Ora, Valore, Sensore) VALUES  (2, TO_DATE('2024-01-15', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-01-15 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1016.0, 2);
INSERT INTO RILEVAZIONI (ID, Data, Ora, Valore, Sensore) VALUES  (3, TO_DATE('2024-01-15', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-01-15 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1015.8, 2);
INSERT INTO RILEVAZIONI (ID, Data, Ora, Valore, Sensore) VALUES  (4, TO_DATE('2024-01-16', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-01-16 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1015.2, 2);

-- Popolamento RILEVAZIONI per il sensore 3 (Gas)
INSERT INTO RILEVAZIONI (ID, Data, Ora, Valore, Sensore) VALUES  (1, TO_DATE('2022-08-20', 'YYYY-MM-DD'), TO_TIMESTAMP('2022-08-20 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 0.35, 3); -- Gas
INSERT INTO RILEVAZIONI (ID, Data, Ora, Valore, Sensore) VALUES  (2, TO_DATE('2022-08-20', 'YYYY-MM-DD'), TO_TIMESTAMP('2022-08-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 0.33, 3);
INSERT INTO RILEVAZIONI (ID, Data, Ora, Valore, Sensore) VALUES  (3, TO_DATE('2022-08-20', 'YYYY-MM-DD'), TO_TIMESTAMP('2022-08-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 0.32, 3);
INSERT INTO RILEVAZIONI (ID, Data, Ora, Valore, Sensore) VALUES  (4, TO_DATE('2022-08-21', 'YYYY-MM-DD'), TO_TIMESTAMP('2022-08-21 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 0.34, 3);

-- Popolamento RILEVAZIONI per il sensore 4 (Radiazioni)
INSERT INTO RILEVAZIONI (ID, Data, Ora, Valore, Sensore) VALUES  (1, TO_DATE('2024-06-10', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-06-10 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 0.08, 4); -- Radiazioni
INSERT INTO RILEVAZIONI (ID, Data, Ora, Valore, Sensore) VALUES  (2, TO_DATE('2024-06-10', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-06-10 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 0.10, 4);
INSERT INTO RILEVAZIONI (ID, Data, Ora, Valore, Sensore) VALUES  (3, TO_DATE('2024-06-10', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-06-10 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 0.09, 4);
INSERT INTO RILEVAZIONI (ID, Data, Ora, Valore, Sensore) VALUES  (4, TO_DATE('2024-06-11', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-06-11 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 0.11, 4);

-- Popolamento RILEVAZIONI per il sensore 5 (Temperatura)
INSERT INTO RILEVAZIONI (ID, Data, Ora, Valore, Sensore) VALUES  (1, TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_TIMESTAMP('2023-01-01 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 45.0, 5); -- Temperatura
INSERT INTO RILEVAZIONI (ID, Data, Ora, Valore, Sensore) VALUES  (2, TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_TIMESTAMP('2023-09-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 45.5, 5);
INSERT INTO RILEVAZIONI (ID, Data, Ora, Valore, Sensore) VALUES  (3, TO_DATE('2023-11-11', 'YYYY-MM-DD'), TO_TIMESTAMP('2023-11-11 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 46.0, 5);

-- Popolamento RILEVAZIONI per il sensore 6 (Pressione)
INSERT INTO RILEVAZIONI (ID, Data, Ora, Valore, Sensore) VALUES  (1, TO_DATE('2022-06-01', 'YYYY-MM-DD'), TO_TIMESTAMP('2022-06-01 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1000.0, 6); -- Pressione
INSERT INTO RILEVAZIONI (ID, Data, Ora, Valore, Sensore) VALUES  (2, TO_DATE('2023-03-09', 'YYYY-MM-DD'), TO_TIMESTAMP('2023-03-09 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1000.5, 6);
INSERT INTO RILEVAZIONI (ID, Data, Ora, Valore, Sensore) VALUES  (3, TO_DATE('2023-08-18', 'YYYY-MM-DD'), TO_TIMESTAMP('2023-08-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1001.0, 6);

-- Popolamento RILEVAZIONI per il sensore 7 (Gas) 
INSERT INTO RILEVAZIONI (ID, Data, Ora, Valore, Sensore) VALUES  (1, TO_DATE('2022-08-20', 'YYYY-MM-DD'), TO_TIMESTAMP('2022-08-20 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 0.35, 7); -- Gas
INSERT INTO RILEVAZIONI (ID, Data, Ora, Valore, Sensore) VALUES  (2, TO_DATE('2022-08-21', 'YYYY-MM-DD'), TO_TIMESTAMP('2022-08-21 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 0.33, 7);
INSERT INTO RILEVAZIONI (ID, Data, Ora, Valore, Sensore) VALUES  (3, TO_DATE('2022-08-22', 'YYYY-MM-DD'), TO_TIMESTAMP('2022-08-22 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 0.32, 7);

-- Popolamento RILEVAZIONI per il sensore 8 (Radiazioni)
INSERT INTO RILEVAZIONI (ID, Data, Ora, Valore, Sensore) VALUES  (1, TO_DATE('2024-06-10', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-06-10 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 0.08, 8); -- Radiazioni
INSERT INTO RILEVAZIONI (ID, Data, Ora, Valore, Sensore) VALUES  (2, TO_DATE('2024-06-11', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-06-11 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 0.10, 8);
INSERT INTO RILEVAZIONI (ID, Data, Ora, Valore, Sensore) VALUES  (3, TO_DATE('2024-08-12', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-08-12 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 0.09, 8);

-- Popolamento RILEVAZIONI per il sensore 9 (Temperatura)
INSERT INTO RILEVAZIONI (ID, Data, Ora, Valore, Sensore) VALUES  (1, TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_TIMESTAMP('2023-01-01 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 45.0, 9); -- Temperatura
INSERT INTO RILEVAZIONI (ID, Data, Ora, Valore, Sensore) VALUES  (2, TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_TIMESTAMP('2023-09-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 45.5, 9);
INSERT INTO RILEVAZIONI (ID, Data, Ora, Valore, Sensore) VALUES  (3, TO_DATE('2023-11-11', 'YYYY-MM-DD'), TO_TIMESTAMP('2023-11-11 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 46.0, 9);

-- Popolamento RILEVAZIONI per il sensore 10 (Pressione)
INSERT INTO RILEVAZIONI (ID, Data, Ora, Valore, Sensore) VALUES  (1, TO_DATE('2022-06-01', 'YYYY-MM-DD'), TO_TIMESTAMP('2022-06-01 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1000.0, 10); -- Pressione
INSERT INTO RILEVAZIONI (ID, Data, Ora, Valore, Sensore) VALUES  (2, TO_DATE('2023-03-09', 'YYYY-MM-DD'), TO_TIMESTAMP('2023-03-09 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1000.5, 10);
INSERT INTO RILEVAZIONI (ID, Data, Ora, Valore, Sensore) VALUES  (3, TO_DATE('2023-08-18', 'YYYY-MM-DD'), TO_TIMESTAMP('2023-08-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1001.0, 10);

-- Popolamento RILEVAZIONI per il sensore 11 (Temperatura)
INSERT INTO RILEVAZIONI (ID, Data, Ora, Valore, Sensore) VALUES  (1, TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_TIMESTAMP('2023-01-01 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 45.0, 11); -- Temperatura
INSERT INTO RILEVAZIONI (ID, Data, Ora, Valore, Sensore) VALUES  (2, TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_TIMESTAMP('2023-09-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 45.5, 11);
INSERT INTO RILEVAZIONI (ID, Data, Ora, Valore, Sensore) VALUES  (3, TO_DATE('2023-11-11', 'YYYY-MM-DD'), TO_TIMESTAMP('2023-11-11 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 46.0, 11);


-- Popolamento UTILIZZO_ROBOT, le missioni sono 10
INSERT INTO UTILIZZO_ROBOT (Robot, Missione) VALUES (1, 1); -- Rover Esplorativo nella missione di esplorazione Polo Sud Lunare
INSERT INTO UTILIZZO_ROBOT (Robot, Missione) VALUES (2, 2); -- Drone Aereo per studio crateri lunari
INSERT INTO UTILIZZO_ROBOT (Robot, Missione) VALUES (3, 3); -- Robot Minatore per raccolta campioni di rocce
INSERT INTO UTILIZZO_ROBOT (Robot, Missione) VALUES (1, 4); -- Rover Esplorativo per installazione base avanzata
INSERT INTO UTILIZZO_ROBOT (Robot, Missione) VALUES (2, 5); -- Drone Aereo per esplorazione suolo marziano
INSERT INTO UTILIZZO_ROBOT (Robot, Missione) VALUES (3, 6); -- Robot Minatore per monitoraggio atmosferico
INSERT INTO UTILIZZO_ROBOT (Robot, Missione) VALUES (1, 7); -- Rover Esplorativo per ricerca perdite di gas
INSERT INTO UTILIZZO_ROBOT (Robot, Missione) VALUES (2, 8); -- Drone Aereo per controllo radiazioni
INSERT INTO UTILIZZO_ROBOT (Robot, Missione) VALUES (3, 9); -- Robot Minatore per esplorazione asteroide
INSERT INTO UTILIZZO_ROBOT (Robot, Missione) VALUES (1, 10); -- Rover Esplorativo per ricerca di vita extraterrestre
INSERT INTO UTILIZZO_ROBOT (Robot, Missione) VALUES (2, 3); -- Drone Aereo per esplorazione suolo marziano
INSERT INTO UTILIZZO_ROBOT (Robot, Missione) VALUES (3, 4); -- Robot Minatore per installazione base avanzata
INSERT INTO UTILIZZO_ROBOT (Robot, Missione) VALUES (1, 5); -- Rover Esplorativo per esplorazione suolo marziano
INSERT INTO UTILIZZO_ROBOT (Robot, Missione) VALUES (2, 6); -- Drone Aereo per monitoraggio atmosferico
INSERT INTO UTILIZZO_ROBOT (Robot, Missione) VALUES (3, 7); -- Robot Minatore per ricerca perdite di gas
INSERT INTO UTILIZZO_ROBOT (Robot, Missione) VALUES (1, 8); -- Rover Esplorativo per controllo radiazioni
INSERT INTO UTILIZZO_ROBOT (Robot, Missione) VALUES (2, 9); -- Drone Aereo per esplorazione asteroide
INSERT INTO UTILIZZO_ROBOT (Robot, Missione) VALUES (3, 10); -- Robot Minatore per ricerca di vita extraterrestre


-- Popolamento ANOMALIE
INSERT INTO ANOMALIE (ID, Data, Ora, Livello, Causa, Sensore) VALUES (1, TO_DATE('2024-12-01', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-12-01 10:15:00', 'YYYY-MM-DD HH24:MI:SS'), 'Alta', 'Errore di calibrazione', 1);
INSERT INTO ANOMALIE (ID, Data, Ora, Livello, Causa, Sensore) VALUES (2, TO_DATE('2024-11-15', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-11-15 14:45:00', 'YYYY-MM-DD HH24:MI:SS'), 'Media', 'Sensore non risponde', 3);
INSERT INTO ANOMALIE (ID, Data, Ora, Livello, Causa, Sensore) VALUES (3, TO_DATE('2024-10-20', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-10-20 08:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Critica', 'Guasto hardware', 5);
INSERT INTO ANOMALIE (ID, Data, Ora, Livello, Causa, Sensore) VALUES (4, TO_DATE('2024-09-10', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-09-10 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Alta', 'Errore di calibrazione', 7);
INSERT INTO ANOMALIE (ID, Data, Ora, Livello, Causa, Sensore) VALUES (5, TO_DATE('2024-08-01', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-08-01 09:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Media', 'Malfunzionamento', 9);
INSERT INTO ANOMALIE (ID, Data, Ora, Livello, Causa, Sensore) VALUES (6, TO_DATE('2024-07-15', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-07-15 14:45:00', 'YYYY-MM-DD HH24:MI:SS'), 'Critica', 'Problemi di connessione', 11);



-- Popolamento REPORT con stati personalizzati e data
INSERT INTO REPORT (ID, Stato, Data, Missione) VALUES (2, 'Inizio missione', TO_DATE('2025-06-15', 'YYYY-MM-DD'), 1); -- Missione 1: Inizio esplorazione
INSERT INTO REPORT (ID, Stato, Data, Missione) VALUES (1, 'Verifica attrezzature', TO_DATE('2025-06-18', 'YYYY-MM-DD'), 1); -- Missione 1: Verifica attrezzature
INSERT INTO REPORT (ID, Stato, Data, Missione) VALUES (3, 'Fase finale esplorativa', TO_DATE('2025-12-01', 'YYYY-MM-DD'), 1); -- Missione 1: Ultima fase esplorativa
INSERT INTO REPORT (ID, Stato, Data, Missione) VALUES (4, 'Analisi dati', TO_DATE('2025-12-10', 'YYYY-MM-DD'), 1); -- Missione 1: Analisi dei dati raccolti
INSERT INTO REPORT (ID, Stato, Data, Missione) VALUES (5, 'Completamento missione', TO_DATE('2025-12-20', 'YYYY-MM-DD'), 1); -- Missione 1: Completamento

INSERT INTO REPORT (ID, Stato, Data, Missione) VALUES (6, 'Preparazione missione', TO_DATE('2024-03-10', 'YYYY-MM-DD'), 2); -- Missione 2: Preparazione
INSERT INTO REPORT (ID, Stato, Data, Missione) VALUES (7, 'Inizio studio crateri', TO_DATE('2024-03-15', 'YYYY-MM-DD'), 2); -- Missione 2: Inizio studio
INSERT INTO REPORT (ID, Stato, Data, Missione) VALUES (8, 'Fase di campionamento', TO_DATE('2024-04-05', 'YYYY-MM-DD'), 2); -- Missione 2: Campionamento
INSERT INTO REPORT (ID, Stato, Data, Missione) VALUES (9, 'Fase di analisi', TO_DATE('2024-05-01', 'YYYY-MM-DD'), 2); -- Missione 2: Analisi dei campioni
INSERT INTO REPORT (ID, Stato, Data, Missione) VALUES (10, 'Risoluzione problemi', TO_DATE('2024-05-10', 'YYYY-MM-DD'), 2); -- Missione 2: Risoluzione problemi tecnici

INSERT INTO REPORT (ID, Stato, Data, Missione) VALUES  (11, 'Raccolta campioni iniziale', TO_DATE('2023-11-05', 'YYYY-MM-DD'), 3); -- Missione 3: Inizio raccolta campioni
INSERT INTO REPORT (ID, Stato, Data, Missione) VALUES  (12, 'Fase di laboratorio', TO_DATE('2023-12-01', 'YYYY-MM-DD'), 3); -- Missione 3: Analisi in laboratorio
INSERT INTO REPORT (ID, Stato, Data, Missione) VALUES  (13, 'Completamento missione', TO_DATE('2024-02-15', 'YYYY-MM-DD'), 3); -- Missione 3: Completamento

INSERT INTO REPORT (ID, Stato, Data, Missione) VALUES  (15, 'Preparazione missione', TO_DATE('2024-05-01', 'YYYY-MM-DD'), 4); -- Missione 4: Preparazione iniziale
INSERT INTO REPORT (ID, Stato, Data, Missione) VALUES  (16, 'Risoluzione problemi logistici', TO_DATE('2024-05-05', 'YYYY-MM-DD'), 4); -- Missione 4: Problemi logistici
INSERT INTO REPORT (ID, Stato, Data, Missione) VALUES  (17, 'Fase di approvvigionamento', TO_DATE('2024-05-10', 'YYYY-MM-DD'), 4); -- Missione 4: Fase di approvvigionamento
INSERT INTO REPORT (ID, Stato, Data, Missione) VALUES  (18, 'Missione annullata', TO_DATE('2024-05-15', 'YYYY-MM-DD'), 4); -- Missione 4: Annullamento missione

-- Popolamento PARTECIPAZIONI
INSERT INTO PARTECIPAZIONI (Membro, Missione) VALUES (11, 1); 
INSERT INTO PARTECIPAZIONI (Membro, Missione) VALUES (12, 1); 
INSERT INTO PARTECIPAZIONI (Membro, Missione) VALUES (13, 1); 
INSERT INTO PARTECIPAZIONI (Membro, Missione) VALUES (14, 2); 
INSERT INTO PARTECIPAZIONI (Membro, Missione) VALUES (15, 2); 
INSERT INTO PARTECIPAZIONI (Membro, Missione) VALUES (16, 2); 
INSERT INTO PARTECIPAZIONI (Membro, Missione) VALUES (16, 3); 
INSERT INTO PARTECIPAZIONI (Membro, Missione) VALUES (1, 3); 
INSERT INTO PARTECIPAZIONI (Membro, Missione) VALUES (2, 3); 
INSERT INTO PARTECIPAZIONI (Membro, Missione) VALUES (3, 4); 
INSERT INTO PARTECIPAZIONI (Membro, Missione) VALUES (4, 4); 
INSERT INTO PARTECIPAZIONI (Membro, Missione) VALUES (5, 4); 
INSERT INTO PARTECIPAZIONI (Membro, Missione) VALUES (6, 5);
INSERT INTO PARTECIPAZIONI (Membro, Missione) VALUES (7, 5);
INSERT INTO PARTECIPAZIONI (Membro, Missione) VALUES (8, 5);
INSERT INTO PARTECIPAZIONI (Membro, Missione) VALUES (9, 6);
INSERT INTO PARTECIPAZIONI (Membro, Missione) VALUES (10, 6);
INSERT INTO PARTECIPAZIONI (Membro, Missione) VALUES (11, 6);
INSERT INTO PARTECIPAZIONI (Membro, Missione) VALUES (12, 7);
INSERT INTO PARTECIPAZIONI (Membro, Missione) VALUES (13, 7);
INSERT INTO PARTECIPAZIONI (Membro, Missione) VALUES (14, 7);
INSERT INTO PARTECIPAZIONI (Membro, Missione) VALUES (15, 8);
INSERT INTO PARTECIPAZIONI (Membro, Missione) VALUES (16, 8);
INSERT INTO PARTECIPAZIONI (Membro, Missione) VALUES (1, 8);

-- Popolamento OPERAZIONI con stato operativo che può essere
INSERT INTO OPERAZIONI (ID, Stato, Robot, Missione) VALUES (1, 'Attivo', 1, 1); -- Rover Esplorativo
INSERT INTO OPERAZIONI (ID, Stato, Robot, Missione) VALUES (2, 'Standby', 2, 2); -- Drone Aereo
INSERT INTO OPERAZIONI (ID, Stato, Robot, Missione) VALUES (3, 'Manutenzione', 3, 3); -- Robot Minatore
INSERT INTO OPERAZIONI (ID, Stato, Robot, Missione) VALUES (4, 'Malfunzionante', 4, 4); -- Robot Assistente
INSERT INTO OPERAZIONI (ID, Stato, Robot, Missione) VALUES (5, 'Attivo', 5, 5); -- Perforatore
INSERT INTO OPERAZIONI (ID, Stato, Robot, Missione) VALUES (6, 'Standby', 6, 6); -- Sonda Spaziale
INSERT INTO OPERAZIONI (ID, Stato, Robot, Missione) VALUES (7, 'Manutenzione', 7, 7); -- Veicolo Lunare
INSERT INTO OPERAZIONI (ID, Stato, Robot, Missione) VALUES (8, 'Malfunzionante', 8, 8); -- Crawler

-- Popolamento COINVOLGIMENTI

INSERT INTO COINVOLGIMENTI (Membri, Intervento) VALUES (1, 1);
INSERT INTO COINVOLGIMENTI (Membri, Intervento) VALUES (2, 2);
INSERT INTO COINVOLGIMENTI (Membri, Intervento) VALUES (3, 3);
INSERT INTO COINVOLGIMENTI (Membri, Intervento) VALUES (4, 4);
INSERT INTO COINVOLGIMENTI (Membri, Intervento) VALUES (5, 5);
INSERT INTO COINVOLGIMENTI (Membri, Intervento) VALUES (6, 6);
INSERT INTO COINVOLGIMENTI (Membri, Intervento) VALUES (7, 7);

-- Popolamento RISOLUZIONI

INSERT INTO RISOLUZIONI (Anomalia, Intervento, Esito_Intervento, Data_Intervento) VALUES (1, 1, 'Sostituzione sensore', TO_DATE('2024-12-01', 'YYYY-MM-DD'));
INSERT INTO RISOLUZIONI (Anomalia, Intervento, Esito_Intervento, Data_Intervento) VALUES (3, 3, 'Ricalibrazione sensore', TO_DATE('2024-10-20', 'YYYY-MM-DD'));
INSERT INTO RISOLUZIONI (Anomalia, Intervento, Esito_Intervento, Data_Intervento) VALUES (6, 6, 'Ricalibrazione sensore', TO_DATE('2024-07-15', 'YYYY-MM-DD'));
INSERT INTO RISOLUZIONI (Anomalia, Intervento, Esito_Intervento, Data_Intervento) VALUES (4, 4, 'Sostituzione sensore', TO_DATE('2024-09-10', 'YYYY-MM-DD'));
INSERT INTO RISOLUZIONI (Anomalia, Intervento, Esito_Intervento, Data_Intervento) VALUES (2, 2, 'Riparazione connessione', TO_DATE('2024-11-15', 'YYYY-MM-DD'));



