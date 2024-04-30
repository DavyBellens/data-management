-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/21/oefening/166

-- Hoeveel kilometers heeft iedereen in totaal gevlogen tot nu toe en hoeveel hebben ze hier in totaal voor betaald.
-- Vermits we de posities van de planeten niet kennen, mag je de afstanden van de hemelobjecten direct gebruiken.
-- Geef het totaal gespendeerde bedrag, de afgelegde kilometers, de prijs per kilometer en datum van hun laatste vlucht van al hun persoonlijke reizen.
-- In het geval dat iemand niet op reis is geweest of geen kilometers gedaan heeft, toon je de boodschap 'veel geld voor niks of niet op reis geweest' in de kolom prijs_per_kilometer.
-- Sorteer van voor naar achter.
-- (tip fmm in deze oefening: effect analoog aan cartesisch product bij het het joinen van teveel tabellen, in een andere context, nl deze van tennis: je verbindt spelers, teams en boetes, er is 1 kapitein met 2 boetes; als je hier geen aandacht voor hebt, van hoeveel teams is deze dan schijnbaar kapitein als je niet oplet..)

SELECT DISTINCT KLANTNR, NAAM || ' ' || VNAAM AS NAAM,
	SUM(DISTINCT PRIJS) AS TOT_BEDRAG,
	SUM(AFSTAND) AS TOT_AFSTAND,
	CASE WHEN COUNT(REISNR) = 0 OR SUM(AFSTAND) = 0 THEN 'veel geld voor niks of niet op reis geweest'
	ELSE (SUM(DISTINCT PRIJS)/SUM(AFSTAND))::text
	END AS PRIJS_PER_KILOMETER,
	MAX(VERTREKDATUM) AS LAATSTE_REIS_DATUM
FROM KLANTEN K
LEFT JOIN DEELNAMES D USING(KLANTNR)
LEFT JOIN REIZEN R USING(REISNR)
LEFT JOIN BEZOEKEN B USING(REISNR)
LEFT JOIN HEMELOBJECTEN H ON B.OBJECTNAAM=H.OBJECTNAAM
GROUP BY KLANTNR
ORDER BY 1,2,3,4,5