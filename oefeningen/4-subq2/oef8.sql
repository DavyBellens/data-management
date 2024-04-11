-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/16/oefening/144

-- Maak een lijst met de spelers (naam van de speler, voorletter en woonplaats) die ooit gespeeld hebben voor een team dat nu in de tweede divisie speelt en waarvoor geen enkele boete betaald werd voor 1 januari 1981.
-- Sorteer van voor naar achter, oplopend.
-- Zorg dat er geen dubbels worden getoond.

SELECT S.NAAM, S.VOORLETTERS, S.PLAATS
FROM SPELERS S
WHERE S.SPELERSNR IN
(SELECT DISTINCT W.SPELERSNR
 FROM WEDSTRIJDEN W
 WHERE W.TEAMNR IN
 (SELECT TEAMNR FROM TEAMS WHERE DIVISIE = 'tweede')
) AND S.SPELERSNR NOT IN
(SELECT SPELERSNR
 FROM BOETES
 WHERE DATUM < '1981-01-01'
)
ORDER BY 1,2,3