-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/24/oefening/182

-- Geef de naam en het spelersnummer van de spelers die ooit penningmeester geweest zijn van de club, die bovendien ooit een boete betaald hebben van meer dan 75 euro, en die ooit een wedstrijd gewonnen hebben met meer dan 2 sets verschil.
-- Sorteer van voor naar achter.
-- Probeer gelijk of beter te doen dan "Unique (cost=100.38..100.54 rows=21 width=68)".

SELECT S.NAAM, S.SPELERSNR
FROM SPELERS S
INNER JOIN
(
SELECT BS.SPELERSNR, BS.FUNCTIE
	FROM BESTUURSLEDEN BS
	INNER JOIN BOETES B ON B.SPELERSNR = BS.SPELERSNR
	WHERE BEDRAG >= 75
)
AS BS
ON BS.SPELERSNR = S.SPELERSNR
INNER JOIN
(
SELECT SPELERSNR
	FROM WEDSTRIJDEN W
	WHERE GEWONNEN-VERLOREN>=2
) AS W
ON W.SPELERSNR=S.SPELERSNR
WHERE BS.FUNCTIE LIKE 'Penningmeester      '
GROUP BY 1, 2