-- View per la visualizzazione dei membri (nome, cognome) e delle missioni a cui partecipano (obiettivo, stato)
CREATE VIEW MEMBRI_MISSIONI AS
SELECT 
    M.NOME, 
    M.COGNOME, 
    MI.OBIETTIVO AS OBIETTIVO_MISSIONE, 
    MI.STATO AS STATO_MISSIONE
FROM 
    (PARTECIPAZIONI P 
    JOIN MEMBRI M ON P.MEMBRI = M.ID) 
    JOIN MISSIONI MI ON P.MISSIONI = MI.ID;


-- View per la visualizzazione dei robot (tipo) e delle missioni a cui partecipano (obiettivo)
CREATE VIEW ROBOT_MISSIONI AS
SELECT 
    R.ID AS ID_ROBOT, 
    R.TIPO AS TIPO_ROBOT, 
    M.ID AS ID_MISSIONE, 
    M.OBIETTIVO AS OBIETTIVO_MISSIONE
FROM 
    (UTILIZZO_ROBOT UR 
    JOIN ROBOT R ON UR.ROBOT = R.ID) 
    JOIN MISSIONI M ON UR.MISSIONE = M.ID;


-- View per la visualizzazione dei sensori (tipo, stato operativo) e dei membri che effettuano operazioni su di essi (nome, cognome)
CREATE VIEW SENSORI_MISSIONI AS
SELECT
    M.NOME,
    M.COGNOME,
    S.TIPO AS TIPO_SENSORE,
    S.STATO_OPERATIVO AS STATO_SENSORE,
    O.OPERAZIONE AS TIPO_OPERAZIONE,
    O.DATA
FROM 
    (OPERAZIONI O
    JOIN MEMBRI M ON O.MEMBRO = M.ID)
	JOIN SENSORI S ON O.SENSORE = S.ID;


-- View per la visualizzazione delle anomalie rilevate per ciascun sensore
CREATE VIEW ANOMALIE_SENSORI AS
SELECT
    S.ID AS ID_SENSORE,
    S.TIPO AS TIPO_SENSORE,
    S.STATO_OPERATIVO AS STATO_SENSORE,
    A.ID AS ID_ANOMALIA,
    A.LIVELLO AS LIVELLO_ANOMALIA,
    A.CAUSA AS CAUSA_ANOMALIA,
    A.DATA,
    A.ORA
FROM 
    (ANOMALIE A
    JOIN SENSORI S ON A.SENSORE = S.ID);


-- View per la visualizzazione delle missioni completate da ciascun robot
CREATE VIEW MISSIONI_COMPLETATE AS
SELECT
    R.ID AS ID_ROBOT,
    R.TIPO AS TIPO_ROBOT,
    M.ID AS ID_MISSIONE,
    M.OBIETTIVO AS OBIETTIVO_MISSIONE,
    UR.DATA_COMPLETAMENTO
FROM 
    (UTILIZZO_ROBOT UR 
    JOIN ROBOT R ON UR.ROBOT = R.ID) 
    JOIN MISSIONI M ON UR.MISSIONE = M.ID
WHERE 
    UR.STATO = 'COMPLETATA';


