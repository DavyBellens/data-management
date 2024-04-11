-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/16/oefening/145

-- Geef de twee laagste bondnrs terug. (tip: dwz er zijn dus minder dan 2 bondsnr die kleiner zijn).
-- Sorteer op bondnr.
-- Zonder het gebruik van LIMIT.

SELECT BONDSNR
FROM SPELERS S
WHERE BONDSNR IN
(SELECT S.BONDSNR
 FROM SPELERS S
 WHERE 2 > (SELECT COUNT(1) FROM SPELERS SP WHERE SP.BONDSNR < S.BONDSNR)
)
ORDER BY 1