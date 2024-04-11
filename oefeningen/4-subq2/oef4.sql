-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/16/oefening/140

-- Geef alle spelers voor wie meer boetes zijn betaald dan dat ze wedstrijden hebben gespeeld.
-- Zorg dat spelers zonder wedstrijd ook getoond worden.
-- Sorteer van voor naar achter, oplopend.

SELECT S.NAAM, S.VOORLETTERS, S.GEB_DATUM
from SPELERS S
LEFT JOIN WEDSTRIJDEN W ON S.SPELERSNR=W.SPELERSNR
WHERE
(SELECT COUNT(1)
 FROM BOETES B
 WHERE B.SPELERSNR=S.SPELERSNR
) >
(SELECT COUNT(1)
 FROM WEDSTRIJDEN W
WHERE W.SPELERSNR=S.SPELERSNR
)
ORDER BY 1, 2, 3