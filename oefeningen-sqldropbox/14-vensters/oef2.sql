-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/43/oefening/268

-- Hoe lang was het geleden dat er nog een reis vertrokken was?
-- Geef daarnaast de totale reisduur per jaar incrementeel in de tijd (hier genaamd jaar_duur). (Dus elk jaar begint aan een nieuwe som)
-- Sorteer op reisnr en de andere kolommen.

SELECT
    REISNR,
    LAG(REISNR) OVER (ORDER BY VERTREKDATUM) AS VORIG_REISNR,
    VERTREKDATUM,
    CASE
        WHEN LAG(VERTREKDATUM) OVER (ORDER BY VERTREKDATUM) IS NOT NULL
        THEN VERTREKDATUM - LAG(VERTREKDATUM) OVER (ORDER BY VERTREKDATUM)
        ELSE NULL
    END AS TUSSEN_TIJD,
    REISDUUR,
    EXTRACT(YEAR FROM VERTREKDATUM) AS JAAR,
    SUM(REISDUUR) OVER (PARTITION BY EXTRACT(YEAR FROM VERTREKDATUM) ORDER BY VERTREKDATUM) AS JAAR_DUUR
FROM
    REIZEN
ORDER BY 1,3;