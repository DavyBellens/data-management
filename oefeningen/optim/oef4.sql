-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/24/oefening/184

-- Je kan per speler berekenen hoeveel boetes die speler heeft gehad en wat het totaalbedrag per speler is. Pas nu deze querie aan zodat per verschillend aantal boetes wordt getoond hoe vaak dit aantal boetes voorkwam.
-- Sorteer van voor naar achter.
-- Probeer gelijk of beter te doen dan "Sort (cost=46.39..46.89 rows=200 width=8)".

SELECT SB.A, COUNT(1)
FROM
(SELECT SPELERSNR, COUNT(1) AS A
FROM BOETES B
GROUP BY 1) AS SB
GROUP BY 1
ORDER BY 1, 2