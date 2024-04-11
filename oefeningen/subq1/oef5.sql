-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/14/oefening/126

-- Geef van alle spelers het verschil tussen het jaar van toetreding en het geboortejaar, maar geef alleen die spelers waarvan dat verschil groter is dan 20.
-- Sorteer deze gegevens beginnend bij de eerste kolom, eindigend bij de laatste kolom.

SELECT * FROM
(SELECT SPELERSNR, NAAM, VOORLETTERS, JAARTOE-EXTRACT(YEAR FROM GEB_DATUM) AS TOETREDINGSLEEFTIJD
FROM SPELERS) AS SP
WHERE SP.TOETREDINGSLEEFTIJD > 20
ORDER BY 1, 2, 3, 4