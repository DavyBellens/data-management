-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/27/oefening/196

-- Geef de klant die het meest op de maan is geweest (+het aantal).
-- Sorteer van voor naar achter.

SELECT K.KLANTNR, COUNT(OBJECTNAAM) --FILTER (WHERE OBJECTNAAM = 'Maan')
FROM KLANTEN K
INNER JOIN DEELNAMES D USING(KLANTNR)
INNER JOIN REIZEN R USING(REISNR)
INNER JOIN BEZOEKEN B ON R.REISNR=B.REISNR AND OBJECTNAAM='Maan'
GROUP BY 1
ORDER BY 1, 2 DESC FETCH FIRST 1 ROWS ONLY