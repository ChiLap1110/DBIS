
SELECT f.Ferienwohnungsnummer 
FROM  Ferienwohnung f, Land l, Ort o, Adresse a, beinhalten be
WHERE 
f.adress_ID = a.adress_ID 
and be.Ferienwohnungsnummer=f.ferienwohnungsnummer 
and be.Name ='Schwimmbad' 
and a.orts_ID = o.orts_ID 
and o.iso_Code =l.iso_Code
and l.name = 'Frankreich'
AND NOT EXISTS 
    (SELECT *
    FROM Belegung b
    WHERE b.Ferienwohnungsnummer = f.Ferienwohnungsnummer
    and b.statusflag = 'reserviert');
	
SELECT f.Ferienwohnungsnummer 
FROM  Ferienwohnung f, Land l, Ort o, Adresse a, beinhalten be
WHERE 
f.adress_ID = a.adress_ID 
and be.Ferienwohnungsnummer=f.ferienwohnungsnummer 
and be.Name ='Schwimmbad' 
and a.orts_ID = o.orts_ID 
and o.iso_Code =l.iso_Code
and l.name = 'Frankreich'
AND f.Ferienwohnungsnummer NOT IN 
    (SELECT b.Ferienwohnungsnummer
    FROM Belegung b
    WHERE b.statusflag = 'reserviert');