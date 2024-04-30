-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/17/oefening/149

-- Maak een lijst van klanten die meer dan 2 keer een reis gemaakt hebben waarbij er geen bezoek was aan Jupiter.

SELECT D.KLANTNR,
    (
        SELECT NAAM||' '||VNAAM
        FROM KLANTEN K
        WHERE K.KLANTNR=D.KLANTNR
    ) AS KLANTNAAM,
    COUNT(1) AS AANTALREIZEN

FROM DEELNAMES D
GROUP BY D.KLANTNR
HAVING
(
	SELECT COUNT(REISNR)>2
	FROM DEELNAMES DS
	WHERE DS.KLANTNR=D.KLANTNR
	AND DS.REISNR NOT IN
	(
		SELECT B.REISNR
		FROM BEZOEKEN B
		WHERE B.OBJECTNAAM = 'Jupiter'
	)
)