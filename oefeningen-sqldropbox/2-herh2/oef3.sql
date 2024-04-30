-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/13/oefening/111

-- Maak een lijst met een overzicht van de reizen en het aantal deelnemers van elke reis.
-- Orden de lijst dalend op basis van het aantal deelnemers, als er eenzelfde aantal deelnemers is, moeten deze stijgend geordend worden volgens reisnummer.
-- Zorg dat reizen zonder deelnames ook in het resultaat staan.

SELECT R.REISNR, COUNT(DISTINCT K.KLANTNR) AS DEELNEMERS
FROM REIZEN R
LEFT JOIN DEELNAMES D USING(REISNR)
LEFT JOIN KLANTEN K USING(KLANTNR)
GROUP BY R.REISNR
ORDER BY 2 DESC, 1