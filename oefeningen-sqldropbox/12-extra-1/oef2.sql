-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/23/oefening/179

-- Geef een totaal overzicht van alle spelers, hun boetes en de functies die ooit vervuld hebben.
-- Elke speler moet getoond worden, als ie een eventuele boete heeft gekregen en/of een eventuele functie als bestuurslid heeft gehad dan moet dit ook getoond worden.
-- Toon de volledige naam, het bedrag en datum van de eventuele boete en de eventuele bestuursfuncties.
-- Sorteer van voor naar achter.

SELECT NAAM, VOORLETTERS, FUNCTIE, BEDRAG, DATUM
FROM SPELERS S
LEFT JOIN BESTUURSLEDEN BS ON S.SPELERSNR=BS.SPELERSNR
LEFT JOIN BOETES B ON B.SPELERSNR=S.SPELERSNR
ORDER BY 1,2,3,4,5