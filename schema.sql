DROP TABLE IF EXISTS CARTE_TARIF;
DROP TABLE IF EXISTS BAR;
DROP TABLE IF EXISTS BIERE;
DROP TABLE IF EXISTS QUARTIER;

CREATE TABLE QUARTIER(
    id_quartier SERIAL PRIMARY KEY,
    nom_quartier VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE BAR(
    id_bar SERIAL PRIMARY KEY,
    nom_bar VARCHAR(100) UNIQUE NOT NULL,
    adresse VARCHAR(255) NOT NULL,
    numero_telephone VARCHAR(20),
    id_quartier INTEGER NOT NULL,

    FOREIGN KEY (id_quartier) REFERENCES QUARTIER(id_quartier)
);

CREATE TABLE BIERE(
    id_biere SERIAL PRIMARY KEY,
    nom_biere VARCHAR(100) NOT NULL,
    type_biere VARCHAR(50),
    degres_alcool NUMERIC(3, 1),
    categorie VARCHAR(50),

    CHECK (degres_alcool >= 0 AND degres_alcool <= 20)
);

CREATE TABLE CARTE_TARIF(
    id_bar INTEGER NOT NULL,
    id_biere INTEGER NOT NULL,
    contenance_cl INTEGER NOT NULL,
    prix_vente NUMERIC(5, 2) NOT NULL,

    PRIMARY KEY(id_bar,id_biere,contenance_cl),
    CHECK (prix_vente > 0),
    FOREIGN KEY (id_bar) REFERENCES BAR(id_bar) ON DELETE CASCADE,
    FOREIGN KEY (id_biere) REFERENCES BIERE(id_biere) ON DELETE RESTRICT
);