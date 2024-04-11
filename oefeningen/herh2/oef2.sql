-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/13/oefening/108

-- Bereken voor de klant wiens naam begint met G en eindigt met s hoeveel hij in totaal al besteed heeft aan reizen.

SELECT K.NAAM, SUM(R.PRIJS)
FROM KLANTEN K
INNER JOIN DEELNAMES D USING(KLANTNR)
INNER JOIN REIZEN R USING(REISNR)
WHERE K.NAAM LIKE('G%s')
GROUP BY K.NAAM