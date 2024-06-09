-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/27/oefening/195

-- Maak een overzicht waarbij je voor de Maan en voor Mars aangeeft hoeveel verschillende ruimtereizen er geweest zijn(d.w.z. erop geland zijn is voldoende).
-- En enkel indien er meer dan 1 reis geweest is.
-- Sorteer van voor naar achter

SELECT OBJECTNAAM, COUNT(DISTINCT REISNR)
FROM BEZOEKEN
WHERE OBJECTNAAM IN ('Maan', 'Mars')
GROUP BY 1
HAVING COUNT(DISTINCT REISNR) > 1
ORDER BY 1,2