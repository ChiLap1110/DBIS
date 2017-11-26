
SELECT f.Ferienwohnungsnummer 
FROM  Ferienwohnung f, Land l, Ort o, Adresse a, beinhalten be,ZUSATZAUSSTATTUNG z
WHERE 
f.adress_ID = a.adress_ID 
and be.Ferienwohnungsnummer=f.ferienwohnungsnummer 
and be.Name = z.Name
and z.name='Schwimmbad' 
and a.orts_ID = o.orts_ID 
and o.iso_Code =l.iso_Code
and l.name = 'Frankreich'
AND NOT EXISTS 
    (SELECT *
    FROM Belegung b
    WHERE b.Ferienwohnungsnummer = f.Ferienwohnungsnummer);