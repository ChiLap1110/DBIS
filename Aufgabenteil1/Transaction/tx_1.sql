INSERT INTO ADRESSE (Adress_ID,Strasse,Hausnummer,PLZ,Orts_ID) values ((select max (Adress_ID) +1 from Adresse),'Highway',6,'2349',(select Orts_ID from Ort where Name = 'Oeludeniz'));

INSERT INTO FERIENWOHNUNG(Ferienwohnungsnummer,Groesse,Preis,Anzahl_Zimmer,textBeschreibung,Adress_ID) values (999,100,100.00,4,'SeaView',(select max (Adress_ID) from Adresse));

INSERT INTO ZUSATZAUSSTATTUNG (Name) values ('Whirlpool');
INSERT INTO ZUSATZAUSSTATTUNG (Name) values ('Garten');
INSERT INTO BEINHALTEN (Name,Ferienwohnungsnummer) values ('Whirlpool', 999);
INSERT INTO BEINHALTEN (Name,Ferienwohnungsnummer) values ('Garten', 999);

COMMIT;