-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/26/oefening/192

-- Maak een lijst met klantgegevens van de personen die nog nooit op Phobos op bezoek geweest zijn.
-- Maak expliciet gebruik van de 'uitgezonderd' set operator.
-- (Is dit de meest efficiënte oplossing?)
-- Sorteer van voor naar achter.

SELECT KLANTNR, NAAM, VNAAM
FROM KLANTEN
WHERE KLANTNR IN
	(
	SELECT KLANTNR
	FROM KLANTEN
	EXCEPT ALL
	SELECT KLANTNR
	FROM DEELNAMES D
	INNER JOIN REIZEN R ON D.REISNR=R.REISNR
	WHERE D.REISNR IN (
			SELECT REISNR
			FROM BEZOEKEN
			WHERE OBJECTNAAM='Phobos'
		)
	)
ORDER BY 1,2,3