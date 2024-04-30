-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/15/oefening/134

-- Geef het reisnr, de prijs en vertrekdatum van de reis met de hoogste gemiddelde verblijfsduur op een hemelobject (=som van de verblijfsduur / aantal bezoeken per reis).

SELECT REISNR, PRIJS, VERTREKDATUM
FROM REIZEN
INNER JOIN BEZOEKEN USING(REISNR)
GROUP BY 1
HAVING SUM(VERBLIJFSDUUR)/COUNT(VOLGNR)>=ALL(
	SELECT SUM(VERBLIJFSDUUR)/COUNT(REISNR)
	FROM BEZOEKEN
	GROUP BY REISNR)