-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/22/oefening/177

-- Korte opgave:

-- Geef alle spelers.
-- Toon het aantal boetes als deze speler voor 1963 geboren is (Boetes: x)
-- Toon de tekst 'Geen boetes' als deze speler geen boetes heeft.
-- Voor bestuursleden wordt ook hun laatst gestarte functie getoond.
-- (Het kan zijn dat spelers 2 keer getoond worden, namelijk oude bestuursleden)
-- Voor spelers waarvoor geen infodata is, wordt de tekst 'Gewone speler' getoond ipv null.
-- Gebruik de to_char functie met 'DD/MM/YYYY' voor het tonen van de geboortedatum
-- Sorteer op naam, voorletters, data.

-- Lange opgave:
-- (Een variant op een andere opgave 176)
-- We zijn wat betreft boetes alleen geïnteresseerd als de speler geboren is voor 1963.
-- Verdere uitleg:
-- Geef een lijst van ALLE spelers die bestuurslid geweest zijn en/of een boete hebben gehad, (wat betreft boete: alleen als ze geboren zijn voor 1963) en hun laatst begonnen bestuursfunctie.
-- Zorg ervoor dat spelers die een bestuursfunctie hebben/hadden, geboren zijn voor 1963, maar geen boete hebben gekregen, toch in het resultaat voorkomen met een extra lijn 'Geen boetes'.
-- Zorg ervoor dat bestuursleden, onafhankelijk van het geboortejaar,
-- met hun laatst gestarte functie getoond worden
-- Spelers die geen bestuurslid zijn geweest, maar een boete hebben gehad, komen één keer voor in het resultaat met hun aantal boetes.
-- Spelers die geen bestuurslid zijn geweest en geboren zijn na 1962, moeten ook één keer in het resultaat voorkomen met als data 'Gewone speler' (het kan zelfs zijn dat geen boete gekregen hebben, alle spelers moeten sowieso getoond worden).
-- Sorteer op naam, voorletters en data (let op de hoofdletters in het veld data).
-- (ps: in deze oefening zit bijna alles wat je de voorbije twee jaar gezien hebt van SQL)
-- (de vorige opgave 176 was:
-- Geef een lijst van alle spelers die bestuurslid geweest zijn (of nu nog zijn) en/of een boete hebben gehad hun aantal boetes en hun laatst begonnen bestuursfunctie. Zorg dat spelers die boetes gehad hebben én bestuurder zijn (geweest) twee keer voorkomen in de kolom 'data' twee verschillende waardes.
-- Sorteer op naam, voorletters en data.
-- Gebruik de to_char functie voor het formaat van de geboortedatum (bv 12/12/1900).)

SELECT NAAM, VOORLETTERS,TO_CHAR(S.GEB_DATUM, 'DD/MM/YYYY') AS GEBOORTEDATUM,
	CASE
		WHEN BEDRAG IS NULL THEN 'Geen boetes'
		ELSE 'Boetes: ' || COUNT(B.SPELERSNR)
	END AS DATA
FROM SPELERS S
LEFT OUTER JOIN BOETES B USING(SPELERSNR)
WHERE EXTRACT(YEAR FROM GEB_DATUM) < 1963
GROUP BY S.NAAM, S.VOORLETTERS, S.GEB_DATUM, BEDRAG
UNION
SELECT S.NAAM, S.VOORLETTERS,
       TO_CHAR(S.GEB_DATUM, 'DD/MM/YYYY') AS GEBOORTEDATUM,
       FUNCTIE
FROM BESTUURSLEDEN
INNER JOIN (
	SELECT SPELERSNR, MAX(BEGIN_DATUM) AS LAST_DATE
	FROM BESTUURSLEDEN
	GROUP BY SPELERSNR
) AS LAST_FUNCTION USING(SPELERSNR)
INNER JOIN SPELERS S USING(SPELERSNR)
WHERE BEGIN_DATUM = LAST_DATE
UNION
SELECT NAAM, VOORLETTERS, TO_CHAR(GEB_DATUM, 'DD/MM/YYYY') AS GEBOORTEDATUM, 'Gewone speler'
FROM SPELERS
LEFT OUTER JOIN BESTUURSLEDEN B USING(SPELERSNR)
WHERE EXTRACT(YEAR FROM GEB_DATUM) >= 1963 AND FUNCTIE IS NULL
ORDER BY 1,2,4