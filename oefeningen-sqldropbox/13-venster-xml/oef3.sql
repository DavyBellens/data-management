-- https://sqldropbox.ucll.be/sqldropbox/oefeningreeks/maak/41/oefening/249

-- Toon in xmlformaat de objectnamen, afstand en diameter voor objecten die rond Neptunus draaien.
-- Geef als eerste kolom de commentaar maan.
-- Sorteer van voor naar achter.
-- Tip: XML is gebaseerd op het datatype text.

-- Verwacht uitvoer:
-- xmlcomment | xmlforest
-- -------------+----------------------------------------
-- <!--maan--> | <objectnaam>Despina</objectnaam><afstand>52.500</afstand><diameter>180</diameter>
-- <!--maan--> | <objectnaam>Galathea</objectnaam><afstand>62.000</afstand><diameter>150</diameter>
-- <!--maan--> | <objectnaam>Larissa</objectnaam><afstand>73.600</afstand><diameter>192</diameter>
-- <!--maan--> | <objectnaam>Naiad</objectnaam><afstand>48.000</afstand><diameter>54</diameter>
-- <!--maan--> | <objectnaam>NereÃ¯de</objectnaam><afstand>5517.000</afstand><diameter>240</diameter>
-- <!--maan--> | <objectnaam>Proteus</objectnaam><afstand>117.600</afstand><diameter>416</diameter>
-- <!--maan--> | <objectnaam>Thalassa</objectnaam><afstand>50.000</afstand><diameter>80</diameter>
-- <!--maan--> | <objectnaam>Triton</objectnaam><afstand>354.800</afstand><diameter>2705</diameter>

SELECT XMLCOMMENT('maan')::text, XMLFOREST(OBJECTNAAM, AFSTAND, DIAMETER)::text
FROM HEMELOBJECTEN H
WHERE SATELLIETVAN='Neptunus'
ORDER BY 1, 2;