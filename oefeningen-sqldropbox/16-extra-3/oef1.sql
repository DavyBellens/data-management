-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/26/oefening/190

-- Maak een lijst met de reizen, gevolgd door de hemelobjecten wiens objectnaam met een A begint.
-- Sorteer van voor naar achter.
-- TIP: Gebruik CAST AS CHAR(10) voor conversies het reisnr en vertrekdatum.

SELECT REISNR::CHAR(10) AS RNR_EN_NAAM, VERTREKDATUM::CHAR(10) AS DTM_EN_NAAM, REISDUUR, PRIJS
FROM REIZEN
UNION ALL
SELECT OBJECTNAAM::CHAR(10), SATELLIETVAN::CHAR(10), AFSTAND, DIAMETER
FROM HEMELOBJECTEN
WHERE OBJECTNAAM SIMILAR TO 'A%'
ORDER BY 1,2,3,4;