-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/44/oefening/271

-- Geef voor de hemelobjecten een diameter groter dan 1000 het aantal satellietvan en de gemiddelde diameter per groep die aan het volgende voldoet.
-- We zien per object zien hoeveel satellieten hieraan voldoen, daarnaast in combinatie met hetzelfde object en afstand per 100tal. Alsook een algemeen overzicht.
-- Sorteer van voor naar achter.

SELECT DISTINCT H.OBJECTNAAM,
                ROUND(H.AFSTAND/100),
                H.SATELLIETVAN,
			    COUNT(SATELLIETVAN),
			    AVG(H.DIAMETER)
FROM HEMELOBJECTEN H
WHERE H.DIAMETER > 1000
GROUP BY GROUPING SETS (
	(1, 2, 3),
	(3),
	()
)
ORDER BY 1,2,3,4,5