# Creazione DB

## Introduzione

...

## Progettazione Concettuale

...

### Modello E/R portante

...
![alt text](/Media/schema_portante.png)

### Modello E/R completo

...
![alt text](/Media/ER_Completo.png)

## Progettazione Logica


# Ottimizzazione DB

## Indici

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

## Concorrenza

Per la gestione della concorrenza abbiamo scelto di adottare il protocollo **2PL stretto**, una variante del **2PL.** Entrambi i protocolli si basano sul meccanismo del **lock**, che consente di gestire la concorrenza e garantire la **serializzabilità delle transazioni**.

Il suo funzionamento prevede:

- lock(): ogni oggetto è protetto da un lock;
- **read_lock()** : se una transazione vuole effettuare una lettura su uno oggetto. Più transazioni possono leggere contemporaneamente lo stesso oggetto (condivisione).
- write_lock() : è esclusivo e consente a una sola transazione di modificare l'oggetto per volta.
- unlock(): Ogni lock, una volta terminata l'operazione, deve essere rilasciato (unlock).
- gli oggetti possono trovarsi in tre stati: **libero** , **bloccato in lettura**, o **bloccato in scrittura**.

La scelta del **2PL stretto** rispetto al **2PL** è dovuta al fatto che il **2PL stretto** evita l'anomalia delle **letture sporche** (dirty reads), che possono verificarsi in altri approcci di gestione della concorrenza.

Il 2PL stretto prevede due fasi:

- fase crescente: è la fase in cui una transazione acquisisce mediante read_lock e write_lock tutte le risorse su cui dovrà effettuare operazioni di lettura e scrittura.
- fase decrescente: è la fase in cui attraverso l’unlock si vanno a rilasciare le risorse. In particolare questa fase nel caso di 2PL stretto può essere effettuata solo se la transazione termina con una commit o con un abort.

Questo approccio garantisce che le transazioni siano serializzabili, impedendo conflitti e mantenendo la consistenza dei dati.

## Affidabilità

Il controllo di **affidabilità** in un sistema di basi di dati ha come obiettivo principale il **ripristino** dello stato corretto del sistema (recovery) in seguito a guasti accidentali o intenzionali, che possano compromettere la funzionalità del sistema stesso. I guasti possono essere legati sia a malfunzionamenti hardware (ad esempio, guasti su disco o memoria) che software (ad esempio, crash di applicazioni o errori di sistema).

Il sistema di affidabilità si basa sulla gestione delle **transazioni**, che sono le unità fondamentali delle operazioni nel database, garantendo **atomicità** (le transazioni sono eseguite in modo completo o non eseguite affatto) e **persistenza** (i dati delle transazioni devono essere memorizzati in modo permanente una volta che la transazione è stata completata correttamente).

### Backup

Per garantire un alto livello di affidabilità, il nostro sistema di database implementa la strategia di backup RAID 1, che offre una soluzione di mirroring. In un sistema RAID 1, ogni dato scritto sul disco primario viene duplicato in tempo reale su un disco secondario, chiamato "mirror". Questa tecnica garantisce che, in caso di guasto di uno dei dischi, i dati siano ancora disponibili sull'altro disco, riducendo il rischio di perdita di informazioni e migliorando la disponibilità del sistema.

![alt text](https://lh7-rt.googleusercontent.com/docsz/AD_4nXfQsnRyRqi-MqLuu07-KykmAtIMToMJTv4sR9Rt6yvvyYQpT_xHkRYXp51ukt57LvrvpfDb55AJUi_iNBOYnvjjPZxDDDXNKtgN-cXCkwVDDBT43D8tAmsKCTTcfmXKuKL10BeIlw?key=zpWpA_SGFML2QaTpf4B4-Q)

### Recovery

Il gestore dell’affidabilità deve gestire l’esecuzione dei comandi transazionali di begin transaction, commit, roolback  e tutte le operazioni di ripristino dopo i guasti .

Per poter effettuare ciò , il gestore deve possedere un file di log: un file presente su memoria stabile che registra le tutte operazioni svolte dalle transazioni nel loro ordine di esecuzione.

Il log è quindi una sorta di “diario di bordo” che, in un qualsiasi istante, permette di ricostituire il contenuto corretto della base dei dati a seguito di malfunzionamenti.

![alt text](https://lh7-rt.googleusercontent.com/docsz/AD_4nXd5kwKmOV1RL7w-IP0nQWUTu4O3g1eMdf_y0RhazT8XB30HHWeefG7bIqj2loHXDZk--KX04cuFiQ95071jOXM0M-1MlqbZa5Ik5f8AS_j2Vb0oO34krX3BPPKcCrjtPKR3cVP1hA?key=tVx3FV0q7ixKVuwmv7Z3j0GJ)

#### Tecniche di recovery

- RIPRESA A FREDDO:  Nel caso di guasti hard sui dispositivi di memoria di massa (es. guasti ai dischi rigidi) si perde sia la memoria centrale che quella secondaria, ma la memoria stabile (come i dispositivi di backup) rimane intatta. In queste situazioni, viene effettuata la ripresa a freddo (cold restart), che richiede un ripristino più approfondito, attingendo ai backup e ai log per recuperare i dati persi.
- RIPRESA A CALDO: Nel caso di guasti soft (es. errori di programma, crash di sistema, caduta di tensione, ecc.) si perde il contenuto della sola memoria centrale (mentre rimangono intatte la memoria secondaria e quella stabile). In tali situazioni, viene effettuata la cosiddetta ripresa a caldo (warm restart).

In entrambi i casi, la procedura di ripristino avviene nelle seguenti fasi (modello fail-stop):

- si forza l’arresto completo delle transazioni attive sul sistema di basi di dati;
- viene ripristinato il corretto corretto funzionamento del sistema operativo;
- viene effettuata la procedura di ripristino.
