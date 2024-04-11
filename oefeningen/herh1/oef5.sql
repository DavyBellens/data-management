-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/12/oefening/98

-- Geef een lijst met het spelersnummer, de naam van de speler, de datum van de boete en het bedrag van de boete van al de spelers die een boete gekregen hebben met een bedrag groter dan 45,50 euro en in Rijswijk wonen.
-- Geef expliciet aan welke join je gebruikt.

SELECT S.SPELERSNR, S.NAAM, B.DATUM, B.BEDRAG
FROM SPELERS S
INNER JOIN BOETES B ON S.SPELERSNR=B.SPELERSNR
WHERE S.PLAATS LIKE('Rijswijk') AND B.BEDRAG > 45.50