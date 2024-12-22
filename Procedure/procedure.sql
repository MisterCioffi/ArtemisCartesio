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


--PROCEDURA CHE ESEGUE UNA OPERAZIONE DI MANUTENZIONE SE LA DATA DELL'ULTIMO CONTROLLO E' MAGGIORE DI 30 GIORNI
CREATE OR REPLACE PROCEDURE controlla_manutenzione_sensori AS
    CURSOR membri_cursor IS
        SELECT ID
        FROM MEMBRI
        WHERE Ruolo = 'Manutentore'; -- Trova tutti i manutentori
    v_membro_id INT;
    v_membro_index INT := 0;
    v_tot_membri INT := 0;
    TYPE membri_table_type IS TABLE OF membri_cursor%ROWTYPE INDEX BY PLS_INTEGER;
    membri_table membri_table_type;
BEGIN
    -- Inizializza la tabella con i membri
    OPEN membri_cursor;
    LOOP
        FETCH membri_cursor INTO membri_table(v_tot_membri + 1);
        EXIT WHEN membri_cursor%NOTFOUND;
        v_tot_membri := v_tot_membri + 1;
    END LOOP;
    CLOSE membri_cursor;

    -- Verifica per tutti i sensori se la data dell'ultimo controllo è più di 30 giorni fa
    FOR sensore_rec IN (SELECT ID, Data_Ultimo_Controllo FROM SENSORI) LOOP
        IF sensore_rec.Data_Ultimo_Controllo < (SYSDATE - 30) THEN
            -- Assegna il prossimo membro disponibile in modo ciclico
            v_membro_index := MOD(v_membro_index, v_tot_membri) + 1;
            v_membro_id := membri_table(v_membro_index).ID;

            -- Inserisce una nuova operazione di manutenzione
            INSERT INTO OPERAZIONI (Membro, Sensore, Operazione, Data)
            VALUES (v_membro_id, sensore_rec.ID, 'Manutenzione', SYSDATE);

            -- Aggiorna la Data_Ultimo_Controllo del sensore
            UPDATE SENSORI
            SET Data_Ultimo_Controllo = SYSDATE
            WHERE ID = sensore_rec.ID;
        END IF;
    END LOOP;
END;
/


