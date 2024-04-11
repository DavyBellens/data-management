-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/16/oefening/138

-- Geef voor elke aanvoerder het spelersnr, de naam en het aantal boetes dat voor hem of haar betaald is en het aantal teams dat hij of zij aanvoert. Toon enkel aanvoerders die boetes gekregen hebben.
-- Sorteer van voor naar achter, oplopend.

SELECT S.SPELERSNR, S.NAAM, S.VOORLETTERS,
(SELECT COUNT(1) AS AANTALBOETES FROM BOETES B WHERE B.SPELERSNR=S.SPELERSNR),
(SELECT COUNT(1) AS AANTALTEAMS FROM TEAMS T WHERE T.SPELERSNR=S.SPELERSNR)
FROM SPELERS S
WHERE SPELERSNR IN
(SELECT B.SPELERSNR
 FROM BOETES B
 WHERE B.SPELERSNR=S.SPELERSNR
) AND SPELERSNR IN
(SELECT T.SPELERSNR
 FROM TEAMS T
 WHERE T.SPELERSNR=S.SPELERSNR
)
ORDER BY 1, 2