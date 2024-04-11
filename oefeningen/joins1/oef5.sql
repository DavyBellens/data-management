-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/20/oefening/164

-- Geef alle spelers die geen enkele wedstrijd voor team 1 hebben gespeeld.
-- Sorteer op naam, daarna op spelersnr.

SELECT S.SPELERSNR, S.NAAM
FROM SPELERS S
WHERE S.SPELERSNR NOT IN (SELECT DISTINCT SPELERSNR
FROM WEDSTRIJDEN
WHERE TEAMNR = 1)
ORDER BY 2,1