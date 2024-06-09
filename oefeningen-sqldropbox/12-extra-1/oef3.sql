-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/23

-- Geef een overzicht van de spelers die een boete hebben gekregen, indien deze boete meer van 90 euro is toon je informatie “pijnlijk” anders “te doen”.
-- Toen de volledige naam en de categorie van de bijhorende boete.
-- Sorteer van voor naar achter.

SELECT NAAM, VOORLETTERS, CASE WHEN BEDRAG > 90 THEN 'pijnlijk'
				ELSE 'te doen'
				END AS COMMENT
FROM SPELERS S INNER JOIN BOETES B USING(SPELERSNR)
ORDER BY 1,2,3