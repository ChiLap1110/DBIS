select f.ferienwohnungsnummer
from ferienwohnung f , Adresse a1, Ort o, Land L , touristenattraktion t, Adresse a2, entfernung e
where f.ADRESS_ID = a1.adress_id 
and o.orts_id = a1.orts_id 
and o.iso_code = l.iso_code 
and l.name = 'Frankreich' 
and t.adress_id = a2.adress_id 
and t.name ='Disneyland'
and ((e.ort1=o.orts_id and e.ort2=a2.orts_id)
or (e.ort1=a2.orts_id and e.ort2=o.orts_id)) 
and e.kilometer <=100
UNION
select f.ferienwohnungsnummer
from ferienwohnung f , Adresse a1, touristenattraktion t, Adresse a2
where f.ADRESS_ID = a1.adress_id 
and t.adress_id = a2.adress_id 
and t.name ='Disneyland'
and a1.Orts_ID = a2.Orts_ID;