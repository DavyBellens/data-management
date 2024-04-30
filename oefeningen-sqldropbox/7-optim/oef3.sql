-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/24/oefening/183

-- Geef van elke speler het spelersnr, de naam en het verschil tussen zijn of haar jaar van toetreding en het gemiddeld jaar van toetreding.
-- Sorteer van voor naar achter.
-- Probeer gelijk of beter te doen dan "Sort (cost=33.16..33.66 rows=200 width=86)"

SELECT SPELERSNR, NAAM, VOORLETTERS, JAARTOE-(SELECT AVG(JAARTOE) FROM SPELERS) AS VERSCHIL
FROM SPELERS
ORDER BY 1,2,3,4