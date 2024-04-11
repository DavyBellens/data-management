-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/20/oefening/162

-- Geef chronologisch de bestuursleden die voorzitter zijn of geweest zijn (chronologisch op begindatum van het voorzitterschap) met vermelding van deze begindatum, alsook hun naam en huidig adres.
-- Als het vollegie adres niet gekend is dan moet “adres ongekend” weergegeven worden.
-- Sorteer van voor naar achter.

SELECT BEGIN_DATUM, S.NAAM,
CASE
	WHEN S.STRAAT IS NULL OR S.HUISNR IS NULL OR S.PLAATS IS NULL OR S.POSTCODE IS NULL
		THEN 'adres ongekend'
	ELSE S.STRAAT||' '||S.HUISNR||' '||S.PLAATS||' '||S.POSTCODE
END AS ADRES
FROM BESTUURSLEDEN B
INNER JOIN SPELERS S ON B.SPELERSNR = S.SPELERSNR
WHERE B.FUNCTIE='Voorzitter'