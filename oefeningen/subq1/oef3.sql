-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/14/oefening/124

-- Geef van elke speler het spelersnr, de naam en het verschil tussen zijn of haar jaar van toetreding en het gemiddeld jaar van toetreding van de spelers die in dezelfde plaats wonen.
-- Sorteer op spelersnr.
-- Toon 3 getallen na de komma, zet het verschil om naar het numeric type met precisie van 5 en een schaal van 3.

SELECT SPELERSNR, NAAM, VOORLETTERS,
CAST(JAARTOE-(SELECT AVG(JAARTOE) FROM SPELERS S WHERE S.PLAATS=SP.PLAATS) AS NUMERIC(5, 3)) FROM SPELERS SP
ORDER BY 1