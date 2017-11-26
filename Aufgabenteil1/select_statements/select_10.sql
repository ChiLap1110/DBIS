SELECT l.Name, count(statusflag) as Anzahl
FROM land l
	left outer join Ort o on (o.iso_Code =l.iso_Code)
	left outer join Adresse a on (a.orts_ID = o.orts_ID)
	left outer join Ferienwohnung f on (f.adress_ID = a.adress_ID)
	left outer join Belegung b on (b.Ferienwohnungsnummer=f.Ferienwohnungsnummer) 
GROUP BY l.Name;


