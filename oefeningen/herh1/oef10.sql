-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/12/oefening/89

-- Geef per team het hoogste wedstrijdnummer van een wedstrijd, gespeeld door een bestuurslid (actief en niet meer actief) die geen boete heeft gekregen.
-- Sorteer op teamnr.

SELECT w.teamnr, MAX(W.WEDSTRIJDNR) as laatstewedstrijd
FROM WEDSTRIJDEN W
INNER JOIN SPELERS S ON W.SPELERSNR=S.SPELERSNR
INNER JOIN BESTUURSLEDEN B ON S.SPELERSNR=B.SPELERSNR
LEFT OUTER JOIN BOETES BS ON S.SPELERSNR=BS.SPELERSNR
WHERE BS.BEDRAG IS NULL
GROUP BY 1