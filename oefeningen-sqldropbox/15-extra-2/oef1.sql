-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/25/oefening/187

-- Geef van elke speler het spelersnr, de naam en het verschil tussen zijn of haar jaar van toetreding en het gemiddeld jaar van toetreding van de spelers die in dezelfde plaats wonen.
-- Sorteer van voor naar achter.
-- Toon 3 getallen na de komma, maximaal 2 voor de komma; gebruik een cast functie.

SELECT SPELERSNR, NAAM, VOORLETTERS, (JAARTOE - AVG(JAARTOE) OVER (PARTITION BY PLAATS))::NUMERIC(5, 3)
FROM SPELERS
ORDER BY 1,2,3,4