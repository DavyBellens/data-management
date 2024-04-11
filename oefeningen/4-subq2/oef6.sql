-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/16/oefening/142

-- Geef voor elke speler die ooit een boete heeft betaald, de hoogste boete weer en hoelang het geleden is dat deze boete werd betaald. Sorteer van groot naar klein op bedrag en daarna omgekeerd op “leeftijd..” van de boete.

SELECT SPELERSNR, BEDRAG, AGE(DATUM)
FROM BOETES BS
WHERE BS.BETALINGSNR IN
(SELECT BETALINGSNR
FROM BOETES B
 WHERE BEDRAG>= ALL(SELECT BEDRAG FROM BOETES BTS WHERE BTS.SPELERSNR=B.SPELERSNR)
)
ORDER BY 2 DESC, 3 ASC