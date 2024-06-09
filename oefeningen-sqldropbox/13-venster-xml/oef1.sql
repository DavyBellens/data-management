-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/41/oefening/246

-- Geef alle klanten waarbij de voorlaatste letter van de naam 1 van de letters uit het woord 'azerty' is.
-- Gebruik geen OR operator, maar een andere ISO sql operator voor het vergelijken van patronen, sorteer van voor naar achter.

SELECT *
FROM KLANTEN
WHERE SUBSTRING(NAAM, LENGTH(NAAM)-1, 1) SIMILAR TO '[azerty]'