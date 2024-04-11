-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/13/oefening/121

-- Geef voor elk hemelobject de minimale en maximale gemiddelde afstand tot zijn zon (de centrale ster in een sterrenstelsel) als je weet dat de kolom 'afstand' de gemiddelde afstand bevat tot het hemelobject waarrond ze draaien. Met de grootte van het hemelobject hoef je geen rekening te houden.
-- Sorteer op minimale afstand en op objectnaam.
-- Tip: bekijk de functie COALESCE om met null-waardes rekening te houden.
-- Opm: berekende afstanden dienen altijd positief te zijn, je kan eventueel abs() functie gebruiken

SELECT H.OBJECTNAAM, CASE WHEN AFSTAND IS NULL THEN 0 ELSE AFSTAND
+ COALESCE((SELECT AFSTAND FROM HEMELOBJECTEN S WHERE S.OBJECTNAAM=H.SATELLIETVAN), 0)
END AS MAXIMALE_AFSTAND,
CASE WHEN AFSTAND IS NULL THEN 0 ELSE ABS(AFSTAND
- COALESCE((SELECT AFSTAND FROM HEMELOBJECTEN S WHERE S.OBJECTNAAM=H.SATELLIETVAN), 0))
END AS MINIMALE_AFSTAND
FROM HEMELOBJECTEN H
ORDER BY 3, 1