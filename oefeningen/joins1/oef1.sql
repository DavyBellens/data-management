-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/20/oefening/160

-- Maak een lijst met alle spelers die ooit een boete gekregen hebben die hoger is dan 50 euro.
-- Geen dubbels.
-- Sorteer van voor naar achter.

SELECT NAAM, VOORLETTERS, PLAATS
FROM (SELECT DISTINCT SPELERSNR FROM BOETES WHERE BEDRAG > 50) as SPELERS_BOETES_50_PLUS
INNER JOIN SPELERS USING(SPELERSNR)
ORDER BY 1,2,3