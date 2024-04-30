-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/22/oefening/173

-- Geef de spelersnummers die minstens één keer bestuurslid zijn geweest.
-- Gebruik hiervoor geen JOIN, DISTINCT, GROUP BY, IN, ANY, ALL of EXISTS.
-- Sorteer op spelersnr

SELECT SPELERSNR
FROM BESTUURSLEDEN
UNION
SELECT SPELERSNR
FROM BESTUURSLEDEN
ORDER BY 1