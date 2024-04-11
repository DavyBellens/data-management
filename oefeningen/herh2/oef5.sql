-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/13/oefening/115

-- Bereken voor alle hemelobjecten die satellieten hebben, het aantal satellieten per hemelobject.
-- De lijst moet dalend gesorteerd worden op basis van het aantal satellieten van de hemelobjecten en daarna alfabetisch op basis van objectnaam.

SELECT SATELLIETVAN AS OBJECTNAAM, COUNT(DISTINCT S.OBJECTNAAM)
FROM HEMELOBJECTEN H
INNER JOIN HEMELOBJECTEN S USING(SATELLIETVAN)
GROUP BY SATELLIETVAN
ORDER BY 2 DESC, 1