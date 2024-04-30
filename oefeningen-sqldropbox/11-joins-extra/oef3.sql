-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/21

-- Geef voor elke reis het aantal klanten waarvan de naam niet met een 'G' begint en waarvan de periode van de geboortedatum van de klant tot de vertrekdatum van de reis overlapt met de huidige datum en 50 jaar verder (gebruik hiervoor de gepaste operator: OVERLAPS).
-- Indien er op de reis hemelobjecten worden bezocht waarvan de tweede letter van het hemelobject voorkomt in de naam van het hemelobject waarvan dit bezocht hemelobject een satelliet is, dan wordt deze reis genegeerd.
-- Sorteer op reisnr en verder.

-- (tip: conditie in outer join is niet hetzelfde als conditie in de where; + interval)

SELECT R.REISNR, COUNT(DISTINCT K.NAAM)
FROM REIZEN R
LEFT JOIN DEELNAMES D ON R.REISNR=D.REISNR
LEFT JOIN KLANTEN K ON D.KLANTNR=K.KLANTNR
	AND K.NAAM NOT LIKE 'G%'
	AND (K.GEBOORTEDATUM, R.VERTREKDATUM) OVERLAPS (CURRENT_DATE, CURRENT_DATE+INTERVAL '50 years')
INNER JOIN BEZOEKEN B ON R.REISNR=B.REISNR
INNER JOIN HEMELOBJECTEN H ON H.OBJECTNAAM=B.OBJECTNAAM
WHERE R.REISNR NOT IN
	(SELECT B.REISNR
		FROM BEZOEKEN B INNER JOIN HEMELOBJECTEN H ON B.OBJECTNAAM=H.OBJECTNAAM
	AND H.SATELLIETVAN LIKE '%'||SUBSTRING(B.OBJECTNAAM, 2, 1)||'%' )
GROUP BY 1
ORDER BY 1, 2