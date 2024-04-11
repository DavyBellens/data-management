-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/12/oefening/100

-- Geef voor alle vrouwelijke spelers die in Den Haag, Zoetermeer of Leiden wonen het spelersnummer, hun woonplaats en een lijst van de teams waarvoor ze ooit gespeeld hebben, als ze ooit een wedstrijd gespeeld hebben.
-- Sorteer volgens 1,2,3

SELECT S.SPELERSNR, S.PLAATS, W.TEAMNR
FROM SPELERS S
LEFT joiN WEDSTRIJDEN W ON W.SPELERSNR = S.SPELERSNR
WHERE S.GESLACHT = 'V' and S.PLAATS like('Den Haag') OR S.PLAATS like('Zoetermeer') OR S.PLAATS LIKE('Leiden')
ORDER BY 1,2,3