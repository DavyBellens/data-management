-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/14/oefening/123

-- Geef voor alle spelers die geen penningmeester zijn of zijn geweest alle gewonnen wedstrijden, gesorteerd op wedstrijdnummer.

SELECT SPELERSNR, WEDSTRIJDNR
FROM SPELERS INNER JOIN WEDSTRIJDEN USING(SPELERSNR)
WHERE SPELERSNR NOT IN (SELECT SPELERSNR FROM BESTUURSLEDEN WHERE functie='Penningmeester')
AND GEWONNEN > VERLOREN
ORDER BY 2