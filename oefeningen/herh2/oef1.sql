-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/13/oefening/106

-- Welke reizigers hebben al meer dan 1 reis ondernomen waarvoor ze meer dan 2,5 miljoen euro moesten betalen?
-- Sorteer op naam

SELECT K.NAAM, COUNT(DISTINCT R.REISNR) AS AANTAL_REIZEN
FROM REIZEN R
INNER JOIN DEELNAMES D USING(REISNR)
INNER JOIN KLANTEN K USING(KLANTNR)
WHERE R.PRIJS > 2.50
GROUP BY K.NAAM
HAVING COUNT(R.REISNR) > 1