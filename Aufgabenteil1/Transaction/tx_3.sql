


DELETE FROM Adresse a
where a.Adress_ID in (select Adress_ID from Ferienwohnung where Ferienwohnungsnummer=4) ;

DELETE FROM Ferienwohnung f
where f.Ferienwohnungsnummer = 4 ; 

Commit;