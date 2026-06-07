CREATE TABLE uzivatel (
    id_uzivatel INT(11) NOT NULL AUTO_INCREMENT,
    jmeno VARCHAR(25) NOT NULL,
    prijmeni VARCHAR(25) NOT NULL,
    heslo VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefon VARCHAR(20) DEFAULT NULL,
    datum_registrace DATETIME NOT NULL,
    PRIMARY KEY (id_uzivatel),
    UNIQUE KEY email (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

CREATE TABLE kategorie (
    id_kategorie INT(11) NOT NULL AUTO_INCREMENT,
    nazev VARCHAR(50) NOT NULL,
    popis VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY (id_kategorie)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

CREATE TABLE kuryr_sluzba (
    id_kuryr INT(11) NOT NULL AUTO_INCREMENT,
    firma VARCHAR(50) NOT NULL,
    cena_dopravy DECIMAL(6,2) NOT NULL,
    PRIMARY KEY (id_kuryr)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- 2. Závislé tabulky (obsahují FOREIGN KEY neboli spoje)
CREATE TABLE inzerat (
    id_inzerat INT(11) NOT NULL AUTO_INCREMENT,
    id_uzivatel INT(11) NOT NULL,
    id_kategorie INT(11) NOT NULL,
    titulek VARCHAR(100) NOT NULL,
    popis TEXT DEFAULT NULL,
    cena DECIMAL(10,2) NOT NULL,
    datum_pridani DATETIME NOT NULL,
    PRIMARY KEY (id_inzerat),
    -- Tady jsou ty spoje:
    FOREIGN KEY (id_uzivatel) REFERENCES uzivatel(id_uzivatel) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_kategorie) REFERENCES kategorie(id_kategorie) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

CREATE TABLE inzerat_fotka (
    id_inzerat INT(11) NOT NULL,
    cislo_fotky INT(11) NOT NULL,
    url VARCHAR(255) NOT NULL,
    je_main TINYINT(1) NOT NULL DEFAULT 0,
    PRIMARY KEY (id_inzerat, cislo_fotky),
    -- Spojení fotky s konkrétním inzerátem (identifikační závislost):
    FOREIGN KEY (id_inzerat) REFERENCES inzerat(id_inzerat) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

CREATE TABLE chat (
    id_chat INT(11) NOT NULL AUTO_INCREMENT,
    id_inzerat INT(11) NOT NULL,
    id_sender INT(11) NOT NULL,
    chat_text TEXT NOT NULL,
    datum_odeslani DATETIME NOT NULL,
    PRIMARY KEY (id_chat),
    -- Spoje pro chat:
    FOREIGN KEY (id_inzerat) REFERENCES inzerat(id_inzerat) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_sender) REFERENCES uzivatel(id_uzivatel) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

CREATE TABLE recenze (
    id_hodnoceni INT(11) NOT NULL AUTO_INCREMENT,
    id_autor INT(11) NOT NULL,
    id_recenze INT(11) NOT NULL,
    pocet_hvezzd INT(11) NOT NULL,
    commentary TEXT NOT NULL,
    datum_recenze DATETIME NOT NULL,
    PRIMARY KEY (id_hodnoceni),
    -- Spoje pro recenze (autor i hodnocený jsou uživatelé):
    FOREIGN KEY (id_autor) REFERENCES uzivatel(id_uzivatel) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_recenze) REFERENCES uzivatel(id_uzivatel) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

CREATE TABLE objednavka (
    id_objednavka INT(11) NOT NULL AUTO_INCREMENT,
    id_inzerat INT(11) NOT NULL,
    id_kuryr INT(11) NOT NULL,
    id_buyer INT(11) NOT NULL,
    kod_sledovani VARCHAR(50) DEFAULT NULL,
    stav_objednavky VARCHAR(30) NOT NULL,
    PRIMARY KEY (id_objednavka),
    -- Spoje pro objednávku:
    FOREIGN KEY (id_inzerat) REFERENCES inzerat(id_inzerat) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_kuryr) REFERENCES kuryr_sluzba(id_kuryr) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (id_buyer) REFERENCES uzivatel(id_uzivatel) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;