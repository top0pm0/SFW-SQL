-- 1. Výpis všech uživatelů registrovaných od února 2026 seřazených podle příjmení
SELECT * FROM uzivatel 
WHERE datum_registrace >= '2026-02-01 00:00:00' 
ORDER BY prijmeni ASC;

-- 2. Zobrazení 3 nejlevnějších inzerátů v kategorii 'Elektro' (id_kategorie = 1)
SELECT titulek, cena FROM inzerat 
WHERE id_kategorie = 1 AND cena > 0
ORDER BY cena ASC 
LIMIT 3;

-- 3. Hledání inzerátů, které mají v titulku slovo 'iPhone' a stojí méně než 15000 Kč
SELECT * FROM inzerat 
WHERE titulek LIKE '%iPhone%' AND cena < 15000.00;

-- 4. Výpis inzerátů s textem 'bunda' v popisu a cenou nad 500 Kč
SELECT titulek, cena FROM inzerat 
WHERE popis LIKE '%bunda%' AND cena > 500.00;

-- 5. Hledání uživatelů, kteří mají email obsahující slovo 'email' a zadali telefon
SELECT jmeno, prijmeni, email FROM uzivatel 
WHERE email LIKE '%email%' AND telefon IS NOT NULL;

-- 6. Propojení inzerátu se jménem prodejce a názvem kategorie
SELECT i.titulek, i.cena, u.jmeno, u.prijmeni, k.nazev AS kategorie
FROM inzerat i
JOIN uzivatel u ON i.id_uzivatel = u.id_uzivatel
JOIN kategorie k ON i.id_kategorie = k.id_kategorie
WHERE i.cena > 0;

-- 7. Výpis textů chatu spolu s titulkem inzerátu a jménem odesílatele
SELECT i.titulek, u.jmeno, c.chat_text, c.datum_odeslani
FROM chat c
JOIN inzerat i ON c.id_inzerat = i.id_inzerat
JOIN uzivatel u ON c.id_sender = u.id_uzivatel
WHERE c.datum_odeslani >= '2026-05-01 00:00:00';

-- 8. Zobrazení recenzí, jména autora a jména hodnoceného člověka
SELECT autor.jmeno AS od_koho, recenzovany.jmeno AS pro_koho, r.pocet_hvezzd, r.commentary
FROM recenze r
JOIN uzivatel autor ON r.id_autor = autor.id_uzivatel
JOIN uzivatel recenzovany ON r.id_recenze = recenzovany.id_uzivatel
WHERE r.pocet_hvezzd >= 4;

-- 9. Výpis objednávek dopravy s názvem kurýra a titulkem inzerátu
SELECT o.id_objednavka, i.titulek, k.firma, o.stav_objednavky
FROM objednavka o
JOIN inzerat i ON o.id_inzerat = i.id_inzerat
JOIN kuryr_sluzba k ON o.id_kuryr = k.id_kuryr
WHERE o.stav_objednavky = 'Odeslano';

-- 10. Zobrazení inzerátů a jejich fotografií (spojení s identifikační závislostí)
SELECT i.titulek, f.cislo_fotky, f.url
FROM inzerat_fotka f
JOIN inzerat i ON f.id_inzerat = i.id_inzerat
WHERE f.je_main = 1;

-- 11. Celkový přehled: Kdo co koupil, za kolik a jak se to posílá
SELECT u.jmeno, u.prijmeni, i.titulek, i.cena, o.kod_sledovani
FROM objednavka o
JOIN inzerat i ON o.id_inzerat = i.id_inzerat
JOIN uzivatel u ON o.id_buyer = u.id_uzivatel
WHERE o.kod_sledovani IS NOT NULL;

-- 12. Výpis všech uživatelů a k nim přiřazených inzerátů (ukáže i ty lidi, co ještě nic neprodávají)
SELECT u.jmeno, u.prijmeni, i.titulek
FROM uzivatel u
LEFT JOIN inzerat i ON u.id_uzivatel = i.id_uzivatel
WHERE u.id_uzivatel > 0;

-- 13. Výpis všech inzerátů a k nim přiřazených objednávek (ukáže i věci, co si ještě nikdo nekoupil)
SELECT i.titulek, o.id_objednavka, o.stav_objednavky
FROM inzerat i
LEFT JOIN objednavka o ON i.id_inzerat = o.id_inzerat
WHERE i.cena < 50000.00
LIMIT 5;

-- 14. Spočítá průměrnou cenu inzerátů v každé kategorii, kde je průměrná cena vyšší než 1000 Kč
SELECT id_kategorie, AVG(cena) AS prumerne_penez_za_inzerat
FROM inzerat
GROUP BY id_kategorie
HAVING prumerne_penez_za_inzerat > 1000.00;

-- 15. Výpočet ceny inzerátů s přirážkou 21% DPH pro zobrazení koncové ceny
SELECT titulek, cena AS bez_DPH, (cena * 1.21) AS s_DPH 
FROM inzerat;