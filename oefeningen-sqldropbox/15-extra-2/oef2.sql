-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/25/oefening/188

-- Toon alle mogelijke combinaties van de letters 'x' en 'y'. Tip zie handboek, voorbeeld met cijfers. (Wat is een cartesisch product?). Sorteer

SELECT X.X || Y.Y
FROM (SELECT 'x' AS X UNION SELECT 'y') X
CROSS JOIN (SELECT 'x' AS Y UNION SELECT 'y') Y
ORDER BY 1;