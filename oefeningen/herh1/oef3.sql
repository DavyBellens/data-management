-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/12/oefening/93

-- Geef een alfabetisch gesorteerde lijst van de namen van alle leden van de tennisvereniging die nog geen wedstrijden gespeeld hebben

SELECT S.NAAM
FROM SPELERS S
LEFT OUTER JOIN WEDSTRIJDEN W ON S.SPELERSNR = W.SPELERSNR
WHERE WEDSTRIJDNR IS NULL
ORDER BY NAAM ASC
