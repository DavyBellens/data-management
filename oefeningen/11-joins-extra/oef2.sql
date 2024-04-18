-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/21/oefening/167

-- Geef de volledige frequentietabel voor de diameters van de hemelobjecten (frequentie: hoeveel ojecten zijn er met de gegeven diameter, cumulatieve Frequentie, relatieve frequentie, Relatieve cumulatieve frequentie).
-- Let op de datatypes en de precisie, gebruik CAST, rond niet af. (NUMERIC(5,2))
-- Sorteer op diameter en verder op de volgende kolommen.

SELECT H.DIAMETER,
	COUNT(DISTINCT H.OBJECTNAAM) AS F,
	COUNT(DISTINCT K.OBJECTNAAM) AS CF,
	(COUNT(DISTINCT H.OBJECTNAAM)::NUMERIC(5,2)/T.TOT*100)::NUMERIC(5,2) AS RF,
	(COUNT(DISTINCT K.OBJECTNAAM)::NUMERIC(5,2)/T.TOT*100)::NUMERIC(5,2) AS CRF
FROM HEMELOBJECTEN H
INNER JOIN HEMELOBJECTEN K ON K.DIAMETER<=H.DIAMETER
INNER JOIN
	(
		SELECT H.OBJECTNAAM, COUNT(1)::NUMERIC(5,2) AS TOT
		FROM HEMELOBJECTEN H
		INNER JOIN HEMELOBJECTEN O ON O.DIAMETER<=O.DIAMETER
		GROUP BY 1
	) AS T ON H.OBJECTNAAM = T.OBJECTNAAM
GROUP BY 1, T.TOT
ORDER BY 1,2,3,4,5