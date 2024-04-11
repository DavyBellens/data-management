-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/22/oefening/174

-- Geef de spelersnummers die geen wedstrijd gespeeld hebben.
-- Gebruik hiervoor geen JOIN, DISTINCT, GROUP BY, IN, ANY, ALL of EXISTS.
-- Sorteer op spelersnr

SELECT SPELERSNR
FROM SPELERS
EXCEPT
SELECT SPELERSNR
FROM WEDSTRIJDEN
ORDER BY 1