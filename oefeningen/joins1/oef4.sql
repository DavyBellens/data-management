-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/20/oefening/163

-- Geef alle wedstrijden van het team waarvan speler 6 aanvoerder is.
-- Sorteer

SELECT WEDSTRIJDNR
FROM WEDSTRIJDEN W
INNER JOIN (SELECT TEAMNR FROM TEAMS WHERE SPELERSNR=6) AS TEAMS ON W.TEAMNR=TEAMS.TEAMNR
ORDER BY 1