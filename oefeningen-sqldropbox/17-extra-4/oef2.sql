-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/27/oefening/194

-- Maak een lijst van de mensen die Mars wel bezocht hebben maar Io nog niet.
-- Sorteer van voor naar achter.

SELECT KLANTNR, NAAM
FROM KLANTEN
WHERE KLANTNR IN (
	SELECT KLANTNR
	FROM DEELNAMES D
	INNER JOIN BEZOEKEN B ON D.REISNR=B.REISNR
	WHERE OBJECTNAAM='Mars'
	EXCEPT ALL
	SELECT KLANTNR
	FROM DEELNAMES D
	INNER JOIN BEZOEKEN B ON D.REISNR=B.REISNR
	WHERE OBJECTNAAM='Io'
)
ORDER BY 1,2