-- PROCEDURA PER INSERIRE UN SENSORE IN UNA MISSIONE
CREATE OR REPLACE PROCEDURE AssegnareSensoreAMissione(
    p_Sensore_ID IN NUMBER,
    p_Missione_ID IN NUMBER
) AS
BEGIN
    INSERT INTO UTILIZZO_SENSORI (Sensore, Missione)
    VALUES (p_Sensore_ID, p_Missione_ID);
    
    DBMS_OUTPUT.PUT_LINE('Sensore ' || p_Sensore_ID || ' assegnato alla missione ' || p_Missione_ID);
END;
--FUNZIONA, ESEMPIO SOTTO:
EXECUTE AssegnareSensoreAMissione(p_Sensore_ID => 11, p_Missione_ID => 1);



-- INSERIRE UN MEMBRO NELLA TABELLA COINVOLGIMENTI RELATIVAMENTE AD UN INTERVENTO
CREATE OR REPLACE PROCEDURE InserireMembroInCoinvolgimento(
    p_Membro_ID IN NUMBER,
    p_Intervento_ID IN NUMBER
) AS
BEGIN
    -- Inserisce il membro nell'intervento in corso
    INSERT INTO COINVOLGIMENTI (Membro, Intervento)
    VALUES (p_Membro_ID, p_Intervento_ID);
    
    DBMS_OUTPUT.PUT_LINE('Membro con ID ' || p_Membro_ID || ' aggiunto all''intervento con ID ' || p_Intervento_ID);
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Errore: il membro con ID ' || p_Membro_ID || ' è già coinvolto nell''intervento con ID ' || p_Intervento_ID);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Errore imprevisto: ' || SQLERRM);
END InserireMembroInCoinvolgimento;
--FUNZIONA, ESEMPIO SOTTO
EXECUTE InserireMembroInCoinvolgimento(p_Membro_ID => 15, p_Intervento_ID => 10);



-- PROCEDURA PER AGGIORNARE LO STATO OPERATIVO DI UN SENSORE
CREATE OR REPLACE PROCEDURE AggiornareStatoSensore(
    p_Sensore_ID IN NUMBER,
    p_Nuovo_Stato IN VARCHAR2
) AS
BEGIN
    UPDATE SENSORI
    SET Stato_Operativo = p_Nuovo_Stato
    WHERE ID = p_Sensore_ID;
    
    DBMS_OUTPUT.PUT_LINE('Stato del sensore ' || p_Sensore_ID || ' aggiornato a ' || p_Nuovo_Stato);
END;
--FUNZIONA, ESEMPIO SOTTO:
EXECUTE AggiornareStatoSensore(p_Sensore_ID => 5, p_Nuovo_Stato => 'Manutenzione');


