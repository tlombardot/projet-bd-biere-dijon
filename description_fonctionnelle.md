## 📝 Description Fonctionnelle du Projet "Carte des bars à Dijon"

Ce projet vise à modéliser et à construire une base de données relationnelle (PostgreSQL) permettant de répertorier les bars de Dijon, les bières qu'ils proposent, et le prix de vente de chaque bière dans chaque établissement **selon le volume servi**. L'objectif est de pouvoir effectuer des analyses comparatives sur les prix et la distribution géographique.

---

### 1. Entités Principales

Nous avons identifié quatre entités distinctes pour organiser les informations :

* **Quartier :** Représente les divisions géographiques de Dijon.
    * *Attributs :* Identifiant unique (**`id_quartier`**), Nom du quartier (**`nom_quartier`**).
* **Bar :** L'établissement où la bière est vendue.
    * *Attributs :* Identifiant unique (**`id_bar`**), Nom du bar (**`nom_bar`**), Adresse (**`adresse`**), Numéro de téléphone (**`numero_telephone`**).
* **Bière :** Le produit proposé.
    * *Attributs :* Identifiant unique (**`id_biere`**), Nom commercial (**`nom_bière`**), Type (e.g., IPA, Lager, Stout), Degrés d'alcool (**`degres_alcool`**), Catégorie (e.g., Blonde, Ambrée, Brune).
* **Carte_Tarif (Entité-Association) :** L'information spécifique reliant un bar, une bière **et la contenance**.
    * *Attributs :* La contenance servie en centilitres (**`contenance_cl`**) et le prix de vente réel (**`prix_vente`**).

### 2. Relations et Cardinalités

Deux relations principales structurent la base de données :

#### Relation : Quartier - Bar
* **Description :** Associe un bar à son emplacement géographique.
* **Cardinalités :**
    * Un `Bar` est situé dans **un et un seul** `Quartier` (`1,1`).
    * Un `Quartier` peut contenir **plusieurs** `Bars` (`0,N`).

#### Relation : Bar - Bière (via Carte_Tarif)
* **Description :** Relation matérialisée par l'entité d'association `Carte_Tarif`. Elle est basée sur une relation plusieurs-à-plusieurs (`N,N`) **dépendante du volume**.
* **Cardinalités :**
    * Un `Bar` peut vendre **plusieurs** `Bières`.
    * Une `Bière` peut être vendue dans **plusieurs** `Bars`.
* **Conséquence :** La table `Carte_Tarif` possède une **clé primaire composite de trois colonnes** : (**`id_bar`**, **`id_biere`**, **`contenance_cl`**) pour garantir qu'un seul prix existe pour une bière donnée dans un volume donné au sein d'un bar donné.

### 3. Règles Métier et Contraintes

1.  **Localisation Obligatoire :** Chaque `Bar` doit obligatoirement être associé à un `Quartier` existant (contrainte de clé étrangère **`NOT NULL`**).
2.  **Unicité des Noms :** Le nom d'un `Quartier` doit être unique. Le nom d'un `Bar` doit être unique.
3.  **Unicité de la Bière :** Une `Bière` est définie de manière unique par la combinaison de son `nom_bière`, son `type_bière` et ses `degrés_alcool` (contrainte **`UNIQUE`** composite).
4.  **Validité des Tarifs :** Le prix est unique pour un triplet (Bar, Bière, Contenance). Le **`prix_vente`** doit être strictement positif (contrainte **`CHECK`**).
5.  **Domaine Alcoolique :** Les **`degres_alcool`** doivent être cohérents avec la production de bière (e.g., entre 0.0% et 20.0%) (contrainte **`CHECK`**).