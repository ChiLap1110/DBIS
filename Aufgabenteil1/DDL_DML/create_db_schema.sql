CREATE TABLE BANKVERBINDUNG (
IBAN                    varchar2(32)PRIMARY KEY,
BLZ                     INTEGER NOT NULL CONSTRAINT BANK_BLZ CHECK (BLZ>0),
KontoNr                 varchar2(256)  NOT NULL,
Bank                    varchar2(256) NOT NULL,
BIC                     varchar2(11)  NOT NULL,
UNIQUE(KontoNr,BLZ),
UNIQUE(KontoNr,BIC))
;

CREATE TABLE FLUGGESELLSCHAFT (
Name                    varchar2(256) PRIMARY KEY,
Servicequalitaet        NUMBER(2)NOT NULL CHECK (Servicequalitaet between 1 and 10));

CREATE TABLE LAND (
ISO_CODE                varchar2(7) PRIMARY KEY,
Name                    varchar2(256)UNIQUE NOT NULL);

CREATE TABLE ZUSATZAUSSTATTUNG (
Name                    varchar2(256) PRIMARY KEY);

CREATE TABLE ADRESSE(
Adress_ID               INTEGER PRIMARY KEY,
Strasse                 varchar2(256) NOT NULL,
Hausnummer              varchar2(10) NOT NULL,
PLZ                     varchar2(256) not null,
Orts_ID                 INTEGER NOT NULL ); 

CREATE TABLE FERIENWOHNUNG  (
Ferienwohnungsnummer    INTEGER PRIMARY KEY,
Groesse                 INTEGER NOT NULL CONSTRAINT FEWO_GR CHECK(Groesse > 0),
Preis                   NUMBER NOT NULL CONSTRAINT FEWO_PR CHECK(Preis >0),
Anzahl_Zimmer           INTEGER NOT NULL CONSTRAINT FEWO_AZ CHECK(Anzahl_Zimmer >0),
textBeschreibung        varchar2(256),
Adress_ID               INTEGER UNIQUE NOT NULL REFERENCES ADRESSE(Adress_ID)
);

CREATE TABLE KUNDE ( 
Kundennummer            INTEGER PRIMARY KEY,
Geburtsdatum            DATE NOT NULL,
IBAN                    varchar(32) UNIQUE NOT NULL CONSTRAINT KUNDE_IBAN REFERENCES Bankverbindung(IBAN),
Adress_ID               INTEGER UNIQUE NOT NULL CONSTRAINT Kunde_ID REFERENCES Adresse(Adress_ID),
Telefonnummer           varchar2(256) NOT NULL,
Vorname                 varchar2(256) NOT NULL,
Name                    varchar2(256) NOT NULL,
E_Mail                  varchar2(256) NOT NULL);


CREATE TABLE BELEGUNG (
Belegungsnummer         INTEGER PRIMARY KEY,
Datum                   DATE NOT NULL,
Statusflag              varchar2(12) NOT NULL CHECK (Statusflag in ('reserviert','gebucht')),
von                     DATE NOT NULL,
bis                     DATE NOT NULL,
Ferienwohnungsnummer    INTEGER NOT NULL REFERENCES Ferienwohnung (Ferienwohnungsnummer),
Kundennummer            INTEGER NOT NULL REFERENCES Kunde (Kundennummer) ,
CONSTRAINT BELEGUNG CHECK (von < bis));



CREATE TABLE RECHNUNG(
Rechnungsnummer         INTEGER PRIMARY KEY,
Bezahldatum             DATE,
Betrag                  NUMBER CONSTRAINT Rechnung_Betrag CHECK(Betrag>0),
Rechnungsdatum          DATE NOT NULL,
Belegungsnummer         INTEGER UNIQUE NOT NULL CONSTRAINT RECHNUNG_BNR REFERENCES Belegung(Belegungsnummer) );



CREATE TABLE FLUGHAFEN (
IATA_CODE               varchar2(3) PRIMARY KEY,
Name                    varchar2(256) UNIQUE NOT NULL,
Adress_ID               INTEGER UNIQUE NOT NULL CONSTRAINT FLUGHAFEN_ID REFERENCES Adresse(Adress_ID));

CREATE TABLE ORT(
Orts_ID                 INTEGER PRIMARY KEY,
Name                    varchar2(256)NOT NULL,
IATA_Code               varchar2(3) NOT NULL CONSTRAINT ORT_IATA REFERENCES Flughafen(IATA_Code),
ISO_CODE                varchar2(6) NOT NULL CONSTRAINT ORT_ISO REFERENCES Land(ISO_Code)
);

ALTER TABLE ADRESSE 
ADD CONSTRAINT Adresse_Ort FOREIGN KEY (Orts_ID) REFERENCES Ort(Orts_ID);


CREATE TABLE TOURISTENATTRAKTION (
Name                    varchar2(256) PRIMARY KEY,
Beschreibung            varchar2(256),
Adress_ID               INTEGER NOT NULL CONSTRAINT TA_ID REFERENCES Adresse(Adress_ID));


CREATE TABLE Bilder (
BILD_ID                 INTEGER PRIMARY KEY,
Bildbeschreibung        varchar2(256) NOT NULL,
Dateipfad               varchar2(256),
Ferienwohnungsnummer    NUMBER(20) NOT NULL CONSTRAINT BILD_FEWO REFERENCES Ferienwohnung(Ferienwohnungsnummer) );


/* Beziehungstypen*/

CREATE TABLE BEINHALTEN(
Name                    varchar2(256) REFERENCES Zusatzausstattung(Name),
Ferienwohnungsnummer    INTEGER  CONSTRAINT BEINHALTEN_NR REFERENCES Ferienwohnung(Ferienwohnungsnummer) ,
PRIMARY KEY(Name,Ferienwohnungsnummer));

CREATE TABLE VERBINDEN(
STARTFLUGHAFEN          varchar2(256)CONSTRAINT VERB_START REFERENCES Flughafen(IATA_Code) ,
ZIELFLUGHAFEN           varchar2(256)CONSTRAINT VERB_ZIEL  REFERENCES Flughafen(IATA_Code) ,
Name                    varchar2(256)CONSTRAINT VERB_FG    REFERENCES Fluggesellschaft(Name),
PRIMARY KEY (STARTFLUGHAFEN,ZIELFLUGHAFEN,Name));

CREATE TABLE ENTFERNUNG(
Ort1                    INTEGER CONSTRAINT BERECHNE_1 REFERENCES Ort(Orts_ID),
Ort2                    INTEGER CONSTRAINT BERECHNE_2 REFERENCES Ort(Orts_ID) ,
Kilometer               INTEGER CHECK (Kilometer >0),
CHECK(Ort1 <> Ort2),
PRIMARY KEY (Ort1,Ort2));

--1
create view BuchungsSicht as 
Select Belegungsnummer, Datum,von, bis ,Ferienwohnungsnummer,Kundennummer
FROM Belegung
WHERE statusflag='gebucht';

create view ReservierungsSicht as 
Select Belegungsnummer, Datum,von, bis ,Ferienwohnungsnummer,Kundennummer
FROM Belegung
WHERE statusflag='reserviert';

--2
create or replace view UebersichtKunden as
select k.Adress_ID,bv.BLZ,bv.Kontonr,bv.BIC,bv.Bank,bv.IBAN,k.Name,k.Vorname,b.statusflag,b.von,b.bis,b.datum,f.Ferienwohnungsnummer,f.textBeschreibung
FROM  Kunde k left outer join Belegung b on (b.Kundennummer = k.Kundennummer) left outer join  Ferienwohnung f on (b.Ferienwohnungsnummer = f.Ferienwohnungsnummer), Bankverbindung bv
WHERE bv.IBAN = k.IBAN ;


--3
CREATE view Familienwohnung as
select ferienwohnungsnummer, groesse, preis, anzahl_zimmer, textBeschreibung, adress_id
from ferienwohnung
where groesse>100
WITH CHECK OPTION;

--4
create view Zahlungsstatus as
select b.belegungsnummer, b.statusflag, f.ferienwohnungsnummer, f.textBeschreibung, k.name, k.kundennummer, r.rechnungsnummer, r.rechnungsdatum, r.bezahldatum,r.betrag,
case when r.bezahldatum is not null then 'bezahlt' else 'offen' end as status
from rechnung r RIGHT OUTER join belegung b ON (b.belegungsnummer = r.belegungsnummer), ferienwohnung f, kunde k
where b.ferienwohnungsnummer = f.ferienwohnungsnummer 
and b.kundennummer = k.kundennummer;

--5
create view MidAgeKunden as
select k.*, floor((Months_Between(current_Date, k.geburtsdatum )/12)) alter_kunde
from kunde k
where floor((Months_Between(current_Date, k.geburtsdatum )/12)) between 30 and 40;



