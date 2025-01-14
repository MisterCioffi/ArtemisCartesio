-- Per filtrare missioni sullo stato
CREATE INDEX idx_missioni_stato ON MISSIONI(Stato); 

-- Per filtrare sul ruolo dei membri
CREATE INDEX idx_membri_ruolo ON MEMBRI(Ruolo); 

-- Per filtrare sul tipo di robot
CREATE INDEX idx_robot_tipo ON ROBOT(Tipo); 

-- Per filtrare sulla data del report
CREATE INDEX idx_report_data ON REPORT(Data);

-- Per filtrare sulla coppia sensore-data di una rilevazione
CREATE INDEX idx_rilevazioni_sensori_data ON RILEVAZIONI(Sensore, Data);
