-- N1 Trigger per aggiornare lo stato di un sensore in "Malfunzionante" in caso di anomalia
CREATE OR REPLACE TRIGGER aggiorna_stato_sensore
AFTER INSERT ON ANOMALIE
FOR EACH ROW
BEGIN
    UPDATE SENSORI
    SET Stato_Operativo = 'Malfunzionante'
    WHERE ID = :NEW.Sensore;
END;

-- INSERT INTO SENSORI (ID, Data_Installazione, Tipo, Stato_Operativo, Latitudine, Longitudine, Altitudine) VALUES (20, TO_DATE('2023-01-01', 'YYYY-MM-DD'), 'Temperatura', 'Attivo', 45.0, 9.0, 100.0);

-- INSERT INTO ANOMALIE (ID, Data, Ora, Livello, Causa, Sensore) VALUES (20, TO_DATE('2024-12-22', 'YYYY-MM-DD'), SYSTIMESTAMP, 'Critica', 'Sovraccarico termico', 20);

------------------------------------------------------------------------------------------------------------------
-- N2 Trigger per verificare che il valore rilevato sia maggiore di 0 a patto che non sia un sensore di tipo temperatura
CREATE OR REPLACE TRIGGER verifica_valore_rilevato
BEFORE INSERT ON RILEVAZIONI
FOR EACH ROW
DECLARE
    v_tipo_sensor VARCHAR2(50);
BEGIN
    -- Recupera il tipo del sensore associato alla rilevazione
    SELECT Tipo 
    INTO v_tipo_sensor
    FROM SENSORI
    WHERE ID = :NEW.Sensore;
    
    -- Se il valore è <= 0 e il sensore non è di tipo 'Temperatura', solleva un errore
    IF :NEW.Valore <= 0 AND v_tipo_sensor != 'Temperatura' THEN
        RAISE_APPLICATION_ERROR(-20001, 'Il valore rilevato aggiunto è minore o uguale a 0. Deve essere maggiore di 0 per sensori non di Temperatura.');
    END IF;
END;

-- Inserimento di un valore negativo per un sensore di temperatura--> NON genera errore
-- INSERT INTO RILEVAZIONI (ID, DATA, ORA, VALORE, SENSORE) VALUES (7, SYSDATE, SYSTIMESTAMP, -5,1); 

-- Inserimento di un valore negativo per un sensore di diverso da temperatura--> GENERA errore
-- INSERT INTO RILEVAZIONI (ID, DATA, ORA, VALORE, SENSORE) VALUES (9, SYSDATE, SYSTIMESTAMP, -40,2); 

------------------------------------------------------------------------------------------------------------------
-- N3 Trigger per impostare la data_fine automaticamente quando si imposta che lo stato di una missione sia completata
CREATE OR REPLACE TRIGGER aggiorna_data_fine_missione
BEFORE UPDATE ON MISSIONI
FOR EACH ROW
BEGIN
    IF :NEW.Stato = 'Completata' AND :OLD.Stato <> 'Completata' THEN
        :NEW.Data_Fine := SYSDATE;
    END IF;
END;


-- ESEMPIO
-- UPDATE MISSIONI SET STATO = 'Completata' WHERE ID = '6';
-- SELECT * FROM MISSIONI WHERE ID = '6';

------------------------------------------------------------------------------------------------------------------
-- N4 Trigger che impedisce l'inserimento di una rilevazione se il sensore si trova in uno stato malfunzionante
CREATE OR REPLACE TRIGGER trg_block_malfunzionante_rilevazioni
BEFORE INSERT ON RILEVAZIONI
FOR EACH ROW
DECLARE
    v_stato_operativo SENSORI.Stato_Operativo%TYPE;
BEGIN
    -- Recupera lo stato operativo del sensore
    SELECT Stato_Operativo
    INTO v_stato_operativo
    FROM SENSORI
    WHERE ID = :NEW.Sensore;

    -- Verifica se lo stato è "Malfunzionante"
    IF v_stato_operativo = 'Malfunzionante' THEN
        RAISE_APPLICATION_ERROR(-20001, 'Impossibile registrare una rilevazione: il sensore è in stato operativo Malfunzionante.');
    END IF;
END;

-- ESEMPIO --> GENERA errore
-- INSERT INTO RILEVAZIONI (ID, Data, Ora, Valore, Sensore) VALUES (5, SYSDATE, SYSTIMESTAMP, 23.5, 4);