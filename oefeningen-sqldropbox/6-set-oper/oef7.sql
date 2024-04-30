-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/22/oefening/176

-- Geef een lijst van alle spelers die bestuurslid geweest zijn (of nu nog zijn) en/of een boete hebben gehad hun aantal boetes en hun laatst begonnen bestuursfunctie. Zorg dat spelers die boetes gehad hebben én bestuurder zijn (geweest) twee keer voorkomen in de kolom 'data' twee verschillende waardes.
-- Sorteer op naam, voorletters en data.
-- Gebruik de to_char functie voor het formaat van de geboortedatum (bv 12/12/1900).

SELECT NAAM, VOORLETTERS, TO_CHAR(GEB_DATUM, 'DD/MM/YYYY') AS GEBOORTEDATUM, B.FUNCTIE AS DATA
FROM BESTUURSLEDEN B
INNER JOIN SPELERS S ON B.SPELERSNR=S.SPELERSNR
WHERE B.BEGIN_DATUM>=ALL(SELECT BEGIN_DATUM FROM BESTUURSLEDEN BS WHERE B.SPELERSNR=BS.SPELERSNR)
UNION
SELECT NAAM, VOORLETTERS, TO_CHAR(GEB_DATUM, 'DD/MM/YYYY'),
'Boetes: '||(SELECT COUNT(1) FROM BOETES BS WHERE B.SPELERSNR=BS.SPELERSNR)::TEXT
FROM BOETES B
INNER JOIN SPELERS S ON B.SPELERSNR=S.SPELERSNR
ORDER BY 1,2,4