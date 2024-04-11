-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/12/oefening/99

-- Maak een lijst van alle mannelijke aanvoerders van een team en hun gespeelde wedstrijden.
-- Hierbij toon je voor deze spelers het spelersnummer en de volledige naam, voor het team de divisie en voor de wedstrijd het wedstrijdnummer.
-- Sorteer ook aflopend op het wedstrijdnummer.

SELECT S.SPELERSNR, S.NAAM, S.VOORLETTERS, T.DIVISIE, W.WEDSTRIJDNR
FROM WEDSTRIJDEN W
INNER JOIN TEAMS T ON W.SPELERSNR=T.SPELERSNR
INNER JOIN SPELERS S ON W.SPELERSNR = S.SPELERSNR
WHERE S.GESLACHT = 'M'
ORDER BY W.WEDSTRIJDNR DESC