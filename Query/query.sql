--ANOMALIE CON LIVELLO = 'CRITICA' 
SELECT A.ID AS ID_SENSORE, A.CAUSA AS CAUSA_ANOMALIA, S.TIPO AS TIPO_SENSORE
FROM ANOMALIE A JOIN SENSORI S ON A.SENSORE = S.ID
WHERE A.Livello = 'Critica';

--NUMERO DI ROBOT UTILIZZATI DA OGNI MISSIONE
SELECT 
    M.ID AS ID_MISSIONE,
    M.OBIETTIVO AS OBIETTIVO_MISSIONE,
    COUNT(*) AS NUMERO_ROBOT_MISSIONE
FROM 
    UTILIZZO_ROBOT UR 
JOIN 
    ROBOT R ON UR.Robot = R.ID
JOIN 
    MISSIONI M ON M.ID = UR.Missione
GROUP BY 
    M.ID, M.OBIETTIVO
ORDER BY 
    M.ID ASC;
  
--SELEZIONARE LA CAUSA PRINCIPALE DI ANOMALIE
SELECT A.CAUSA, COUNT(*) AS NUM_VOLTE
FROM ANOMALIE A
GROUP BY A.CAUSA
HAVING COUNT(*) = (
    SELECT MAX(NUM_CAUSE)
    FROM (
        SELECT A.CAUSA, COUNT(*) AS NUM_CAUSE
        FROM ANOMALIE A
        GROUP BY A.CAUSA
    ) 
);
--TESTATA

--IL NUMERO DI MEMBRI COINVOLTI IN CIASCUNA OPERAZIONE ATTIVA, PER OGNI SENSORE
SELECT S.ID AS ID_SENSORE, O.Operazione, COUNT(O.Membro) AS NUM_MEMBRI
FROM OPERAZIONI O
JOIN MEMBRI M ON O.Membro = M.ID
JOIN SENSORI S ON O.Sensore = S.ID
WHERE S.Stato_Operativo = 'Attivo'
GROUP BY S.ID, O.Operazione;
--TESTATA

--IL NUMERO DI INTERVENTI EFFETTUATI DA OGNI MEMBRO DELL'EQUIPAGGIO
SELECT M.ID, M.Nome, M.Cognome, COUNT(*) AS NUM_INTERVENTI_EFFETTUATI
FROM COINVOLGIMENTI C
JOIN MEMBRI M ON C.Membro = M.ID
GROUP BY M.ID, M.Nome, M.Cognome
ORDER BY M.ID ASC;
--TESTATA

--CERCARE IL SENSORE CHE NON HA MAI AVUTO UNA ANOMALIA
SELECT ID
FROM SENSORI
WHERE ID NOT IN
(SELECT S.ID 
FROM SENSORI S JOIN ANOMALIE A 
ON S.ID = A.SENSORE 
GROUP BY S.ID);
--TESTATA
