-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/16/oefening/141

-- Geef alle spelers die geen wedstrijd voor team 1 heeft gespeeld. Sorteer op naam, daarna op nr.

SELECT S.SPELERSNR, S.NAAM
FROM SPELERS S
WHERE S.SPELERSNR NOT IN
(SELECT W.SPELERSNR
 FROM WEDSTRIJDEN W
 WHERE W.TEAMNR=1
)
ORDER BY 2, 1