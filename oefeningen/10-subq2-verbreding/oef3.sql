-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/17/oefening/148

-- Geef alle niet-bezochte hemelobjecten, buiten het grootste hemellichaam.
-- Sorteer op diameter en objectnaam.

SELECT H.OBJECTNAAM, H.AFSTAND, H.DIAMETER
FROM HEMELOBJECTEN H
WHERE H.OBJECTNAAM NOT IN (SELECT OBJECTNAAM FROM BEZOEKEN)
GROUP BY H.OBJECTNAAM
HAVING H.DIAMETER < ANY(SELECT DIAMETER FROM HEMELOBJECTEN)
ORDER BY 3, 1