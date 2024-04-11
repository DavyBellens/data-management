-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/16/oefening/143

-- Welke spelers hebben voor alle teams gespeeld uit de teamstabel?
-- (= voor welke speler bestaat er geen enkel team waar de betreffende speler nooit voor gespeeld heeft).
-- Sorteer op spelers nummer.
-- Gebruik de exists operator.

SELECT W.SPELERSNR
FROM WEDSTRIJDEN W
WHERE NOT EXISTS (
SELECT WS.TEAMNR
	FROM WEDSTRIJDEN WS
	WHERE NOT EXISTS
	(SELECT S.TEAMNR
	 FROM WEDSTRIJDEN S
	 WHERE S.TEAMNR=WS.TEAMNR AND S.SPELERSNR=W.SPELERSNR

	)
)
GROUP BY 1
ORDER BY 1