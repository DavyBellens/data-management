-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/17/oefening/150

-- Geef de klantnr voor de klant met het meeste bezoeken aan de maan.
-- Geef ook het aantal bezoeken.
-- Gebruik geen limit of top.

SELECT D.KLANTNR,
    (
        SELECT COUNT(DISTINCT REISNR)
        FROM REIZEN
        INNER JOIN BEZOEKEN USING(REISNR)
        WHERE OBJECTNAAM='Maan'
    )
FROM DEELNAMES D
GROUP BY 1
HAVING COUNT(1) >= ALL
(
	SELECT COUNT(REISNR)
	FROM DEELNAMES DL
	WHERE REISNR IN
	(
		SELECT B.REISNR
		FROM BEZOEKEN B
		WHERE B.OBJECTNAAM='Maan'
		GROUP BY 1
	)
	GROUP BY KLANTNR
)