-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/13/oefening/116

-- Geef een lijst met alle planeten en per planeet zijn satellieten.
-- Sorteer op planeet en daarna op satelliet.

SELECT H.OBJECTNAAM as PLANEET, S.OBJECTNAAM as MAAN
FROM HEMELOBJECTEN H
LEFT JOIN HEMELOBJECTEN S ON H.OBJECTNAAM=S.SATELLIETVAN
WHERE H.SATELLIETVAN = 'Zon'
GROUP BY 1, 2
ORDER BY 1, 2