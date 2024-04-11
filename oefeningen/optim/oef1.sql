-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/24/oefening/181

-- Geef een lijst met het spelersnummer en de naam van de speler die in Rijswijk wonen en die in 1980 een boete gekregen hebben van 25 euro.
-- Sorteer van voor naar achter.
-- Probeer gelijk of beter te doen dan "(cost=2.37..2.37 rows=1 width=68)".

SELECT S.SPELERSNR, S.NAAM
FROM SPELERS S
WHERE S.PLAATS LIKE 'Rijswijk'
AND S.SPELERSNR IN (SELECT SPELERSNR FROM BOETES WHERE EXTRACT(YEAR FROM DATUM)=1980 AND BEDRAG=25)
ORDER BY 1,2