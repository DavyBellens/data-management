-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/15/oefening/133

-- Geef het hemellichaam dat het laatst bezocht is.
-- Gebruik hiervoor de laatste vertrekdatum van de reis en laatste volgnummer van bezoek.
-- Tip: gebruik hiervoor een rij-subquery.
-- Gebruik geen limit of top.

SELECT OBJECTNAAM
FROM BEZOEKEN
WHERE (REISNR, VOLGNR) IN
(SELECT REISNR, MAX(VOLGNR)
FROM REIZEN
INNER JOIN BEZOEKEN USING(REISNR)
WHERE VERTREKDATUM >= ALL(SELECT VERTREKDATUM FROM REIZEN)
GROUP BY 1)