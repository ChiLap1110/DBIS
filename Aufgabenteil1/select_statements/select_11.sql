SELECT f.Ferienwohnungsnummer, 
sum(case when statusflag = 'reserviert' then 1 else 0 end) Reserviert ,
sum(case when statusflag = 'gebucht' then 1 else 0 end) Gebucht
FROM Ferienwohnung f
	left outer join Belegung b on (b.Ferienwohnungsnummer=f.Ferienwohnungsnummer) 
GROUP BY f.Ferienwohnungsnummer;

