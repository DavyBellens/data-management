-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/22/oefening/175

-- Geef voor de spelers die bestuurslid en/of teamkapitein zijn hun naam en een oplijsting van hun functienamen (huidig of verleden) en hun divisies waarvoor ze kapitein zijn.
-- Sorteer op spelersnaam en naam.
-- Gebruik geen OUTER JOIN of WHERE.

SELECT NAAM AS SPELERSNAAM, FUNCTIE AS NAAM
FROM BESTUURSLEDEN B
INNER JOIN SPELERS S ON B.SPELERSNR = S.SPELERSNR
UNION
SELECT NAAM AS SPELERSNAAM, DIVISIE
FROM TEAMS T
INNER JOIN SPELERS S ON S.SPELERSNR = T.SPELERSNR
ORDER BY 1,2