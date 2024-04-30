-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/14/oefening/125

-- Je kan per speler berekenen hoeveel boetes die speler heeft gehad en wat het totaalbedrag per speler is.
-- Pas nu deze querie aan zodat per verschillend aantal boetes wordt getoond hoe vaak dit aantal boetes voorkwam.Sorteer eerst op de eerste kolom en daarna op de tweede kolom.

SELECT B.COUNT AS A, COUNT(B.COUNT) FROM
(SELECT SPELERSNR, COUNT(SPELERSNR)
FROM BOETES B
GROUP BY SPELERSNR)
AS B
GROUP BY 1