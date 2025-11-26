# 🔍 Requêtes Analytiques (SQL)

Voici les 5 requêtes demandées pour analyser la base de données des bars de Dijon.

## 1. Prix moyen de la Pinte (50cl) par quartier
*Nous filtrons sur la contenance 50cl pour avoir une comparaison honnête entre les quartiers.*

```sql
SELECT
    Q.nom_quartier,
    ROUND(AVG(CT.prix_vente), 2) AS prix_moyen_pinte
FROM
    QUARTIER Q
JOIN
    BAR B ON Q.id_quartier = B.id_quartier
JOIN
    CARTE_TARIF CT ON B.id_bar = CT.id_bar
WHERE
    CT.contenance_cl = 50
GROUP BY
    Q.nom_quartier
ORDER BY
    prix_moyen_pinte DESC;
```

## 2. Bar vendant l'IPA la moins chère (Format Pinte)
*On cherche les IPA en 50cl, on les trie du moins cher au plus cher, et on prend le premier résultat.*

```sql
SELECT
    B.nom_bar,
    B.adresse,
    CT.prix_vente
FROM
    BAR B
JOIN
    CARTE_TARIF CT ON B.id_bar = CT.id_bar
JOIN
    BIERE Bi ON CT.id_biere = Bi.id_biere
WHERE
    Bi.type_biere = 'IPA'
    AND CT.contenance_cl = 50
ORDER BY
    CT.prix_vente ASC
LIMIT 1;
```

## 3. Bières vendues dans au moins 5 bars différents
*On utilise DISTINCT car une même bière peut apparaître deux fois dans le même bar (en 25cl et en 50cl), mais cela ne compte que pour un seul bar.*

```sql
SELECT
    Bi.nom_biere,
    Bi.type_biere,
    COUNT(DISTINCT CT.id_bar) AS nombre_bars_vendeurs
FROM
    BIERE Bi
JOIN
    CARTE_TARIF CT ON Bi.id_biere = CT.id_biere
GROUP BY
    Bi.id_biere, Bi.nom_biere, Bi.type_biere
HAVING
    COUNT(DISTINCT CT.id_bar) >= 5
ORDER BY
    nombre_bars_vendeurs DESC;
```

## 4. Bars sans aucune consommation à moins de 6€
*On sélectionne les bars qui ne sont PAS dans la liste de ceux ayant des prix bas.*

```sql
SELECT
    B.nom_bar,
    Q.nom_quartier
FROM
    BAR B
JOIN
    QUARTIER Q ON B.id_quartier = Q.id_quartier
WHERE
    B.id_bar NOT IN (
        SELECT id_bar
        FROM CARTE_TARIF
        WHERE prix_vente < 6.00
    )
ORDER BY
    B.nom_bar;
```

## 5. Top Bar avec le panier moyen le plus élevé
*On calcule la moyenne des prix de la carte pour chaque bar, on trie du plus grand au plus petit et on garde le premier.*

```sql
SELECT
    B.nom_bar,
    ROUND(AVG(CT.prix_vente), 2) AS panier_moyen_carte
FROM
    BAR B
JOIN
    CARTE_TARIF CT ON B.id_bar = CT.id_bar
GROUP BY
    B.nom_bar
ORDER BY
    panier_moyen_carte DESC
LIMIT 1;
```