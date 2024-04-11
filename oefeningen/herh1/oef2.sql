-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/12/oefening/92

-- Geef per team de verloren wedstrijden. Zorg dat teams zonder verloren wedstrijden ook in de output verschijnen.
-- Duid per wedstrijd aan of het om een actief bestuurslid gaat.
-- Sorteer op divisie en wedstrijdnummer.

SELECT W.TEAMNR, DIVISIE, WEDSTRIJDNR, W.SPELERSNR,
CASE
	WHEN FUNCTIE IS NULL THEN '-'
	ELSE 'actief'
END AS BESTUURSLID
FROM TEAMS T LEFT OUTER JOIN WEDSTRIJDEN W ON T.TEAMNR = W.TEAMNR AND VERLOREN > GEWONNEN
LEFT OUTER JOIN BESTUURSLEDEN B ON W.SPELERSNR = B.SPELERSNR AND EIND_DATUM IS NULL
ORDER BY DIVISIE, WEDSTRIJDNR