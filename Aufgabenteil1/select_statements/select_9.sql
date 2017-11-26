SELECT f.Ferienwohnungsnummer
FROM  Ferienwohnung f, Land l, Ort o, Adresse a, beinhalten be,ZUSATZAUSSTATTUNG z
WHERE 
f.adress_ID = a.adress_ID 
and be.Ferienwohnungsnummer=f.ferienwohnungsnummer 
and be.Name = z.Name
and z.name='Schwimmbad' 
and a.orts_ID = o.orts_ID 
and o.iso_Code =l.iso_Code
and l.name = 'Tuerkei'
AND f.Ferienwohnungsnummer NOT IN 
	(SELECT f.Ferienwohnungsnummer
    FROM Belegung b
    WHERE b.Ferienwohnungsnummer = f.Ferienwohnungsnummer
	AND b.von < '21/05/2016' AND b.bis >'01/05/2016');