-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/43/oefening/267

-- Geef per reis incrementeel de totale verblijfsduur volgens de volgorde waarin de hemelobjecten bezocht worden.
-- Geef ook de totale verblijfsduur van alle reizen om alles in perspectief te zettten.
-- Sorteer op reisnr, volgnr, objectnaam, verblijfsduur, de volgende kolommen.

SELECT REISNR,
	VOLGNR,
	OBJECTNAAM,
	VERBLIJFSDUUR,
	SUM(VERBLIJFSDUUR) OVER (PARTITION BY REISNR ORDER BY VOLGNR) AS INC_DUUR,
	SUM(VERBLIJFSDUUR) OVER () AS TOT_DUUR
FROM BEZOEKEN
ORDER BY 1,2,3,4;