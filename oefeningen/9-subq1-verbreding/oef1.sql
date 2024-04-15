-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/15/oefening/132

-- Geef een lijst van alle hemelobjecten die meer keer bezocht gaan worden dan Jupiter. (onafhankelijk van het aantal deelnames)
-- Sorteer op objectnaam, diameter.

SELECT B.OBJECTNAAM, (SELECT H.DIAMETER FROM HEMELOBJECTEN H WHERE H.OBJECTNAAM=B.OBJECTNAAM)
FROM REIZEN
INNER JOIN BEZOEKEN B USING(REISNR)
GROUP BY 1
HAVING COUNT(1) > (SELECT COUNT(1) FROM REIZEN INNER JOIN BEZOEKEN USING(REISNR) WHERE OBJECTNAAM='Jupiter')
ORDER BY 1, 2