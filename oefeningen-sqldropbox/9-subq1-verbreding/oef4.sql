-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/15/oefening/135

-- Geef de planeet (draait dus rond de zon) met de meeste satellieten.
-- Sorteer op objectnaam.

SELECT OBJECTNAAM
FROM HEMELOBJECTEN H
GROUP BY 1
HAVING (SELECT COUNT(1) FROM HEMELOBJECTEN S WHERE S.SATELLIETVAN=H.OBJECTNAAM )>=ALL(
	SELECT (SELECT COUNT(1) FROM HEMELOBJECTEN HS WHERE HS.SATELLIETVAN=S.OBJECTNAAM )
	FROM HEMELOBJECTEN S
	GROUP BY OBJECTNAAM)