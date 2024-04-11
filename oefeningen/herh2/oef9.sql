-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/13/oefening/120

-- Geef per klant het totaal aantal reizen waaraan deze klant zal deelnemen en het langste bezoek dat deze klant zal maken aan een hemelobject, over alle reizen heen.
-- Klanten zonder reizen of zonder bezoeken moeten ook voorkomen in het overzicht.
-- Sorteer op klantnr.

SELECT K.KLANTNR, COUNT(DISTINCT R.REISNR) AS AANTAL, MAX(B.VERBLIJFSDUUR) AS LANGSTEBEZOEK
FROM KLANTEN K
LEFT JOIN DEELNAMES D USING(KLANTNR)
LEFT JOIN REIZEN R USING(REISNR)
LEFT JOIN BEZOEKEN B USING(REISNR)
GROUP BY K.KLANTNR
ORDER BY 1