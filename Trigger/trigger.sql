
-- Trigger per aggiornare lo stato di un sensore in "Malfunzionante" in caso di anomalia
CREATE OR REPLACE TRIGGER aggiorna_stato_sensore
AFTER INSERT ON ANOMALIE
FOR EACH ROW
BEGIN
    UPDATE SENSORI
    SET Stato_Operativo = 'Malfunzionante'
    WHERE ID = :NEW.Sensore;
END;
--TESTATO
INSERT INTO SENSORI (ID, Data_Installazione, Tipo, Stato_Operativo, Latitudine, Longitudine, Altitudine) VALUES (20, TO_DATE('2023-01-01', 'YYYY-MM-DD'), 'Temperatura', 'Attivo', 45.0, 9.0, 100.0);
INSERT INTO ANOMALIE (ID, Data, Ora, Livello, Causa, Sensore) VALUES (20, TO_DATE('2024-12-22', 'YYYY-MM-DD'), SYSTIMESTAMP, 'Critica', 'Sovraccarico termico', 20);

--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
-- TRIGGER PER VERIFICARE CHE IL VALORE RILEVATO SIA MAGGIORE DI 0 A PATTO CHE NON SIA UN SENSORE DI TIPO TEMPERATURA
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
        RAISE_APPLICATION_ERROR(-20001, 'Il valore rilevato aggiunto è minore o uguale a 0. Deve essere maggiore di 0 per sensori diversi da Temperatura.');
    END IF;
END;
--FUNZIONA

--INSERIMENTO DI UN VALORE NEGATIVO PER UN SENSORE DI TEMPERATURA--> NON GENERA ERRORE
INSERT INTO RILEVAZIONI (ID, DATA, ORA, VALORE, SENSORE) VALUES (7, SYSDATE, SYSTIMESTAMP, -5,1); 

--INSERIMENTO DI UN VALORE NEGATIVO PER UN SENSORE DI DIVERSO DA TEMPERATURA--> GENERA ERRORE
INSERT INTO RILEVAZIONI (ID, DATA, ORA, VALORE, SENSORE) VALUES (9, SYSDATE, SYSTIMESTAMP, -40,2); 

--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
-- TRIGGER PER IMPOSTARRE LA DATA_FINE AUTOMATICAMENTE QUANDO SI IMPOSTA CHE LO STATO DI UNA MISSIONE SIA COMPLETATA
CREATE OR REPLACE TRIGGER aggiorna_data_fine_missione
BEFORE UPDATE ON MISSIONI
FOR EACH ROW
BEGIN
    IF :NEW.Stato = 'Completata' AND :OLD.Stato <> 'Completata' THEN
        :NEW.Data_Fine := SYSDATE;
    END IF;
END;
--FUNZIONA
--ESEMPIO DI UTILIZZO
SELECT *FROM MISSIONI;

UPDATE MISSIONI SET STATO = 'Completata'
    WHERE ID = '6';

--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
-- TRIGGER CHE GENERA UN INTERVENTO DI UN MANUTENZIONE SE LA DATA DELL'ULTIMO CONTROLLO SU UN SENSORE E' MAGGIORE DI 30 GIORNI 
CREATE OR REPLACE TRIGGER trg_manutenzione_sensore
AFTER UPDATE OF Data_Ultimo_Controllo ON SENSORI
FOR EACH ROW
DECLARE
    v_membro_id NUMBER;
BEGIN
    -- Verifica se la data dell'ultimo controllo è più di 30 giorni fa
    IF :NEW.Data_Ultimo_Controllo < (SYSDATE - 30) THEN
        -- Se la data è maggiore di 30 giorni, trovo il primo membro disponibile (es. con ruolo di manutenzione)
        SELECT M.ID INTO v_membro_id
        FROM MEMBRI M
        WHERE M.Ruolo = 'Manutentore'
        AND ROWNUM = 1;  -- Limita a un solo membro

        -- Inserisce una nuova operazione di manutenzione
        INSERT INTO OPERAZIONI (Membri, Sensori, Stato_Operativo, Operazione)
        VALUES (v_membro_id, :NEW.ID, 'Standby', 'Manutenzione');
    END IF;
END;
--NON FUNZIONA BENE IN QUESTO MODO
--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
