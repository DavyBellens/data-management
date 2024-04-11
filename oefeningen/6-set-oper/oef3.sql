-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/22/oefening/172

-- Geef een overzicht van de boetebedragen, aantal gewonnen en verloren sets en aantal verschillende functies. Bekijk de output voor de manier hoe het getoond moet worden.
-- Sorteer van links naar rechts.
-- Tip: Het lijkt onlogisch, maar zelfs NULL krijgt een datatype en kan niet impliciet wijzigen van datatype.

SELECT SUM(B.BEDRAG) AS BOETEBEDRAG, NULL AS AANTALGEWONNEN, NULL AS AANTALVERLOREN, NULL AS AANTALFUNCTIES
FROM BOETES B
UNION
SELECT NULL, (SELECT SUM(GEWONNEN) FROM WEDSTRIJDEN)::TEXT, NULL, NULL
FROM WEDSTRIJDEN
UNION
SELECT NULL, NULL, (SELECT SUM(VERLOREN) FROM WEDSTRIJDEN)::TEXT, NULL
FROM WEDSTRIJDEN
UNION
SELECT NULL, NULL, NULL, (SELECT COUNT(DISTINCT B.FUNCTIE) FROM BESTUURSLEDEN B)::TEXT
FROM BESTUURSLEDEN
ORDER BY 1,2,3,4