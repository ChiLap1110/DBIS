select count(b.statusflag) AS AnzahlBelegung
from Belegung b, Kunde k
where k.kundennummer=&p
AND b.statusflag='gebucht'
AND b.Kundennummer= k.Kundennummer;