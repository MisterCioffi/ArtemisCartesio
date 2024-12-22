
-- Trigger per aggiornare lo stato di un sensore in "Malfunzionante" in caso di anomalia
CREATE OR REPLACE TRIGGER aggiorna_stato_sensore
AFTER INSERT ON ANOMALIE
FOR EACH ROW
BEGIN
    UPDATE SENSORI
    SET Stato_Operativo = 'Malfunzionante'
    WHERE ID = :NEW.Sensori;
END;

-- TRIGGER PER VERIFICARE CHE IL VALORE RILEVATO SIA MAGGIORE DI 0 A PATTO CHE NON SIA UN SESNSORE DI TIPO TEMPERATURA
CREATE OR REPLACE TRIGGER verifica_valore_rilevato
BEFORE INSERT ON RILEVAZIONI
FOR EACH ROW
BEGIN
    IF :NEW.Valore <= 0 AND EXISTS (
        SELECT 1 FROM SENSORI
        WHERE ID = :NEW.Sensori AND Tipo != 'Temperatura'
    ) THEN
        RAISE_APPLICATION_ERROR(-20001, 'Il valore rilevato aggiunto è minore o uguale a 0. Deve essere maggiore di 0 per sensori diversi da Temperatura.');
    END IF;
END;


-- TRIGGER PER IMPOSTARRE LA DATA_FINE AUTOMATICAMENTE QUANDO SI IMPOSTA CHE LO STATO DI UNA MISSIONE SIA COMPLETATA
CREATE OR REPLACE TRIGGER aggiorna_data_fine_missione
BEFORE UPDATE ON MISSIONI
FOR EACH ROW
BEGIN
    IF :NEW.Stato = 'Completata' AND :OLD.Stato <> 'Completata' THEN
        :NEW.Data_Fine := SYSDATE;
    END IF;
END;

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
