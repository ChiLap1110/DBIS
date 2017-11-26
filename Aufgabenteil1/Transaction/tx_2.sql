update Adresse 
set  PLZ = 69115,
Strasse = 'Schloﬂstraﬂe',
Hausnummer = 1,
Orts_ID = (select Orts_ID from Ort where name = 'Heidelberg')
WHERE Adress_ID = (select Adress_ID from Kunde where Kundennummer = 1);

update Kunde
set Telefonnummer = '06221-546372'
where Kundennummer =1;

commit;