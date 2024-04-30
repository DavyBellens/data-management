-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/13/oefening/113

-- Welke klanten (klantnaam, geboortedatum) zijn op een ruimtereis vertrokken in het jaar dat ze 45 jaar geworden zijn?
-- Het resultaat moet stijgend gesorteerd worden op de geboortedatum.

SELECT DISTINCT K.NAAM AS KLANTNAAM, K.GEBOORTEDATUM
FROM KLANTEN K
INNER JOIN DEELNAMES D USING(KLANTNR)
INNER JOIN REIZEN R USING(REISNR)
WHERE EXTRACT(YEAR FROM R.VERTREKDATUM) - EXTRACT(YEAR FROM K.GEBOORTEDATUM) = 45
ORDER BY 2