-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/44/oefening/270

-- We willen telkens het aantal reizen en de totale prijs van de volgende situaties.
-- Voor elke maand van vertrek, voor elk tiental van de reisduur, voor de combinatie van maand van vertrek en tiental van de reisduur en het het totale plaatje.
-- Sorteer van voor naar achter.

SELECT DATE_PART('MONTH', VERTREKDATUM), ROUND(REISDUUR/10), COUNT(1), SUM(PRIJS)
FROM REIZEN
GROUP BY CUBE (1, 2)
ORDER BY 1,2,3,4