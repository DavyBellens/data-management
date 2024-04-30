-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/17/oefening/147

-- Geef de deelnemers waarbij hun aantal reizen die ze ondernemen groter is dan alle hemelobjecten (die niet beginnen met de letter 'M') hun aantal keren dat ze bezocht zijn. Of anders geformuleerd:
-- Geef de deelnemers met meer deelnames dan het grootste aantal bezoeken aan een hemelobject dat niet met de letter 'M' begint (:deze deelnemer meer deelnames heeft dan de "grootste" .. = deze deelnemer heeft meer deelnames dan "alle" ..)
-- Sorteer op klantnr.

SELECT D.KLANTNR,
    (
        SELECT VNAAM
        FROM KLANTEN K
        WHERE K.KLANTNR = D.KLANTNR
    ),
    (
        SELECT NAAM
        FROM KLANTEN K
        WHERE K.KLANTNR = D.KLANTNR
    ),
    COUNT(1) AS AANTALDEELNAMES

FROM DEELNAMES D
GROUP BY 1
HAVING COUNT(1)>ALL
(
	SELECT COUNT(1)
	FROM BEZOEKEN H
	WHERE H.OBJECTNAAM NOT LIKE ('M%')
	GROUP BY OBJECTNAAM
)
ORDER BY 1