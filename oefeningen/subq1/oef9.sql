-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/14/oefening/131

-- We willen een statistiek van hoeveel wedstrijden de spelers winnen.
-- Geef een lijst met aantal gewonnen wedstrijden en het aantal spelers dat dit aantal wedstrijden gewonnen heeft.
-- Dus bv als er vier spelers zijn die elk drie wedstrijden hebben gewonnen, dan is de output: aantal_gewonnen: 3, aantal_spelers: 4. Dit graag voor alle aantallen gewonnen wedstrijden en alle spelers.
-- Sorteer op aantal gewonnen wedstrijden.

SELECT *, COUNT(*) AS AANTAL_SPELERS FROM (SELECT COUNT(*) AS AANTAL_GEWONNEN FROM WEDSTRIJDEN
WHERE GEWONNEN>VERLOREN
GROUP BY SPELERSNR) AS AANTAL
GROUP BY AANTAL.AANTAL_GEWONNEN
ORDER BY AANTAL.AANTAL_GEWONNEN