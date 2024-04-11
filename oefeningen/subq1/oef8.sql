-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/14/oefening/130

-- Geef de spelersgegevens van de speler(s) met het hoogste bedrag (voor één boete, niet het totaalbedrag). Als twee spelers een even hoge boete gehad hebben, moeten beide spelers getoond worden (LIMIT is dus geen optie).
-- Sorteer alfabetisch op naam en voorletters.

SELECT S.SPELERSNR, S.VOORLETTERS, S.NAAM
FROM SPELERS S
WHERE S.SPELERSNR IN (SELECT SPELERSNR FROM BOETES WHERE BEDRAG >= ALL(SELECT BEDRAG FROM BOETES))
ORDER BY 3, 2