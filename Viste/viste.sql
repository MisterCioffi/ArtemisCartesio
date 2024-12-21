create view membri_missioni as
select m.nome, m.cognome, mi.obiettivo as Obiettivo_Missione, mi.stato as Stato_Missione
from (partecipazioni p join membri m on p.membri = m.id) join missioni mi on p.missioni = mi.id
