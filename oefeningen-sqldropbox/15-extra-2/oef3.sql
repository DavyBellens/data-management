-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/25/oefening/189

-- Geef de wedstrijden die door spelers zijn gespeeld die in Leuven, Rotterdam of Leiden wonen.
-- Sorteer van voor naar achter.
-- Geef alle (*) informatie van wedstrijden.

SELECT W.*
FROM WEDSTRIJDEN W
INNER JOIN SPELERS S ON W.SPELERSNR=S.SPELERSNR
WHERE S.PLAATS IN ('Leuven','Rotterdam','Leiden')
ORDER BY 1,2,3,4,5;