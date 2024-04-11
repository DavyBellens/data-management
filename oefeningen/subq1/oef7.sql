-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/14/oefening/129

-- Geef een lijst van alle spelers (spelersnr en woonplaats) die met minstens twee in dezelfde plaats wonen.
-- Sorteer aflopend op woonplaats, daarna op spelersnr.

SELECT S.SPELERSNR, S.PLAATS
FROM SPELERS S
WHERE S.PLAATS IN (SELECT SP.PLAATS FROM SPELERS SP GROUP BY 1 HAVING COUNT(*)>=2)
ORDER BY 2 DESC, 1