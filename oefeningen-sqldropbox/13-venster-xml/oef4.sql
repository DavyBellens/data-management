-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/41

-- Geef alle klanten waarbij de 1 van de middenste letters van de naam uit het woord 'qwerty' komt.
-- Gebruik geen OR operator, sorteer van voor naar achter.

SELECT *
FROM KLANTEN
WHERE NAAM SIMILAR TO '%[qwerty]%'