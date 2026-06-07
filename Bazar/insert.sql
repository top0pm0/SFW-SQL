INSERT INTO uzivatel (id_uzivatel, jmeno, prijmeni, heslo, email, telefon, datum_registrace) VALUES
(1, 'Jan', 'Novak', 'heslo123', 'jan.novak@email.cz', '777111222', '2026-01-10 10:00:00'),
(2, 'Petr', 'Svoboda', 'petr789', 'petr.swoboda@email.cz', '608333444', '2026-02-15 11:30:00'),
(3, 'Marie', 'Cerna', 'maruska1', 'marie.cerna@email.cz', '723555666', '2026-03-01 09:15:00'),
(4, 'Josef', 'Kucer', 'pepa2026', 'josef.kucera@email.cz', '775888999', '2026-03-20 16:45:00'),
(5, 'Anna', 'Dvorakova', 'andulka5', 'anna.dvorak@email.cz', NULL, '2026-04-05 14:20:00'),
(6, 'Tomas', 'Maly', 'tomik99', 'tomas.maly@email.cz', '602111333', '2026-04-18 19:10:00'),
(7, 'Lucie', 'Vesela', 'lucka123', 'lucie.vesela@email.cz', '739444555', '2026-05-01 08:00:00');

INSERT INTO kategorie (id_kategorie, nazev, popis) VALUES
(1, 'Elektro', 'Mobily, počítače, televize a další elektronika'),
(2, 'Obleceni', 'Pánské, dámské i dětské oblečení a obuv'),
(3, 'Auto-moto', 'Osobní auta, motorky a náhradní díly'),
(4, 'Dum a zahrada', 'Nábytek, nářadí a vybavení pro domácnost'),
(5, 'Sport', 'Kola, fitness, outdoorové vybavení'),
(6, 'Knihy a hudba', 'Učebnice, romány, LP desky a hudební nástroje'),
(7, 'Detske zbozi', 'Hračky, kočárky a autosedačky');

INSERT INTO inzerat (id_inzerat, id_uzivatel, id_kategorie, titulek, popis, cena, datum_pridani) VALUES
(1, 1, 1, 'iPhone 13 Pro 128GB', 'Prodám iPhone v top stavu, bez škrábanců. Kompletní balení.', 12500.00, '2026-05-10 12:00:00'),
(2, 2, 3, 'Škoda Octavia 1.9 TDI', 'Spolehlivý pracant, najeto 250 tisíc km, kosmetické vady, nová STK.', 45000.00, '2026-05-12 15:30:00'),
(3, 3, 2, 'Zimní bunda Nike XL', 'Téměř nenošená teplá zimní bunda, černá varva.', 1200.00, '2026-05-14 09:00:00'),
(4, 4, 4, 'Dřevěný jídelní stůl', 'Masivní stůl pro 6 lidí, drobné rýhy na povrchu, jinak stabilní.', 3500.00, '2026-05-15 18:20:00'),
(5, 5, 5, 'Horské kolo Author 29', 'Hliníkový rám, převody 3x9, odpružená vidlice, po servisu.', 8900.00, '2026-05-18 10:45:00'),
(6, 1, 1, 'PlayStation 4 Slim 500GB', 'Konzole + 2 ovladače a 3 hry (GTA V, FIFA, Zaklínač).', 4000.00, '2026-05-20 21:00:00'),
(7, 6, 6, 'Učebnice Matematika pro VŠ', 'Nepoškozená učebnice, vhodná pro přípravu na zkoušky.', 350.00, '2026-05-22 14:15:00');

INSERT INTO inzerat_fotka (id_inzerat, cislo_fotky, url, je_main) VALUES
(1, 1, 'https://bazar.cz/foto/iphone_predek.jpg', 1),
(1, 2, 'https://bazar.cz/foto/iphone_zadek.jpg', 0),
(2, 1, 'https://bazar.cz/foto/octavia_zepredu.jpg', 1),
(3, 1, 'https://bazar.cz/foto/bunda_nike.jpg', 1),
(4, 1, 'https://bazar.cz/foto/stul_masiv.jpg', 1),
(5, 1, 'https://bazar.cz/foto/kolo_author1.jpg', 1),
(6, 1, 'https://bazar.cz/foto/ps4_konzole.jpg', 1);

INSERT INTO chat (id_chat, id_inzerat, id_sender, chat_text, datum_odeslani) VALUES
(1, 1, 2, 'Dobrý den, měl bych zájem o ten iPhone. Je možná sleva?', '2026-05-10 13:00:00'),
(2, 1, 1, 'Dobrý den, při rychlém jednání slevím 500 Kč.', '2026-05-10 13:15:00'),
(3, 2, 4, 'Ahoj, kolik to žere oleje? Měl bych zájem o prohlídku.', '2026-05-12 17:00:00'),
(4, 3, 7, 'Můžete mi bundu změřit přes hrudník? Díky.', '2026-05-14 11:20:00'),
(5, 5, 1, 'Je to kolo ještě volné? Přijel bych hned zítra.', '2026-05-19 08:30:00'),
(6, 5, 5, 'Ano, kolo je volné, zítra dopoledne jsem doma.', '2026-05-19 09:00:00'),
(7, 6, 3, 'Vyměníte PS4 za Xbox One?', '2026-05-21 10:00:00');

INSERT INTO recenze (id_hodnoceni, id_autor, id_recenze, pocet_hvezzd, commentary, datum_recenze) VALUES
(1, 2, 1, 5, 'Super prodejce, iPhone dorazil v pořádku a rychle.', '2026-05-15 16:00:00'),
(2, 4, 2, 4, 'Auto odpovídá popisu, férové jednání u auta.', '2026-05-20 19:30:00'),
(3, 7, 3, 5, 'Bunda je krásná, skvělá domluva.', '2026-05-18 12:00:00'),
(4, 1, 5, 5, 'Kolo v super stavu, pán mi ho pomohl naložit do auta.', '2026-05-21 14:00:00'),
(5, 3, 6, 2, 'Slečna nereaguje na zprávy, obchod se neuskutečnil.', '2026-05-25 09:15:00'),
(6, 5, 4, 4, 'Stůl je fajn, jen komunikace byla trochu pomalejší.', '2026-05-22 17:45:00'),
(7, 1, 2, 5, 'Kupující poslal peníze předem na účet, vše bez problému.', '2026-05-26 11:00:00');

INSERT INTO kuryr_sluzba (id_kuryr, firma, cena_dopravy) VALUES
(1, 'Zasilkovna - Na pobocku', 79.00),
(2, 'Zasilkovna - Domu', 109.00),
(3, 'PPL Standard', 119.00),
(4, 'Balikovna', 69.00),
(5, 'Ceska posta - Balik do ruky', 139.00),
(6, 'DPD Classic', 125.00),
(7, 'Osobni prevzeti', 0.00);

INSERT INTO objednavka (id_objednavka, id_inzerat, id_kuryr, id_buyer, kod_sledovani, stav_objednavky) VALUES
(1, 1, 1, 2, 'ZAS987654321', 'Doruceno'),
(2, 3, 4, 7, 'BAL123456789', 'Doruceno'),
(3, 4, 3, 5, 'PPL111222333', 'Odeslano'),
(4, 5, 7, 1, NULL, 'Osobni odber'),
(5, 6, 2, 6, 'ZAS000111222', 'Zpracovano'),
(6, 7, 4, 2, 'BAL555666777', 'Odeslano'),
(7, 1, 3, 3, 'PPL999888777', 'Stornovano');