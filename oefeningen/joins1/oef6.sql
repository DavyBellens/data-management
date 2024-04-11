-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/20/oefening/165

-- Maak een lijst met de spelers (naam van de speler, voorletter en woonplaats) die ooit gespeeld hebben voor een team dat nu in de tweede divisie speelt en waarvoor geen enkele boete betaald werd voor 1 januari 1981.
-- Geen dubbels, sorteer van voor naar achter.

SELECT S.NAAM, S.VOORLETTERS, S.PLAATS
FROM SPELERS S
INNER JOIN
(SELECT W.SPELERSNR
FROM WEDSTRIJDEN W
INNER JOIN (SELECT TEAMNR
FROM TEAMS
WHERE DIVISIE='tweede') as T2 ON W.teamnr=T2.TEAMNR
 LEFT JOIN (
 SELECT *
	 FROM BOETES B
	 WHERE B.DATUM<'1981-01-01'
 ) AS B81 ON W.spelersnr = B81.spelersnr
 WHERE B81.SPELERSNR IS NULL
GROUP BY 1)
AS TS2 ON S.spelersnr=TS2.SPELERSNR
ORDER BY 1,2,3