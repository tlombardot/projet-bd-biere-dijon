erDiagram
    QUARTIER {
        INT id_quartier PK "Auto-increment"
        VARCHAR(50) nom_quartier "Unique, Not Null"
    }

    BAR {
        INT id_bar PK "Auto-increment"
        VARCHAR(100) nom_bar "Unique, Not Null"
        VARCHAR(255) adresse "Not Null"
        VARCHAR(20) numero_telephone "Format String (ex: +33...)"
        INT id_quartier FK "Not Null"
    }

    BIERE {
        INT id_biere PK "Auto-increment"
        VARCHAR(100) nom_biere "Not Null"
        VARCHAR(50) type_biere "Ex: IPA, Stout"
        NUMERIC(3_1) degres_alcool "Check entre 0 et 20"
        VARCHAR(50) categorie "Ex: Blonde, Brune"
    }

    CARTE_TARIF {
        INT id_bar FK, PK
        INT id_biere FK, PK
        INT contenance_cl PK "Ex: 25, 33, 50"
        NUMERIC(5_2) prix_vente "Check > 0"
    }

    QUARTIER ||--o{ BAR : SITUER
    BAR ||--o{ CARTE_TARIF : PROPOSER
    BIERE ||--o{ CARTE_TARIF : FIGURER