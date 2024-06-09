-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/27/oefening/193

-- Maak een overzicht waarbij je voor de Maan en voor Mars aangeeft hoeveel ruimtereizen één of meer keer de betreffende bestemming bezocht hebben (d.w.z. erop geland zijn).
-- Sorteer van voor naar achter.

SELECT OBJECTNAAM, COUNT(DISTINCT REISNR)
FROM BEZOEKEN
WHERE OBJECTNAAM IN ('Maan', 'Mars')
GROUP BY 1
ORDER BY 1,2;