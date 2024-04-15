-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/15/oefening/136

-- Geef het op één na kleinste hemellichaam.
-- Je kan dit vinden door handig gebruik te maken van expliciete joins en een doorsnedevoorwaarde.
-- Tip: probeer eerst een lijst te krijgen van alle hemelobjecten en het aantal hemellichaam dat kleiner is dan dat hemelobject.

SELECT H.OBJECTNAAM, (SELECT COUNT(1) AS AANTALKLEINER
				    FROM HEMELOBJECTEN HS
				    WHERE H.OBJECTNAAM=HS.OBJECTNAAM)
FROM HEMELOBJECTEN H
INNER JOIN HEMELOBJECTEN HO ON H.DIAMETER > HO.DIAMETER
GROUP BY 1
HAVING COUNT(1) <= ALL
	(SELECT COUNT(1) AS AANTALKLEINER
	FROM HEMELOBJECTEN H
	INNER JOIN HEMELOBJECTEN HO ON H.DIAMETER > HO.DIAMETER
	GROUP BY H.OBJECTNAAM)