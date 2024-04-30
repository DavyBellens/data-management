-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/24/oefening/186

-- Geef alle spelers die alfabetisch (dus naam en voorletters, in deze volgorde) voor speler 8 staan.
-- Sorteer van voor naar achter.
-- Probeer zo goed of beter te doen dan "Sort (cost=24.31..24.47 rows=67 width=88)"

SELECT SPELERSNR, NAAM, VOORLETTERS, GEB_DATUM
FROM SPELERS
WHERE (NAAM, VOORLETTERS) < (SELECT NAAM, VOORLETTERS FROM SPELERS WHERE SPELERSNR=8)
ORDER BY 1, 2, 3, 4