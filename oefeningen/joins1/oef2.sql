-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/20/oefening/161

-- Geef van elke boete het betalingsnr, het boetebedrag en het percentage dat het bedrag uitmaakt van de som van alle bedragen.
-- Sorteer deze data op het betalingsnr.
-- Zorg dat er maar twee getallen na de komma getoond worden (rond af).
-- Sorteer van voor naar achter.

SELECT B.BETALINGSNR, B.BEDRAG, ROUND((B.BEDRAG/(SELECT SUM(T.BEDRAG) FROM BOETES T))*100, 2)
FROM BOETES B
ORDER BY 1,2,3