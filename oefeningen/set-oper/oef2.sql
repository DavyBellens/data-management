-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/22/oefening/170

-- Geef een lijst met alle spelersnrs, naam en het aantalwedstrijden ze gespeeld hebben en op een nieuwe lijn het aantal bestuursfuncties die ze hebben/hadden.
-- Spelers die zowel wedstrijden gespeeld hebben als bestuurslid zijn, komen dus twee keer voor in het resultaat.
-- Sorteer op spelersnr en aantal.
-- Geen dubbels tonen.

SELECT S.SPELERSNR AS NR, S.NAAM, COUNT(1) AS AANTAL
FROM SPELERS S
INNER JOIN WEDSTRIJDEN W ON W.SPELERSNR=S.SPELERSNR
GROUP BY S.SPELERSNR
HAVING COUNT(1) > 0
UNION
SELECT S.SPELERSNR, S.NAAM, COUNT(1)
FROM SPELERS S
INNER JOIN BESTUURSLEDEN B ON B.SPELERSNR=S.SPELERSNR
GROUP BY S.SPELERSNR
HAVING COUNT(1) > 0
ORDER BY 1, 3