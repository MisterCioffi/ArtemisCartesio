Un **indice** in un sistema di gestione di database (DBMS) è una struttura dati organizzata che consente di individuare rapidamente un determinato record all'interno di un file di dati. Uno dei principali vantaggi dell'utilizzo degli indici è il miglioramento delle prestazioni delle query: gli indici permettono di ridurre il tempo necessario per cercare i dati, evitando una scansione completa della tabella.

Creare indici sui campi che vengono frequentemente utilizzati nei filtri delle query (ad esempio, con condizioni `WHERE`, `JOIN`, `ORDER BY` o `GROUP BY`) può velocizzare significativamente l'elaborazione delle richieste, ottimizzando il sistema nel suo complesso. 

(NON DETTO DAL PROFESSORE)Tuttavia, è importante bilanciare l'uso degli indici per evitare costi aggiuntivi durante le operazioni di scrittura come `INSERT`, `UPDATE` e `DELETE`, poiché gli indici devono essere aggiornati ogni volta che i dati della tabella vengono modificati.

Tralasciando gli indici sulla chiave primaria, in quanto il DBMS crea un indice per ogni chiave primaria della tabella, abbiamo pensato di aggiungere questi indici:

```sql
CREATE INDEX idx_missioni_stato ON MISSIONI(Stato);//utile per filtarre missioni sullo stato
CREATE INDEX idx_membri_ruolo ON MEMBRI(Ruolo); // utile per filtrare sul ruolo dei membri
CREATE INDEX idx_robot_tipo ON ROBOT(Tipo); // utile per filtarre sul tipo di robot
CREATE INDEX idx_report_data ON REPORT(Data);
CREATE INDEX idx_rilevazioni_sensori_data ON RILEVAZIONI(Sensori, Data);
```
