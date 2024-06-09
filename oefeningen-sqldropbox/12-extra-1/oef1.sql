-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/23/oefening/178

-- Hoeveel sets zijn er in totaal gewonnen, hoeveel sets werden in totaal verloren en welk is het uiteindelijke saldo?

SELECT SUM(GEWONNEN) AS TOTAAL_GEWONNEN, SUM(VERLOREN) AS TOTAAL_VERLOREN, SUM(GEWONNEN)-SUM(VERLOREN) AS SALDO
FROM WEDSTRIJDEN