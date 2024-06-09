-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/26/oefening/191

-- Welke reizen hebben vijf hemelobjecten als reisdoel?
-- Hou er rekening mee dat een reis op verschillende keren hetzelfde hemelobject kan bezoeken, deze hoeven dus niet noodzakelijk verschillend te zijn.
-- Verduidelijking: hoe vaak is de reis uit de uitvoer bezocht?
-- Sorteer.

SELECT REISNR
FROM BEZOEKEN
GROUP BY 1
HAVING MAX(VOLGNR) >= 5
ORDER BY 1;