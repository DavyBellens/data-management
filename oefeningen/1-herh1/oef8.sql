-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/12/oefening/101

-- Geef het gemiddeld boetebedrag per speler, afgerond op twee cijfers na de komma. spelers zonder boete moeten bovenaan staan met 'geen boetes'
-- Sorteer daarna op spelersnaam en vervolgens op gemiddeld boetebedrag.
-- Gebruik als datatype van de 2de kolom varchar(8) voor spelers die wel boetes hebben.

SELECT S.NAAM, CASE
WHEN ROUND(AVG(B.BEDRAG), 2) IS NULL THEN 'geen boetes'
ELSE ROUND(AVG(B.BEDRAG), 2)::VARCHAR(8)
END AS gemiddeld
FROM BOETES B
RIGHT JOIN SPELERS S
ON B.SPELERSNR = S.SPELERSNR
GROUP BY S.spelersnr
ORDER BY CASE
WHEN ROUND(AVG(B.BEDRAG), 2) IS NULL THEN 0
ELSE 1
END ASC, 1 ASC, 2 ASC