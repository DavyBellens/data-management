-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/14/oefening/122

-- Geef voor elke speler die een wedstrijd heeft gespeeld het spelersnr en het totaal aantal boetes.
-- Spelers die een wedstrijd gespeeld hebben, maar geen boetes hebben, moeten ook getoond worden.
-- Sorteer op het aantal boetes en op spelersnr;

SELECT S.SPELERSNR, (SELECT CASE WHEN COUNT(*)>0 THEN COUNT(*) ELSE NULL END AS AANTALBOETES  FROM BOETES B WHERE B.SPELERSNR=S.SPELERSNR)
FROM SPELERS S
INNER JOIN WEDSTRIJDEN W ON S.SPELERSNR=W.SPELERSNR
GROUP BY S.SPELERSNR
ORDER BY 2, 1