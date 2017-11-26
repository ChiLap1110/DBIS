select k.name 
from Kunde k,Belegung b, Ferienwohnung f
where statusflag in 'reserviert'
AND b.Kundennummer = k.Kundennummer
AND b.Belegungsnummer = f.Ferienwohnungsnummer
AND f.ferienwohnungsnummer=&p
group by k.name;