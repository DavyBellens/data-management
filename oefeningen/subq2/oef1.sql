-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/16/oefening/137

-- Geef het totaal aantal boetes, het totale boetebedrag, het minimum en het maximum boetebedrag dat door onze club betaald werd. Let er hierbij op dat er gehele getallen worden getoond (rond af indien nodig).
-- Sorteer van voor naar achter, oplopend.
-- Deze opgave behoeft geen subquery.

SELECT COUNT(1) AS AANTAL_BOETES, ROUND(SUM(BEDRAG), 0) AS TOTAAL_BEDRAG, ROUND(MIN(BEDRAG), 0) AS MINIMUM, ROUND(MAX(BEDRAG), 0) AS MAXIMUM
FROM BOETES