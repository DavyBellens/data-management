-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/44/oefening/269

-- Geef voor elke geboortejaar van de klanten, het aantal klanten, het kleinste klantennummer en het grootste klantennummer.
-- Geef ook het totaal aantal klanten en het kleinste en grootste klantennummer.
-- Sorteer van voor naar achter.

SELECT DATE_PART('YEAR', GEBOORTEDATUM), COUNT(KLANTNR), MIN(KLANTNR), MAX(KLANTNR)
FROM KLANTEN
GROUP BY ROLLUP (1)
ORDER BY 1,2,3,4