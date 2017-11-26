SELECT f.Ferienwohnungsnummer
FROM  Ferienwohnung f, Land l, Ort o, Adresse a, beinhalten be,ZUSATZAUSSTATTUNG z,Belegung b
WHERE 
f.adress_ID = a.adress_ID 
and b.Ferienwohnungsnummer = f.Ferienwohnungsnummer
and be.Ferienwohnungsnummer=f.ferienwohnungsnummer 
and be.Name = z.Name
and z.name='Schwimmbad' 
and a.orts_ID = o.orts_ID 
and o.iso_Code =l.iso_Code
and l.name = 'Tuerkei'
and (b.von < '21/05/2016' AND b.bis > '01/05/2016' ) ;



--(b.von <= '01/05/2016' AND b.bis >= '21/05/2016') or
--(b.von <= '01/05/2016' and b.bis <= '21/05/2016' and b.bis > '01/05/2016') or
--(b.von >= '01/05/2016' AND b.von < '21/05/2016' and b.bis > '21/05/2016') or
--(b.von >= '01/05/2016' AND b.bis <= '21/05/2016');