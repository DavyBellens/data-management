-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/17/oefening/146

-- Geef de diameter van het grootste hemellichaam dat bezocht is op de vroegste reis waar klantnr 126 niet op meegegaan is.

SELECT (SELECT MAX(DIAMETER) AS GROOTSTE FROM BEZOEKEN B INNER JOIN HEMELOBJECTEN H USING(OBJECTNAAM) WHERE B.REISNR=R.REISNR)
FROM REIZEN R
INNER JOIN DEELNAMES D ON KLANTNR!=126
GROUP BY R.REISNR
HAVING R.VERTREKDATUM <= ALL(
	SELECT R.VERTREKDATUM
FROM REIZEN R INNER JOIN DEELNAMES D ON KLANTNR!=126)