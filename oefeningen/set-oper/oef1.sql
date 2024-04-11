-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/22/oefening/169

-- Geef een overzicht van alle spelers, gevolgd door alle bestuursleden, gesorteerd op jaar van toetreding of beginjaar van hun functie en vervolgens op spelersnr.
-- Geen dubbels tonen.

SELECT S.SPELERSNR AS VELD1, S.NAAM AS VELD2, S.JAARTOE AS VELD3
FROM SPELERS S
UNION
SELECT B.SPELERSNR, B.FUNCTIE, EXTRACT(YEAR FROM B.BEGIN_DATUM)
FROM BESTUURSLEDEN B
ORDER BY 3,1