SELECT DISTINCT fg.Name 
FROM Ort o1,Ort o2,Ferienwohnung f , verbinden v, Adresse a1, Adresse a, Fluggesellschaft fg,Flughafen fl
WHERE f.Adress_ID = a.Adress_ID
AND		a.Orts_ID = o1.Orts_ID
AND 	f.Ferienwohnungsnummer  = &p
AND 	v.ZielFlughafen = o1.IATA_CODE
AND 	v.Name = fg.Name
AND v.StartFlughafen = fl.IATA_CODE
AND fl.Adress_ID = a1.Adress_ID
AND a1.Orts_ID = o2.Orts_ID
AND o2.ISO_CODE <> o1.ISO_CODE
AND fg.Servicequalitaet in (SELECT MAX(fg.Servicequalitaet)
FROM Ort o1,Ort o2, verbinden v, Adresse a1, Adresse a, Fluggesellschaft fg,Flughafen fl
WHERE   f.Adress_ID = a.Adress_ID
AND		a.Orts_ID = o1.Orts_ID
AND 	v.ZielFlughafen = o1.IATA_CODE
AND 	v.Name = fg.Name
AND v.StartFlughafen = fl.IATA_CODE
AND fl.Adress_ID = a1.Adress_ID
AND a1.Orts_ID = o2.Orts_ID
AND o2.ISO_CODE <> o1.ISO_CODE);





