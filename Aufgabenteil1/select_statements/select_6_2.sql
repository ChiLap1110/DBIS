select distinct f.ferienwohnungsnummer, b.statusflag
from Ferienwohnung f, land l, Belegung b, Ort o, Adresse a, beinhalten be
where f.adress_ID = a.adress_ID 
and be.Ferienwohnungsnummer=f.ferienwohnungsnummer 
and be.name='Schwimmbad' 
and a.orts_ID = o.orts_ID 
and o.iso_Code =l.iso_Code
and l.name = 'Frankreich' 
and b.statusflag = 'gebucht' 
and b.ferienwohnungsnummer = f.ferienwohnungsnummer;