ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YYYY';
ALTER TABLE ADRESSE DISABLE CONSTRAINT Adresse_Ort;
COMMIT;
INSERT INTO BANKVERBINDUNG (IBAN, BLZ, KontoNr, Bank, BIC) values ('DE78690500010024346792',69271723,'7823212','Sparkasse','SOLADES1KNZ');
INSERT INTO BANKVERBINDUNG (IBAN, BLZ, KontoNr, Bank, BIC) values ('DE78690500010024346793',32793968,'8929368','Volksbank','SOLADES2KNZ');
INSERT INTO BANKVERBINDUNG (IBAN, BLZ, KontoNr, Bank, BIC) values ('DE78690500010024346794',69271723,'1347291','Sparda-Bank','SOLADES3KNZ');
INSERT INTO BANKVERBINDUNG (IBAN, BLZ, KontoNr, Bank, BIC) values ('DE78690500010024346795',29788431,'8792978','Deutsche-Bank','SOLADES4KNZ');
INSERT INTO BANKVERBINDUNG (IBAN, BLZ, KontoNr, Bank, BIC) values ('DE78690500010024346796',87890271,'9082780','TargoBank','SOLADES5KNZ');
INSERT INTO BANKVERBINDUNG (IBAN, BLZ, KontoNr, Bank, BIC) values ('DE78690500010024346797',69271723,'7322890','ING-DIBA','SOLADES6KNZ');

INSERT INTO FLUGGESELLSCHAFT (Name, Servicequalitaet) values ('Lufthansa',1);
INSERT INTO FLUGGESELLSCHAFT (Name, Servicequalitaet) values ('German Wings',4);
INSERT INTO FLUGGESELLSCHAFT (Name, Servicequalitaet) values ('Thomas Cook',8);
INSERT INTO FLUGGESELLSCHAFT (Name, Servicequalitaet) values ('Hapag Lloyd',9);
INSERT INTO FLUGGESELLSCHAFT (Name, Servicequalitaet) values ('Swiss',8);

INSERT INTO LAND (ISO_CODE,Name) values ('DE','Deutschland');
INSERT INTO LAND (ISO_CODE,Name) values ('CH','Schweiz');
INSERT INTO LAND (ISO_CODE,Name) values ('TR','Tuerkei');
INSERT INTO LAND (ISO_CODE,Name) values ('FR','Frankreich');
INSERT INTO LAND (ISO_CODE,Name) values ('ES','Spanien');
INSERT INTO LAND (ISO_CODE,Name) values ('GL','Groenland');

INSERT INTO ZUSATZAUSSTATTUNG (Name) values ('Schwimmbad');
INSERT INTO ZUSATZAUSSTATTUNG (Name) values ('Sauna');
INSERT INTO ZUSATZAUSSTATTUNG (Name) values ('Autoabstellplatz');
INSERT INTO ZUSATZAUSSTATTUNG (Name) values ('Aufzug');
INSERT INTO ZUSATZAUSSTATTUNG (Name) values ('Kinderbetreuung');
INSERT INTO ZUSATZAUSSTATTUNG (Name) values ('Sat-TV');
INSERT INTO ZUSATZAUSSTATTUNG (Name) values ('Reinigung');
INSERT INTO ZUSATZAUSSTATTUNG (Name) values ('Dachterrasse');
INSERT INTO ZUSATZAUSSTATTUNG (Name) values ('Garage');


INSERT INTO ADRESSE (Adress_ID,Strasse,Hausnummer,PLZ,Orts_ID) values (1,'Reutestr.', 104,'78467',20);
INSERT INTO ADRESSE (Adress_ID,Strasse,Hausnummer,PLZ,Orts_ID) values (2,'Hauptstr.',12,'69115',21);
INSERT INTO ADRESSE (Adress_ID,Strasse,Hausnummer,PLZ,Orts_ID) values (3,'Schlossstr.', 54,'70173',22);
INSERT INTO ADRESSE (Adress_ID,Strasse,Hausnummer,PLZ,Orts_ID) values (4,'Alpenstr. ',11,'3001',23);
INSERT INTO ADRESSE (Adress_ID,Strasse,Hausnummer,PLZ,Orts_ID) values (5,'Seeweg',23,'8001',24);
INSERT INTO ADRESSE (Adress_ID,Strasse,Hausnummer,PLZ,Orts_ID) values (6,'Rheingutstr.',14,'78462',20);
INSERT INTO ADRESSE (Adress_ID,Strasse,Hausnummer,PLZ,Orts_ID) values (7,'Highway', 5,'2349',25);
INSERT INTO ADRESSE (Adress_ID,Strasse,Hausnummer,PLZ,Orts_ID) values (8,'Markgrafenstr.', 33,'78461',20);
INSERT INTO ADRESSE (Adress_ID,Strasse,Hausnummer,PLZ,Orts_ID) values (9,'Zur Piste', 189,'2234',26);
INSERT INTO ADRESSE (Adress_ID,Strasse,Hausnummer,PLZ,Orts_ID) values (10,'rue Monsieur',980,'8234',27);
INSERT INTO ADRESSE (Adress_ID,Strasse,Hausnummer,PLZ,Orts_ID) values (11,'rue de gaulle', 22,'8787',28);
INSERT INTO ADRESSE (Adress_ID,Strasse,Hausnummer,PLZ,Orts_ID) values (12,'rue de la Maison Blanche', 32,'8792',29);
INSERT INTO ADRESSE (Adress_ID,Strasse,Hausnummer,PLZ,Orts_ID) values (13,'rue liberte', 78,'8792',29);
INSERT INTO ADRESSE (Adress_ID,Strasse,Hausnummer,PLZ,Orts_ID) values (14,'Strandweg', 90,'2321',30);
INSERT INTO ADRESSE (Adress_ID,Strasse,Hausnummer,PLZ,Orts_ID) values (15,'Strandweg', 91,'2321',30);
INSERT INTO ADRESSE (Adress_ID,Strasse,Hausnummer,PLZ,Orts_ID) values (16,'Calle del torro', 821,'5221',31);
INSERT INTO ADRESSE (Adress_ID,Strasse,Hausnummer,PLZ,Orts_ID) values (17,'Strandweg', 45,'2321',30);
INSERT INTO ADRESSE (Adress_ID,Strasse,Hausnummer,PLZ,Orts_ID) values (18,'Europapark', 1,'78231',32);
INSERT INTO ADRESSE (Adress_ID,Strasse,Hausnummer,PLZ,Orts_ID) values (19,'Seestr.', 12,'78463',20);
INSERT INTO ADRESSE (Adress_ID,Strasse,Hausnummer,PLZ,Orts_ID) values (20,'Bergweg', 78,'2371',33);
INSERT INTO ADRESSE (Adress_ID,Strasse,Hausnummer,PLZ,Orts_ID) values (21,'GreenOne', 29,'1352',24);
INSERT INTO ADRESSE (Adress_ID,Strasse,Hausnummer,PLZ,Orts_ID) values (22,'rue de gaulle', 10,'8787',28);
INSERT INTO ADRESSE (Adress_ID,Strasse,Hausnummer,PLZ,Orts_ID) values (23,'Am Flughafen', 2,'60541',34);
INSERT INTO ADRESSE (Adress_ID,Strasse,Hausnummer,PLZ,Orts_ID) values (24,'Sabiha Goekcen', 1,'1452',35);
INSERT INTO ADRESSE (Adress_ID,Strasse,Hausnummer,PLZ,Orts_ID) values (25,'Flughafen-Allee', 100,'5098',24);
INSERT INTO ADRESSE (Adress_ID,Strasse,Hausnummer,PLZ,Orts_ID) values (26,'Charles de Gaulle', 1,'8792',29);
INSERT INTO ADRESSE (Adress_ID,Strasse,Hausnummer,PLZ,Orts_ID) values (27,'Aeropuerto de Barcelona', 10,'08820',31);


INSERT INTO FERIENWOHNUNG(Ferienwohnungsnummer,Groesse,Preis,Anzahl_Zimmer,textBeschreibung,Adress_ID) values (1,200,349.00,6,'Finka',7);
INSERT INTO FERIENWOHNUNG(Ferienwohnungsnummer,Groesse,Preis,Anzahl_Zimmer,textBeschreibung,Adress_ID) values (2,45,120.00,2,'Ferienwohnung mit Seeblick',8);
INSERT INTO FERIENWOHNUNG(Ferienwohnungsnummer,Groesse,Preis,Anzahl_Zimmer,textBeschreibung,Adress_ID) values (3,150,249.00,3,'im Schnee',9);
INSERT INTO FERIENWOHNUNG(Ferienwohnungsnummer,Groesse,Preis,Anzahl_Zimmer,textBeschreibung,Adress_ID) values (4,100,249.00,4,'direkt am Meer',10);
INSERT INTO FERIENWOHNUNG(Ferienwohnungsnummer,Groesse,Preis,Anzahl_Zimmer,textBeschreibung,Adress_ID) values (5,110,289.00,3,'direkt am Park',11);
INSERT INTO FERIENWOHNUNG(Ferienwohnungsnummer,Groesse,Preis,Anzahl_Zimmer,textBeschreibung,Adress_ID) values (6,70,549.00,2,'mit Blick auf Eiffelturm',12);
INSERT INTO FERIENWOHNUNG(Ferienwohnungsnummer,Groesse,Preis,Anzahl_Zimmer,textBeschreibung,Adress_ID) values (7,110,159.00,6,'Dachterrassenwohnung zentral',13);
INSERT INTO FERIENWOHNUNG(Ferienwohnungsnummer,Groesse,Preis,Anzahl_Zimmer,textBeschreibung,Adress_ID) values (8,200,240.00,12,'zweigeschossiges Haus',14);
INSERT INTO FERIENWOHNUNG(Ferienwohnungsnummer,Groesse,Preis,Anzahl_Zimmer,textBeschreibung,Adress_ID) values (9,111,159.00,5,'Topvilla am Strand',15);
INSERT INTO FERIENWOHNUNG(Ferienwohnungsnummer,Groesse,Preis,Anzahl_Zimmer,textBeschreibung,Adress_ID) values (10,100,299.00,4,'Ferienhaus am Strand',16);
INSERT INTO FERIENWOHNUNG(Ferienwohnungsnummer,Groesse,Preis,Anzahl_Zimmer,textBeschreibung,Adress_ID) values (11,100,150.00,4,'Strandbungalow',17);


INSERT INTO KUNDE(Kundennummer,Geburtsdatum,IBAN,Adress_ID,Telefonnummer,Vorname,Name,E_Mail) values (1,'01/01/1960','DE78690500010024346792',1,'07531-123456','Karl','Napf','knapf@gmx.de');
INSERT INTO KUNDE(Kundennummer,Geburtsdatum,IBAN,Adress_ID,Telefonnummer,Vorname,Name,E_Mail) values (2,'02/01/1975','DE78690500010024346793',2,'06221-999888','Hans','Meier','meiers.hans@t-online.de');
INSERT INTO KUNDE(Kundennummer,Geburtsdatum,IBAN,Adress_ID,Telefonnummer,Vorname,Name,E_Mail) values (3,'03/01/1980','DE78690500010024346794',3,'0711-554673','Franz','Huber','huber@t-online.de');
INSERT INTO KUNDE(Kundennummer,Geburtsdatum,IBAN,Adress_ID,Telefonnummer,Vorname,Name,E_Mail) values (4,'04/01/1985','DE78690500010024346795',4,'+41-171-9864785','Klaus','Eber','eber@bluewin.ch');
INSERT INTO KUNDE(Kundennummer,Geburtsdatum,IBAN,Adress_ID,Telefonnummer,Vorname,Name,E_Mail) values (5,'05/01/1990','DE78690500010024346796',5,'+41-171-9864785','Egon','Meier','meier@gmail.com');
INSERT INTO KUNDE(Kundennummer,Geburtsdatum,IBAN,Adress_ID,Telefonnummer,Vorname,Name,E_Mail) values (6,'06/01/1995','DE78690500010024346797',6,'0171-9876543','Jim','Knopf','jim.knopf@gmx.net');

INSERT INTO BELEGUNG(Belegungsnummer,Datum,Statusflag,von,bis,Ferienwohnungsnummer,Kundennummer) values (1,'12/02/2016','gebucht','11/03/2016','13/03/2016',4,2);
INSERT INTO BELEGUNG(Belegungsnummer,Datum,Statusflag,von,bis,Ferienwohnungsnummer,Kundennummer) values (2,'13/03/2016','reserviert','11/05/2016','17/05/2016',5,2);
INSERT INTO BELEGUNG(Belegungsnummer,Datum,Statusflag,von,bis,Ferienwohnungsnummer,Kundennummer) values (3,'10/02/2016','reserviert','03/04/2016','23/04/2016',5,3);
INSERT INTO BELEGUNG(Belegungsnummer,Datum,Statusflag,von,bis,Ferienwohnungsnummer,Kundennummer) values (4,'09/02/2016','gebucht','04/07/2016','05/07/2016',6,4);
INSERT INTO BELEGUNG(Belegungsnummer,Datum,Statusflag,von,bis,Ferienwohnungsnummer,Kundennummer) values (5,'14/02/2016','reserviert','28/04/2016','02/05/2016',10,2);
INSERT INTO BELEGUNG(Belegungsnummer,Datum,Statusflag,von,bis,Ferienwohnungsnummer,Kundennummer) values (6,'18/02/2016','gebucht','04/05/2016','22/05/2016',8,3);
INSERT INTO BELEGUNG(Belegungsnummer,Datum,Statusflag,von,bis,Ferienwohnungsnummer,Kundennummer) values (7,'01/02/2016','gebucht','07/05/2016','08/05/2016',2,1);
INSERT INTO BELEGUNG(Belegungsnummer,Datum,Statusflag,von,bis,Ferienwohnungsnummer,Kundennummer) values (8,'11/02/2016','gebucht','22/05/2016','28/05/2016',9,5);
INSERT INTO BELEGUNG(Belegungsnummer,Datum,Statusflag,von,bis,Ferienwohnungsnummer,Kundennummer) values (9,'07/02/2016','gebucht','03/07/2016','08/07/2016',10,5);
INSERT INTO BELEGUNG(Belegungsnummer,Datum,Statusflag,von,bis,Ferienwohnungsnummer,Kundennummer) values (10,'10/02/2016','reserviert','01/05/2016','24/05/2016',1,4);

INSERT INTO RECHNUNG (Rechnungsnummer,Bezahldatum,Betrag,Rechnungsdatum,Belegungsnummer) values (1,'18/03/16',498.00,'15/03/16',1);
INSERT INTO RECHNUNG (Rechnungsnummer,Bezahldatum,Betrag,Rechnungsdatum,Belegungsnummer) values (2,'',549.00,'16/02/16',4); 

INSERT INTO FLUGHAFEN (IATA_CODE,Name,Adress_ID) values ('FRA','Frankfurt',23);
INSERT INTO FLUGHAFEN (IATA_CODE,Name,Adress_ID) values ('IST','Istanbul',24);
INSERT INTO FLUGHAFEN (IATA_CODE,Name,Adress_ID) values ('ZRH','Zuerich',25);
INSERT INTO FLUGHAFEN (IATA_CODE,Name,Adress_ID) values ('CDG','Paris',26);
INSERT INTO FLUGHAFEN (IATA_CODE,Name,Adress_ID) values ('BCN','Barcelona',27);

INSERT INTO ORT (Orts_ID,Name,IATA_Code,ISO_Code) values (20,'Konstanz','FRA','DE');
INSERT INTO ORT (Orts_ID,Name,IATA_Code,ISO_Code) values (21,'Heidelberg','FRA','DE');
INSERT INTO ORT (Orts_ID,Name,IATA_Code,ISO_Code) values (22,'Stuttgart','FRA','DE');
INSERT INTO ORT (Orts_ID,Name,IATA_Code,ISO_Code) values (23,'Bern','ZRH','CH');
INSERT INTO ORT (Orts_ID,Name,IATA_Code,ISO_Code) values (24,'Zuerich','ZRH','CH');
INSERT INTO ORT (Orts_ID,Name,IATA_Code,ISO_Code) values (25,'Oeludeniz','IST','TR');
INSERT INTO ORT (Orts_ID,Name,IATA_Code,ISO_Code) values (26,'Chur','ZRH','CH');
INSERT INTO ORT (Orts_ID,Name,IATA_Code,ISO_Code) values (27,'Bordeaux','CDG','FR');
INSERT INTO ORT (Orts_ID,Name,IATA_Code,ISO_Code) values (28,'Disneyland','CDG','FR');
INSERT INTO ORT (Orts_ID,Name,IATA_Code,ISO_Code) values (29,'Paris','CDG','FR');
INSERT INTO ORT (Orts_ID,Name,IATA_Code,ISO_Code) values (30,'Antalya','IST','TR');
INSERT INTO ORT (Orts_ID,Name,IATA_Code,ISO_Code) values (31,'Barcelona','BCN','ES');
INSERT INTO ORT (Orts_ID,Name,IATA_Code,ISO_Code) values (32,'Rust','FRA','DE');
INSERT INTO ORT (Orts_ID,Name,IATA_Code,ISO_Code) values (33,'Flims-Laax','ZRH','DE');
INSERT INTO ORT (Orts_ID,Name,IATA_Code,ISO_Code) values (34,'Frankfurt','FRA','DE');
INSERT INTO ORT (Orts_ID,Name,IATA_Code,ISO_Code) values (35,'Istanbul','IST','TR');

ALTER TABLE ADRESSE ENABLE CONSTRAINT Adresse_Ort;

INSERT INTO TOURISTENATTRAKTION (Name,Beschreibung,Adress_ID) values ('Europapark','Deutschlands Nr. 1',18);
INSERT INTO TOURISTENATTRAKTION (Name,Beschreibung,Adress_ID) values ('Hoernle','Bodensee-Stranbad',19);
INSERT INTO TOURISTENATTRAKTION (Name,Beschreibung,Adress_ID) values ('Flims-Laax-Arena','',20);
INSERT INTO TOURISTENATTRAKTION (Name,Beschreibung,Adress_ID) values ('GreenOne','',21);
INSERT INTO TOURISTENATTRAKTION (Name,Beschreibung,Adress_ID) values ('Disneyland','',22);

INSERT INTO BILDER (BILD_ID,Bildbeschreibung,Dateipfad,Ferienwohnungsnummer) values (12,'Finka','[1_2.jpg, Innenansicht]',1);
INSERT INTO BILDER (BILD_ID,Bildbeschreibung,Dateipfad,Ferienwohnungsnummer) values (13,'Finka','[1_1.jpg, Aussenansicht]',1);
INSERT INTO BILDER (BILD_ID,Bildbeschreibung,Dateipfad,Ferienwohnungsnummer) values (14,'Ferienwohnung mit Seeblick','[2_2.jpg, Innenansicht]',2);
INSERT INTO BILDER (BILD_ID,Bildbeschreibung,Dateipfad,Ferienwohnungsnummer) values (35,'Ferienwohnung mit Seeblick','[2_1.jpg, Aussenansicht]',2);
INSERT INTO BILDER (BILD_ID,Bildbeschreibung,Dateipfad,Ferienwohnungsnummer) values (16,'Im Schnee','',3);
INSERT INTO BILDER (BILD_ID,Bildbeschreibung,Dateipfad,Ferienwohnungsnummer) values (17,'Direkt am Meer','',4);
INSERT INTO BILDER (BILD_ID,Bildbeschreibung,Dateipfad,Ferienwohnungsnummer) values (18,'Direkt am Park','[5_1.gif, Garage]',5);
INSERT INTO BILDER (BILD_ID,Bildbeschreibung,Dateipfad,Ferienwohnungsnummer) values (19,'mit Blick auf Eiffelturm','',6);
INSERT INTO BILDER (BILD_ID,Bildbeschreibung,Dateipfad,Ferienwohnungsnummer) values (20,'Dachterrassewohnung zentral','',7);
INSERT INTO BILDER (BILD_ID,Bildbeschreibung,Dateipfad,Ferienwohnungsnummer) values (21,'zweigeschoessiges Haus','[8.jpg, Dachterrasse]',8);
INSERT INTO BILDER (BILD_ID,Bildbeschreibung,Dateipfad,Ferienwohnungsnummer) values (22,'Topvilla am Strand','',9);
INSERT INTO BILDER (BILD_ID,Bildbeschreibung,Dateipfad,Ferienwohnungsnummer) values (23,'Ferienhaus am Strand','',10);
INSERT INTO BILDER (BILD_ID,Bildbeschreibung,Dateipfad,Ferienwohnungsnummer) values (24,'Strandbungalow','',11);

insert into beinhalten (name, ferienwohnungsnummer) values ('Schwimmbad',1);
insert into beinhalten (name, ferienwohnungsnummer) values ('Sauna',1);
insert into beinhalten (name, ferienwohnungsnummer) values ('Autoabstellplatz',2);
insert into beinhalten (name, ferienwohnungsnummer) values ('Aufzug',2);
insert into beinhalten (name, ferienwohnungsnummer) values ('Sauna',3);
insert into beinhalten (name, ferienwohnungsnummer) values ('Kinderbetreuung',5);
insert into beinhalten (name, ferienwohnungsnummer) values ('Schwimmbad',5);
insert into beinhalten (name, ferienwohnungsnummer) values ('Schwimmbad',6);
insert into beinhalten (name, ferienwohnungsnummer) values ('Schwimmbad',7);
insert into beinhalten (name, ferienwohnungsnummer) values ('Sat-TV',8);
insert into beinhalten (name, ferienwohnungsnummer) values ('Reinigung',8);
insert into beinhalten (name, ferienwohnungsnummer) values ('Dachterrasse',8);
insert into beinhalten (name, ferienwohnungsnummer) values ('Garage',9);
insert into beinhalten (name, ferienwohnungsnummer) values ('Schwimmbad',9);
insert into beinhalten (name, ferienwohnungsnummer) values ('Schwimmbad',11);

INSERT INTO VERBINDEN (Startflughafen,Zielflughafen,Name) values ('FRA','BCN','Lufthansa');
INSERT INTO VERBINDEN (Startflughafen,Zielflughafen,Name) values ('FRA','IST','German Wings');
INSERT INTO VERBINDEN (Startflughafen,Zielflughafen,Name) values ('FRA','CDG','German Wings');
INSERT INTO VERBINDEN (Startflughafen,Zielflughafen,Name) values ('FRA','CDG','Lufthansa');
INSERT INTO VERBINDEN (Startflughafen,Zielflughafen,Name) values ('FRA','CDG','Thomas Cook');
INSERT INTO VERBINDEN (Startflughafen,Zielflughafen,Name) values ('IST','BCN','Thomas Cook');
INSERT INTO VERBINDEN (Startflughafen,Zielflughafen,Name) values ('CDG','BCN','Hapag Lloyd');
INSERT INTO VERBINDEN (Startflughafen,Zielflughafen,Name) values ('CDG','ZRH','German Wings');

INSERT INTO ENTFERNUNG (Ort1,Ort2,Kilometer) values (20,32,180);
INSERT INTO ENTFERNUNG (Ort1,Ort2,Kilometer) values (26,24,120);
INSERT INTO ENTFERNUNG (Ort1,Ort2,Kilometer) values (26,33,40);
INSERT INTO ENTFERNUNG (Ort1,Ort2,Kilometer) values (27,28,420);
INSERT INTO ENTFERNUNG (Ort1,Ort2,Kilometer) values (29,28,30);

COMMIT;