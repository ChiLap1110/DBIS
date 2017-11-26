SELECT f.Ferienwohnungsnummer
FROM Belegung b, Land l , Ferienwohnung f, Adresse a , Ort o
WHERE  f.Adress_ID= a.Adress_ID
AND 	b.Ferienwohnungsnummer= f.Ferienwohnungsnummer
AND 	a.Orts_ID = o.Orts_ID 
AND 	o.ISO_CODE = l.ISO_CODE
AND 	l.name ='Frankreich'
GROUP BY f.Ferienwohnungsnummer
	HAVING count(f.Ferienwohnungsnummer) > (SELECT count (*) 
FROM Land l , Ferienwohnung f, Adresse a , Ort o
WHERE f.Adress_ID= a.Adress_ID
AND 	a.Orts_ID = o.Orts_ID 
AND 	o.ISO_CODE = l.ISO_CODE
AND 	l.name = 'Deutschland');









