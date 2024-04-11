-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/12/oefening/88

-- Geef voor elke wedstrijd het wedstrijdnummer en de volledige naam van de aanvoerder van het team waarvoor de wedstrijd werd gespeeld.
-- Sorteer je resultaat volgens het wedstrijdnummer in oplopende volgorde.

SELECT W.WEDSTRIJDNR, S.NAAM, S.VOORLETTERS
FROM WEDSTRIJDEN W
LEFT JOIN TEAMS T ON W.TEAMNR = T.TEAMNR
INNER JOIN SPELERS S ON T.SPELERSNR = S.SPELERSNR
ORDER BY WEDSTRIJDNR ASC