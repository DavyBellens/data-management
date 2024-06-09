-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/41/oefening/247

-- Geef voor elke een klant een overzicht aan uitgaven.
-- Hoe? Geef voor elke klant een cumulatie overzicht van prijs van de reizen waar hij aan deelgenomen heeft.
-- De volgorde, waarin er wordt cumulatief wordt opgeteld, wordt bepaald door de vertrekdatum van de reis.
-- Sorteer van voor naar achter.
-- Tip: vergelijk deze uitvoer met de uitvoer van een query die een gesorteerd overzicht geeft van de klanten en hun deelnames aan reizen.

SELECT KLANTNR, REISNR, SUM(PRIJS) OVER (PARTITION BY KLANTNR ORDER BY VERTREKDATUM)
FROM REIZEN R
INNER JOIN DEELNAMES D USING(REISNR)
ORDER BY 1,2,3