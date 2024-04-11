-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/13/oefening/118

-- Geef de diameter van de grootste, niet bezochte maan (satelliet van een planeet).

SELECT MAX(DIAMETER) AS GROOTSTEMAAN
FROM HEMELOBJECTEN
LEFT OUTER JOIN BEZOEKEN USING(OBJECTNAAM)
WHERE SATELLIETVAN != 'Zon' AND REISNR IS NULL