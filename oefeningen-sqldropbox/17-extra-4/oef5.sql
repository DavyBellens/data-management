-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/27/oefening/197

-- Maak een lijst met die mensen die meer dan 2 maal een reis ondernomen hebben waarin men geen enkele satelliet van Jupiter bezoekt !.
-- Sorteer van voor naar achter.

SELECT KLANTNR, NAAM||VNAAM AS "volledige naam", COUNT(REISNR) AS "aantal ondernomen reizen"
FROM KLANTEN K
INNER JOIN DEELNAMES D USING(KLANTNR)
WHERE KLANTNR IN (
	SELECT KLANTNR
	FROM BEZOEKEN
	INNER JOIN DEELNAMES USING(REISNR)
	WHERE REISNR NOT IN (
		SELECT REISNR
		FROM BEZOEKEN
		INNER JOIN HEMELOBJECTEN USING(OBJECTNAAM)
		WHERE SATELLIETVAN='Jupiter'
	)
	GROUP BY 1
	HAVING COUNT(DISTINCT REISNR) > 2
)
GROUP BY 1
ORDER BY 1,2,3