-- N1 View per la visualizzazione dei membri (nome, cognome) e delle missioni a cui partecipano (obiettivo, stato)
CREATE VIEW MEMBRI_MISSIONI AS
SELECT 
    CONCAT(M.NOME, CONCAT(' ', M.COGNOME)) AS NOME_COMPLETO,
    MI.OBIETTIVO AS OBIETTIVO_MISSIONE, 
    MI.ID AS ID_MISSIONE,
    MI.STATO AS STATO_MISSIONE
FROM 
    PARTECIPAZIONI P
JOIN 
    MEMBRI M ON P.MEMBRO = M.ID
JOIN 
    MISSIONI MI ON P.MISSIONE = MI.ID;

-- N2 View per la visualizzazione dei robot (tipo) e delle missioni a cui partecipano (obiettivo)
CREATE VIEW ROBOT_MISSIONI AS
SELECT 
    R.ID AS ID_ROBOT, 
    R.TIPO AS TIPO_ROBOT, 
    M.ID AS ID_MISSIONE, 
    M.OBIETTIVO AS OBIETTIVO_MISSIONE
FROM 
    UTILIZZO_ROBOT UR
JOIN 
    ROBOT R ON UR.ROBOT = R.ID
JOIN 
    MISSIONI M ON UR.MISSIONE = M.ID;

-- N3 View per la visualizzazione dei sensori (tipo, stato operativo) e dei membri (nome, cognome) che effettuano operazioni (tipo, data) su di essi
CREATE VIEW SENSORI_MISSIONI AS
SELECT
    CONCAT(M.NOME, CONCAT(' ', M.COGNOME)) AS NOME_COMPLETO,
    S.TIPO AS TIPO_SENSORE,
    S.STATO_OPERATIVO AS STATO_SENSORE,
    O.OPERAZIONE AS TIPO_OPERAZIONE,
    O.DATA
FROM 
    OPERAZIONI O
JOIN 
    MEMBRI M ON O.MEMBRO = M.ID
JOIN 
    SENSORI S ON O.SENSORE = S.ID;

-- N4 View per la visualizzazione delle anomalie rilevate per ciascun sensore
CREATE VIEW ANOMALIE_SENSORI AS
SELECT
    S.ID AS ID_SENSORE,
    S.TIPO AS TIPO_SENSORE,
    S.STATO_OPERATIVO AS STATO_SENSORE,
    A.ID AS ID_ANOMALIA,
    A.LIVELLO AS LIVELLO_ANOMALIA,
    A.CAUSA AS CAUSA_ANOMALIA,
    A.DATA,
    TO_CHAR(A.ORA, 'HH24:MI:SS') AS ORA
FROM 
    ANOMALIE A
JOIN 
    SENSORI S ON A.SENSORE = S.ID;

-- N5 View per vedere il numero di missione a cui un membro partecipa
CREATE VIEW PARTECIPAZIONI_MEMBRI AS
SELECT
    M.ID AS ID_MEMBRO,
    CONCAT(CONCAT(M.NOME, ' '), M.COGNOME) AS NOME_COMPLETO,
    COUNT(*) AS NUMERO_PARTECIPAZIONI
FROM
    PARTECIPAZIONI P
JOIN 
    MEMBRI M ON P.MEMBRO = M.ID
JOIN 
    MISSIONI MI ON P.MISSIONE = MI.ID
GROUP BY
    M.ID, M.NOME, M.COGNOME
ORDER BY
    M.ID ASC;

-- N6 View per vedere i report di ogni missione
CREATE VIEW ANDAMENTO_MISSIONI AS
SELECT
    M.ID AS ID_MISSIONE,
    M.OBIETTIVO AS OBIETTIVO_MISSIONE,
    M.STATO AS STATO_MISSIONE,
    R.ID AS ID_REPORT,
    R.STATO AS STATO_REPORT,
    R.DATA AS DATA_REPORT
FROM
    REPORT R
    JOIN MISSIONI M ON R.MISSIONE = M.ID
ORDER BY 
    M.ID ASC;
