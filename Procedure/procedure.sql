-- N1 Procedura per assegnare un sensore ad una missione
CREATE OR REPLACE PROCEDURE AssegnareSensoreAMissione(
    p_Sensore_ID IN NUMBER,
    p_Missione_ID IN NUMBER
) AS
    v_count_sensore NUMBER;
    v_count_missione NUMBER;
BEGIN
    -- Incrementa il valore di v_count_sensore se esso è presente nel database
    SELECT COUNT(*)
    INTO v_count_sensore
    FROM SENSORI
    WHERE ID = p_Sensore_ID;
    
    -- Incrementa il valore di v_count_missione se esso è presente nel database
    SELECT COUNT(*)
    INTO v_count_missione
    FROM MISSIONI
    WHERE ID = p_Missione_ID;
    
    -- Verifica se essi sono presenti o meno nel databse altrimenti si genera errore
    IF v_count_sensore = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Errore: il sensore con ID ' || p_Sensore_ID || ' non esiste.');
    ELSIF v_count_missione = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Errore: la missione con ID ' || p_Missione_ID || ' non esiste.');
    ELSE
        -- Verifica se il sensore è già assegnato alla missione
        SELECT COUNT(*)
        INTO v_count_sensore
        FROM UTILIZZO_SENSORI
        WHERE Sensore = p_Sensore_ID AND Missione = p_Missione_ID;
        
        IF v_count_sensore = 0 THEN
            -- Se il sensore non è già assegnato, inserisci
            INSERT INTO UTILIZZO_SENSORI (Sensore, Missione)
            VALUES (p_Sensore_ID, p_Missione_ID);
            
            DBMS_OUTPUT.PUT_LINE('Sensore ' || p_Sensore_ID || ' assegnato alla missione ' || p_Missione_ID);
        ELSE
            DBMS_OUTPUT.PUT_LINE('Il sensore ' || p_Sensore_ID || ' è già assegnato alla missione ' || p_Missione_ID);
        END IF;
    END IF;
END;

-- ESEMPIO 1
-- EXECUTE AssegnareSensoreAMissione(11, 1);
-- OUTPUT --> Sensore 11 assegnato alla missione 1

-- ESEMPIO 2
-- EXECUTE AssegnareSensoreAMissione(30, 5);
-- OUTPUT --> Errore: il sensore con ID 30 non esiste.

------------------------------------------------------------------------------------------------

-- N2 Procedura per inserire un membro nella tabella coinvolgimenti relativamente ad un intervento
CREATE OR REPLACE PROCEDURE InserireMembroInCoinvolgimento(
    p_Membro_ID IN NUMBER,
    p_Intervento_ID IN NUMBER
) AS
    v_count_membro NUMBER;
    v_count_intervento NUMBER;
    v_count_coinvolgimento NUMBER;
BEGIN
    -- Verifica se il membro esiste nel database
    SELECT COUNT(*)
    INTO v_count_membro
    FROM MEMBRI
    WHERE ID = p_Membro_ID;
    
    IF v_count_membro = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Errore: il membro con ID ' || p_Membro_ID || ' non esiste nel database.');
    ELSE
        -- Verifica se l'intervento esiste nel database
        SELECT COUNT(*)
        INTO v_count_intervento
        FROM INTERVENTI
        WHERE ID = p_Intervento_ID;
        
        IF v_count_intervento = 0 THEN
            DBMS_OUTPUT.PUT_LINE('Errore: l''intervento con ID ' || p_Intervento_ID || ' non esiste nel database.');
        ELSE
            -- Verifica se il membro è già coinvolto nell'intervento
            SELECT COUNT(*)
            INTO v_count_coinvolgimento
            FROM COINVOLGIMENTI
            WHERE Membro = p_Membro_ID AND Intervento = p_Intervento_ID;
            
            IF v_count_coinvolgimento > 0 THEN
                DBMS_OUTPUT.PUT_LINE('Errore: il membro con ID ' || p_Membro_ID || ' è già coinvolto nell''intervento con ID ' || p_Intervento_ID);
            ELSE
                -- Inserisce il membro nell'intervento se non è già coinvolto
                INSERT INTO COINVOLGIMENTI (Membro, Intervento)
                VALUES (p_Membro_ID, p_Intervento_ID);
                
                DBMS_OUTPUT.PUT_LINE('Membro con ID ' || p_Membro_ID || ' aggiunto all''intervento con ID ' || p_Intervento_ID);
            END IF;
        END IF;
    END IF;
END;

-- ESEMPIO 1
-- EXECUTE InserireMembroInCoinvolgimento(15, 10);
-- OUTPUT --> Membro con ID 15 aggiunto all'intervento con ID 10

-- ESEMPIO 2
-- EXECUTE InserireMembroInCoinvolgimento(1, 1);
-- OUTPUT --> Errore: il membro con ID 1 è già coinvolto nell'intervento con ID 1

------------------------------------------------------------------------------------------------

-- N3 Procedura per aggiornare lo stato operativo di un sensore
CREATE OR REPLACE PROCEDURE AggiornareStatoSensore(
    p_Sensore_ID IN NUMBER,
    p_Nuovo_Stato IN VARCHAR2
) AS
    v_count_sensore NUMBER;
    v_stato_valido BOOLEAN := FALSE;
BEGIN
    -- Verifica se il sensore esiste nel database
    SELECT COUNT(*)
    INTO v_count_sensore
    FROM SENSORI
    WHERE ID = p_Sensore_ID;

    IF v_count_sensore = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Errore: il sensore con ID ' || p_Sensore_ID || ' non esiste nel database.');
    ELSE
        -- Controllo se il nuovo stato è valido
        IF p_Nuovo_Stato IN ('Attivo', 'Standby', 'Manutenzione', 'Malfunzionante') THEN
            v_stato_valido := TRUE;
        END IF;

        IF v_stato_valido = FALSE THEN
            DBMS_OUTPUT.PUT_LINE('Errore: lo stato ' || p_Nuovo_Stato || ' non è valido.');
        ELSE
            -- Se il sensore esiste e lo stato è valido, aggiorna lo stato
            UPDATE SENSORI
            SET Stato_Operativo = p_Nuovo_Stato
            WHERE ID = p_Sensore_ID;
            
            DBMS_OUTPUT.PUT_LINE('Stato del sensore ' || p_Sensore_ID || ' aggiornato a ' || p_Nuovo_Stato);
        END IF;
    END IF;
END;

-- ESEMPIO 1
-- EXECUTE AggiornareStatoSensore(5, 'Manutenzione');
-- OUTPUT --> Stato del sensore 5 aggiornato a Manutenzione.

-- ESEMPIO 2 
-- EXECUTE AggiornareStatoSensore(1, 'Sospeso');
-- OUTPUT --> Errore: lo stato Sospeso non è valido.

------------------------------------------------------------------------------------------------


-- N4 Procedura che esegue una operazione di manutenzione se la data dell'ultimo controllo è maggiore di 30 giorni
CREATE OR REPLACE PROCEDURE ControllaManutenzioneSensori AS
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

    -- Verifica la presenza di manutentori, se non ci sono esce
    IF v_tot_membri = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Nessun manutentore disponibile.');
        RETURN;
    END IF;

    -- Verifica per tutti i sensori se la data dell'ultimo controllo è più di 30 giorni fa
    FOR sensore_rec IN (SELECT ID, Data_Ultimo_Controllo FROM SENSORI) LOOP
        -- Controlla se la data dell'ultimo controllo è più di 30 giorni fa oppure se è NULL
        IF sensore_rec.Data_Ultimo_Controllo IS NULL OR sensore_rec.Data_Ultimo_Controllo < (SYSDATE - 30) THEN
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

-- ESEMPIO 
-- EXECUTE ControllaManutenzioneSensori;


