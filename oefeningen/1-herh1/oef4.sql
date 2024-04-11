-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/12/oefening/96

-- Geef van elke speler (die wedstrijden gespeeld heeft en boetes gekregen heeft) wonend in Rijswijk het spelersnr, de naam, de lijst met boetebedragen en de lijst met teams waarvoor hij/zij een wedstrijd gespeeld heeft.
-- Geef het resultaat volgens oplopend spelersnr en boetebedrag.

SELECT S.SPELERSNR, S.NAAM, B.BEDRAG, W.TEAMNR
FROM SPELERS S
INNER JOIN WEDSTRIJDEN W USING(SPELERSNR)
INNER JOIN BOETES B USING(SPELERSNR)
WHERE PLAATS LIKE('Rijswijk')
ORDER BY S.SPELERSNR ASC, B.BEDRAG ASC