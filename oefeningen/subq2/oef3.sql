-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/16/oefening/139

-- Geef een lijst met het spelersnummer en de naam van de spelers die in Rijswijk wonen en die in 1980 een boete gekregen hebben van 25 euro (meerdere voorwaarden dus).
-- Gebruik hiervoor geen exists operator maar wel zijn tegenhanger die meestal bij niet-gecorreleerde subquery's wordt gebruikt.
-- Sorteer van voor naar achter, oplopend.

SELECT SPELERSNR, NAAM
FROM SPELERS
WHERE (SPELERSNR, NAAM) IN
(SELECT S.SPELERSNR, NAAM
 FROM SPELERS S
 INNER JOIN BOETES B ON S.SPELERSNR=B.SPELERSNR
WHERE B.BEDRAG = 25.00 AND EXTRACT(YEAR FROM DATUM)=1980
) AND PLAATS LIKE ('Rijswijk')
ORDER BY 1, 2