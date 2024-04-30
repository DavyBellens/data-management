-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/13/oefening/117

-- Geef de leeftijd van de jongste klant op moment van vertrek.

SELECT EXTRACT (YEAR FROM MIN(AGE(vertrekdatum, geboortedatum))) as JONGSTELEEFTIJD
FROM KLANTEN K
INNER JOIN DEELNAMES D USING(KLANTNR)
INNER JOIN REIZEN R USING(REISNR)