column name format A20;
column vorname format A20;

select count(statusflag) as AnzahlBelegung, Name, Vorname
from Belegung b , Kunde k
where k.Kundennummer = b.Kundennummer
and Name ='&p' 
and statusflag in 'gebucht'
group by k.Name, k.Vorname;