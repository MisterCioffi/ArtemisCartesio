-- Il ruolo "MembroEquipaggio" è pensato per gli utenti che necessitano di accedere ai dati relativi a missioni, membri, sensori, robot, anomalie, rilevazioni, report, utilizzo di robot e sensori, coinvolgimenti, operazioni e partecipazioni.
-- Questo ruolo è utile per garantire che i membri dell'equipaggio possano consultare le informazioni necessarie senza avere permessi di modifica.
CREATE ROLE MembroEquipaggio;

-- Assegnazione dei permessi al ruolo MembroEquipaggio
GRANT SELECT ON MISSIONI TO MembroEquipaggio;
GRANT SELECT ON MEMBRI TO MembroEquipaggio;
GRANT SELECT ON SENSORI TO MembroEquipaggio;
GRANT SELECT ON ROBOT TO MembroEquipaggio;
GRANT SELECT ON ANOMALIE TO MembroEquipaggio;
GRANT SELECT ON RILEVAZIONI TO MembroEquipaggio;
GRANT SELECT ON REPORT TO MembroEquipaggio;
GRANT SELECT ON UTILIZZO_ROBOT TO MembroEquipaggio;
GRANT SELECT ON UTILIZZO_SENSORI TO MembroEquipaggio;
GRANT SELECT ON COINVOLGIMENTI TO MembroEquipaggio;
GRANT SELECT ON OPERAZIONI TO MembroEquipaggio;
GRANT SELECT ON PARTECIPAZIONI TO MembroEquipaggio;

-- Il ruolo "UfficialeDiBordo" ha i permessi di SELECT, INSERT, UPDATE e DELETE su tutte le tabelle elencate.
-- Le tabelle su cui il ruolo ha permessi includono: MISSIONI, MEMBRI, SENSORI, ROBOT, ANOMALIE, RILEVAZIONI, REPORT, UTILIZZO_ROBOT, UTILIZZO_SENSORI, COINVOLGIMENTI, OPERAZIONI e PARTECIPAZIONI.
-- Questo ruolo è pensato per un utente che necessita di accesso completo per gestire e operare su tutte le informazioni relative alle missioni e ai loro componenti.
CREATE ROLE UfficialeDiBordo;

-- Assegnazione dei permessi al ruolo UfficialeDiBordo
GRANT SELECT, INSERT, UPDATE, DELETE ON MISSIONI TO UfficialeDiBordo;
GRANT SELECT, INSERT, UPDATE, DELETE ON MEMBRI TO UfficialeDiBordo;
GRANT SELECT, INSERT, UPDATE, DELETE ON SENSORI TO UfficialeDiBordo;
GRANT SELECT, INSERT, UPDATE, DELETE ON ROBOT TO UfficialeDiBordo;
GRANT SELECT, INSERT, UPDATE, DELETE ON ANOMALIE TO UfficialeDiBordo;
GRANT SELECT, INSERT, UPDATE, DELETE ON RILEVAZIONI TO UfficialeDiBordo;
GRANT SELECT, INSERT, UPDATE, DELETE ON REPORT TO UfficialeDiBordo;
GRANT SELECT, INSERT, UPDATE, DELETE ON UTILIZZO_ROBOT TO UfficialeDiBordo;
GRANT SELECT, INSERT, UPDATE, DELETE ON UTILIZZO_SENSORI TO UfficialeDiBordo;
GRANT SELECT, INSERT, UPDATE, DELETE ON COINVOLGIMENTI TO UfficialeDiBordo;
GRANT SELECT, INSERT, UPDATE, DELETE ON OPERAZIONI TO UfficialeDiBordo;
GRANT SELECT, INSERT, UPDATE, DELETE ON PARTECIPAZIONI TO UfficialeDiBordo;
