-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/24/oefening/185

-- Geef van alle spelers het verschil tussen het jaar van toetreding en het geboortejaar, maar geef alleen die spelers waarvan dat verschil groter is dan 20.
-- Sorteer van voor naar achter.
-- Probeer zo goed of beter te doen dan "Sort (cost=17.20..17.37 rows=67 width=90)"

SELECT SPELERSNR, NAAM, VOORLETTERS, JAARTOE - EXTRACT(YEAR FROM GEB_DATUM) AS TOETREDINGSLEEFTIJD
FROM SPELERS
WHERE JAARTOE - EXTRACT(YEAR FROM GEB_DATUM) > 20
ORDER BY 1,2,3,4