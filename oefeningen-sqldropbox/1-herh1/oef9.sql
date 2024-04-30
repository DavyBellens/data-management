-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/12/oefening/103

-- Geef per team de leeftijd van de aanvoerder (tip: postgresql heeft een AGE() functie) en het aantal verschillende spelers dat voor dit team gespeeld heeft.
-- Alleen teams waarvoor wedstrijden zijn gespeeld en die een aanvoerder hebben, moeten vermeld worden.
-- Sorteer op leeftijd en daarna op aantal verschillende spelers en daarna op teamnr.

SELECT DISTINCT T.TEAMNR,
(SELECT EXTRACT(YEAR FROM AGE(S.GEB_DATUM))||' jaar' FROM SPELERS S WHERE S.SPELERSNR=T.SPELERSNR) as leeftijd,
(SELECT COUNT(DISTINCT W.SPELERSNR) FROM WEDSTRIJDEN W WHERE W.TEAMNR=T.TEAMNR) AS aantalspelers
FROM TEAMS T
INNER JOIN wedstrijden ON wedstrijden.teamnr = T.teamnr
where T.SPELERSNR IS NOT NULL
ORDER BY 2,3,1