
-- 1. Insertion des QUARTIERS (10)
INSERT INTO QUARTIER (nom_quartier) VALUES
('Centre-Ville'),
('Darcy'),
('République'),
('Montchapet'),
('Les Grésilles'),
('Toison d''Or'),
('Université'),
('Fontaine d''Ouche'),
('Port du Canal'),
('Bourroches');

-- 2. Insertion des BIERES (40)
INSERT INTO BIERE (nom_biere, type_biere, degres_alcool, categorie) VALUES
-- Classiques & Lagers
('Heineken', 'Lager', 5.0, 'Blonde'),
('1664', 'Lager', 5.5, 'Blonde'),
('Kronenbourg', 'Lager', 4.2, 'Blonde'),
('Stella Artois', 'Pilsner', 5.2, 'Blonde'),
('Budweiser', 'Lager', 5.0, 'Blonde'),
('Pelforth Blonde', 'Lager', 5.8, 'Blonde'),
('Pelforth Brune', 'Brown Ale', 6.5, 'Brune'),
('Carlsberg', 'Pilsner', 5.0, 'Blonde'),
('San Miguel', 'Lager', 5.4, 'Blonde'),
('Corona', 'Lager', 4.5, 'Blonde'),
-- Belges & Abbaye
('Leffe Blonde', 'Abbaye', 6.6, 'Blonde'),
('Leffe Ruby', 'Abbaye', 5.0, 'Fruitée'),
('Grimbergen Double', 'Abbaye', 6.5, 'Ambrée'),
('Affligem', 'Abbaye', 6.7, 'Blonde'),
('Tripel Karmeliet', 'Tripel', 8.4, 'Blonde'),
('Kwak', 'Ale', 8.4, 'Ambrée'),
('Chouffe', 'Strong Ale', 8.0, 'Blonde'),
('Cuvée des Trolls', 'Strong Ale', 7.0, 'Blonde'),
('Delirium Tremens', 'Strong Ale', 8.5, 'Blonde'),
('Duvel', 'Strong Ale', 8.5, 'Blonde'),
('Vedett Extra White', 'Blanche', 4.7, 'Blanche'),
('Hoegaarden', 'Blanche', 4.9, 'Blanche'),
('Paix Dieu', 'Tripel', 10.0, 'Blonde'),
('Gulden Draak', 'Dark Tripel', 10.5, 'Brune'),
-- Trappistes
('Chimay Bleue', 'Trappiste', 9.0, 'Brune'),
('Chimay Rouge', 'Trappiste', 7.0, 'Ambrée'),
('Orval', 'Trappiste', 6.2, 'Ambrée'),
('Rochefort 10', 'Trappiste', 11.3, 'Brune'),
('Westmalle Tripel', 'Trappiste', 9.5, 'Blonde'),
-- Craft & IPAs
('Punk IPA', 'IPA', 5.6, 'Blonde'),
('Elvis Juice', 'IPA', 6.5, 'Fruitée'),
('Lagunitas IPA', 'IPA', 6.2, 'Blonde'),
('Brooklyn Lager', 'Lager', 5.2, 'Ambrée'),
('Goose Island IPA', 'IPA', 5.9, 'Blonde'),
('Ninkasi Noire', 'Porter', 6.6, 'Noire'),
('Guinness Draught', 'Stout', 4.2, 'Noire'),
('Kilkenny', 'Red Ale', 4.3, 'Rousse'),
('La Bête', 'Amber Ale', 8.0, 'Ambrée'),
('Rince Cochon', 'Strong Ale', 8.5, 'Blonde'),
('Desperados', 'Aromatisee', 5.9, 'Blonde');

-- 3. Insertion des BARS (20)
INSERT INTO BAR (nom_bar, adresse, numero_telephone, id_quartier) VALUES
('L''Antre II Mondes', '21 Rue d''Ahuy', '0380123456', 1),
('Le Brighton', '33 Rue Verrerie', '0380234567', 1),
('Au Fût et à Mesure', '10 Rue Quentin', NULL, 1),
('Les Berthom', '32 Rue Monge', '0380345678', 1),
('Le Flannery''s', '4 Place Saint-Bénigne', '0380456789', 2),
('Le Blue Dog', 'Place Emile Zola', NULL, 8),
('Le Café de l''Industrie', '15 Rue des Godrans', '0380567890', 2),
('Le Delirium', 'Place de la République', NULL, 3),
('Bar de l''Université', 'Boulevard Gabriel', '0380678901', 7),
('Le Campus', 'Rue du Recteur Marcel Bouchard', NULL, 7),
('Le Trinidad', 'Place du Théâtre', '0380789012', 1),
('Le Byron Bay', '106 Rue Berbisey', NULL, 1),
('Chez Tonton', '44 Rue Vannerie', '0380890123', 6),
('Le Smart', '8 Rue Claus Sluter', NULL, 3),
('Le 911', 'Chez toi ou chez moi', NULL, 4),
('La Vapeur', '42 Avenue de Stalingrad', '0380901234', 5),
('Péniche Cancale', 'Port du Canal', NULL, 9),
('Le Kilkenny', '1 Rue Auguste Comte', '0380012345', 1),
('L''Univers', '47 Rue Jeannin', NULL, 1),
('Bistrot des Halles', '10 Rue Odebert', '0380112233', 1);

-- 4. Insertion des PRIX (CARTE_TARIF) (Approx 160 lignes)
INSERT INTO CARTE_TARIF (id_bar, id_biere, contenance_cl, prix_vente) VALUES
-- Bar 1: L'Antre II Mondes (Vend du classique et de la Chouffe)
(1, 1, 25, 3.50), (1, 1, 50, 6.50), -- Heineken
(1, 17, 25, 4.50), (1, 17, 50, 8.50), -- Chouffe
(1, 30, 25, 5.00), (1, 30, 50, 9.50), -- Punk IPA
(1, 36, 50, 7.00), -- Guinness (Pinte seulement)

-- Bar 2: Le Brighton (Pub Anglais/Rock)
(2, 36, 25, 4.00), (2, 36, 50, 7.50), -- Guinness
(2, 37, 25, 4.00), (2, 37, 50, 7.50), -- Kilkenny
(2, 33, 50, 8.00), -- Brooklyn Lager
(2, 2, 25, 3.00), (2, 2, 50, 5.80), -- 1664

-- Bar 3: Au Fût et à Mesure (Beaucoup de choix)
(3, 15, 25, 4.80), (3, 15, 50, 9.00), -- Karmeliet
(3, 20, 33, 6.00), -- Duvel (Bouteille souvent)
(3, 23, 25, 5.50), (3, 23, 50, 10.50), -- Paix Dieu
(3, 31, 25, 5.00), (3, 31, 50, 9.50), -- Elvis Juice

-- Bar 4: Les Berthom (Spécialistes Belges)
(4, 15, 25, 5.00), (4, 15, 50, 9.50), -- Karmeliet
(4, 17, 25, 4.80), (4, 17, 50, 9.00), -- Chouffe
(4, 13, 25, 4.50), (4, 13, 50, 8.50), -- Grimbergen
(4, 25, 33, 5.50), -- Chimay Bleue
(4, 28, 33, 6.50), -- Rochefort 10

-- Bar 5: Le Flannery's (Irlandais)
(5, 36, 50, 7.00), -- Guinness
(5, 37, 50, 7.00), -- Kilkenny
(5, 1, 50, 6.00), -- Heineken
(5, 35, 50, 8.50), -- Goose Island

-- Bar 6: Le Blue Dog
(6, 2, 25, 2.80), (6, 2, 50, 5.50),
(6, 11, 25, 3.80), (6, 11, 50, 7.00),
(6, 40, 33, 5.00), -- Desperados

-- Bar 7: Le Café de l'Industrie
(7, 2, 25, 2.90), (7, 2, 50, 5.50),
(7, 6, 25, 3.00), (7, 6, 50, 5.80),
(7, 16, 25, 4.50), (7, 16, 50, 8.50), -- Kwak

-- Bar 8: Le Delirium (Spécialiste Delirium)
(8, 19, 25, 5.20), (8, 19, 50, 9.80), -- Delirium Tremens
(8, 21, 25, 4.00), (8, 21, 50, 7.80), -- Vedett
(8, 15, 50, 9.50), -- Karmeliet

-- Bar 9: Bar de l'Université (Pas cher)
(9, 2, 25, 2.50), (9, 2, 50, 4.50), -- 1664 Pas chère !
(9, 1, 25, 2.60), (9, 1, 50, 4.80),
(9, 40, 33, 4.50),

-- Bar 10: Le Campus (Pas cher aussi)
(10, 3, 25, 2.50), (10, 3, 50, 4.50), -- Kro
(10, 30, 50, 8.00), -- Punk IPA (pour les étudiants riches)

-- Bar 11: Le Trinidad (Cocktails mais bières aussi)
(11, 10, 33, 6.00), -- Corona
(11, 40, 33, 6.00), -- Despe
(11, 1, 25, 4.00), (11, 1, 50, 8.00),

-- Bar 12: Le Byron Bay (Australien)
(12, 1, 50, 7.00),
(12, 30, 50, 9.00),
(12, 32, 50, 8.50), -- Lagunitas

-- Bar 13: Chez Tonton
(13, 2, 25, 3.00), (13, 2, 50, 5.50),
(13, 6, 25, 3.20), (13, 6, 50, 6.00),

-- Bar 14: Le Smart
(14, 1, 25, 5.00), (14, 1, 50, 9.00), -- Cher !
(14, 11, 25, 6.00),

-- Bar 15: Le 911
(15, 2, 50, 5.00),
(15, 38, 33, 5.50), -- La Bête

-- Bar 16: La Vapeur (Salle de concert)
(16, 2, 50, 6.00), -- Gobelet consignés
(16, 30, 50, 8.00),

-- Bar 17: Péniche Cancale
(17, 34, 50, 7.50), -- Ninkasi
(17, 21, 50, 7.00), -- Vedett
(17, 5, 25, 3.50),

-- Bar 18: Le Kilkenny (Irlandais encore)
(18, 36, 50, 7.00), -- Guinness
(18, 37, 50, 7.00), -- Kilkenny
(18, 11, 50, 8.00), -- Leffe

-- Bar 19: L'Univers
(19, 2, 25, 2.80), (19, 2, 50, 5.00),
(19, 17, 25, 4.20),

-- Bar 20: Bistrot des Halles
(20, 4, 25, 3.50), (20, 4, 50, 6.80), -- Stella
(20, 24, 33, 5.50), -- Gulden Draak
(20, 27, 33, 5.20), -- Orval
(20, 30, 25, 4.80), (20, 30, 50, 9.20); -- Punk IPA