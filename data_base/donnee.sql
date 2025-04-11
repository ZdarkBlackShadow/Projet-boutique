-- Insertion des catégories
INSERT INTO categories (nom) VALUES
    ('processeur'),
    ('carte mère'),
    ('boitier'),
    ('alimentation'),
    ('watercooling'),
    ('ram'),
    ('gpu'),
    ('stockage'),
    ('clavier'),
    ('souris'),
    ('ecran'),
    ('tapis de souris');

-- Insertion des fabricants
INSERT INTO fabricants (nom) VALUES
    ('AMD'),
    ('Antec'),
    ('Asus'),
    ('Corsair'),
    ('Hyte'),
    ('Intel'),
    ('Kingston'),
    ('MSI'),
    ('Radeon'),
    ('Gainward(Nvidia)'),
    ('Samsung'),
    ('Thermalright'),
    ('MCHOSE'),
    ('Razer');

-- Insertion des produits
INSERT INTO produits (id, nom, intro, description1, description2, quantite, prix, reduction, rgb, categorie_id, fabricant_id, compatible_intel, nom_dossier, extension_image) VALUES
    (1, 'Ryzen 7 9800X3D (4.7 GHz)', '', 'La légendaire série de processeurs AMD X3D est de retour avec le Ryzen 7 9800X3D. Profitez de performances magistrales en jeu grâce à la technologie 3D V-Cache et ses 104 Mo de cache ultrarapide.', '', 3, 554.59, 10, FALSE, (SELECT id FROM categories WHERE nom = 'processeur'), (SELECT id FROM fabricants WHERE nom = 'AMD'), FALSE, 'AMD_Ryzen 7_9800X3D_(4.7 GHz)', '.webp'),
    
    (2, 'Antec AX20', 'Boitier PC Moyen Tour - ATX / mATX / Mini-ITX - USB 3.0 - Avec fenêtre (pleine taille)', 'L''Antec AX20 est un boîtier Moyen Tour compatible avec des cartes mère aux formats ATX, Micro-ATX et Mini-ITX. Son large espace intérieur configurée de manière optimale est pensé pour les configurations gamers. Sa façade en mesh et les 3 ventilateurs 120 mm RGB fixe positionnés à l''avant assurent une ventilation optimale.', '', 6, 47.49, 0, TRUE, (SELECT id FROM categories WHERE nom = 'boitier'), (SELECT id FROM fabricants WHERE nom = 'Antec'), TRUE, 'Antec_AX20', '.webp'),
    
    (3, 'Asus ROG Loki SFX-L - 1200W', 'Alimentation pour mini-PC et media-centers (SFX-L) - Certifiée 80+ Titanium - Modulaire - Semi-passive - ATX 3.0', 'L'' Asus ROG Loki SFX-L combine des composants de haute qualité, une capacité de refroidissement inédite et une illumination ARGB captivante. Ses dissipateurs de chaleur ROG et son ventilateur à double roulements haute performance caractérisent cette alimentation conçue et pensée pour les configurations gaming les plus exigeantes dans un format SFX-L.', '', 9, 299.99, 0, TRUE, (SELECT id FROM categories WHERE nom = 'alimentation'), (SELECT id FROM fabricants WHERE nom = 'Asus'), TRUE, 'Asus_ROG_Loki', '.webp'),
    
    (4, 'ASUS ROG STRIX B760-F GAMING WIFI', 'Carte mère ATX - Socket 1700 - Chipset Intel B760 - USB 3.2 - M.2 PCIe 4.0 - WiFi 6E / Bluetooth', 'La carte mère Asus ROG STRIX B760-F GAMING WIFI est le socle idéal pour fonder votre configuration basée sur un processeur Intel Raptor Lake. Sa conception intègre le chipset Intel B760 et un socket LGA 1700.', 'Passez à la vitesse supérieure grâce au support natif de la mémoire DDR5 à 5600 MHz (et jusqu''à 7800 MHz en XMP).', 17, 242.24, 10, TRUE, (SELECT id FROM categories WHERE nom = 'carte mère'), (SELECT id FROM fabricants WHERE nom = 'Asus'), TRUE, 'ASUS_ROG_STRIX_B760-F', '.webp'),
    
    (5, 'ASUS ROG STRIX X870-F GAMING WIFI', 'Carte mère ATX - Socket AM5 - Chipset AMD X870 - USB 4 - M.2 PCIe 5.0 - WiFi 7 / Bluetooth', 'La carte mère ASUS ROG STRIX X870-F GAMING WIFI est le socle idéal pour fonder votre configuration basée sur un processeur AMD Ryzen 7xxx ou 9xxx. Sa conception intègre le chipset AMD X870 et un socket AM5, permettant d''exploiter pleinement les performances des nouveaux processeurs Ryzen.', 'Passez à la vitesse supérieure grâce au support natif de la mémoire DDR5 5200MHz (et jusqu''à 8000+ MHz en EXPO), pour des performances plus élevées en jeu et dans les tâches applicatives. Du jamais vu sur une plateforme AMD !', 0, 474.99, 30, TRUE, (SELECT id FROM categories WHERE nom = 'carte mère'), (SELECT id FROM fabricants WHERE nom = 'Asus'), FALSE, 'ASUS_ROG_STRIX_B870-F', '.webp'),
    
    (6, 'Corsair iCUE H170i Elite Capellix - 420 mm', 'Watercooling autonome - PWM - Socket AMD TRX4 / TR4 / AM5 / AM4 et Intel 2066 / 2011(-V3) / 1200 / 115x', 'Éclairée par 33 LED CAPELLIX RGB ultra lumineuses, elle fournit un refroidissement puissant et silencieux à votre processeur. Accompagnée d''un grand radiateur de 420 mm qui offre une surface maximale pour des performances de refroidissement extrêmes.', '', 5, 189.99, 0, TRUE, (SELECT id FROM categories WHERE nom = 'watercooling'), (SELECT id FROM fabricants WHERE nom = 'Corsair'), TRUE, 'Corsair_iCUE_H170i', '.webp'),
    
    (7, 'Corsair RM850E - 850W', 'Alimentation PC Certifiée 80+ Gold - Modulaire - Semi-passive - ATX 3.1', 'Dotés d''une temporisation précise, les blocs d''alimentation Rme sont compatibles avec le mode veille Modern Standby, assurant des délais de passage de la veille au fonctionnement extrêmement rapides et une efficacité à faible charge améliorée.', '', 105, 142.49, 0, FALSE, (SELECT id FROM categories WHERE nom = 'alimentation'), (SELECT id FROM fabricants WHERE nom = 'Corsair'), TRUE, 'Corsair_RM850E', '.webp'),
    
    (8, 'DDR5 Corsair Vengeance RGB - 32 Go (2 x 16 Go) 6000 MHz - CAS 36', '', 'Repoussez les limites de votre système comme jamais auparavant avec la mémoire DDR5, permettant des fréquences encore plus élevées, de meilleures capacités et une performance améliorée.', '', 5, 145.34, 20, TRUE, (SELECT id FROM categories WHERE nom = 'ram'), (SELECT id FROM fabricants WHERE nom = 'Corsair'), TRUE, 'DDR5_Corsair_Vengeance_RGB', '.webp'),
    
    (9, 'DDR5 Kingston Fury Beast Black - 16 Go (2 x 8 Go) 5200 MHz - CAS 36', 'Mémoire DDR5 - PC-41600 - Low-Profile - Optimisée AMD EXPO', 'La mémoire Kingston FURY Beast DDR5 intègre la toute dernière technologie de pointe aux plateformes de jeu de prochaine génération.', '', 23, 66.49, 0, FALSE, (SELECT id FROM categories WHERE nom = 'ram'), (SELECT id FROM fabricants WHERE nom = 'Kingston'), TRUE, 'DDR5_Kingston_Fury_Beast_Black', '.webp'),
    
    (10, 'Hyte Y60 - Noir', 'Boitier PC Moyen Tour - E-ATX / ATX / mATX / Mini-ITX - USB 3.1 Type C - Avec fenêtres', 'Le Hyte Y60 est un boîter au design unique qui s''articule autour d''une conception double chambre. Son triple panneau en verre trempé sans montant offre une vue panoramique sur ta configuration. Ces trois panneaux peuvent être retirés, l''Y60 devient alors un boîtier ouvert original, offrant une vue inédite sur les panneaux internes supérieurs et inférieurs dont l''esthétique travaillée attireront l''œil.', '', 56, 170.99, 30, FALSE, (SELECT id FROM categories WHERE nom = 'boitier'), (SELECT id FROM fabricants WHERE nom = 'Hyte'), TRUE, 'Hyte_Y60', '.jpg'),
    
    (11, 'Intel Core i5-14400F (2.5 GHz)', '', 'Les processeurs Intel® Core™ i5 de 14ème génération (Raptor Lake Refresh), prennent en charge les dernières innovations, à commencer par le support natif de la DDR5 à 4800 MHz, plus rapide et plus économe ainsi qu''une finesse de gravure Intel 7 (10 nm Enhanced Superfin).', '', 69, 161.49, 5, FALSE, (SELECT id FROM categories WHERE nom = 'processeur'), (SELECT id FROM fabricants WHERE nom = 'Intel'), TRUE, 'Intel_Core_i5-14400F', '.webp'),
    
    (12, 'Clavier gaming optique-mécanique K100 RGB — Switch CORSAIR OPX — Noir (FR)', '', 'L''incomparable clavier gaming optique-mécanique CORSAIR K100 RGB allie un design aluminium et un éclairage RGB par touche avec la puissante technologie d''hyper-traitement CORSAIR AXON, et des switchs de touche CORSAIR OPX RGB.', 'Le design raffiné du K100 RGB est doté d''un châssis en aluminium robuste et d''un rétroéclairage RGB par touche dynamique optimisé par la fonction LightEdge RGB à 44 zones et trois côtés.', 67, 229.99, 0, TRUE, (SELECT id FROM categories WHERE nom = 'clavier'), (SELECT id FROM fabricants WHERE nom = 'Corsair'), TRUE, 'K100_RGB', '.avif'),
    
    (13, 'Kingston NV3 1 To', 'SSD M.2 - PCI-Express 4.0 NVMe - Lecture Max : 6000 Mo/s - Ecriture max : 4000 Mo/s - Mémoire QLC 3D', 'Le Kingston NV3 PCIe 4.0 NVMe SSD est une solution de stockage de nouvelle génération alimentée par un contrôleur NVMe Gen 4x4 qui offre des vitesses de lecture/écriture allant jusqu''à 6 000/4 000 Mo/s.', '', 3, 71.24, 0, FALSE, (SELECT id FROM categories WHERE nom = 'stockage'), (SELECT id FROM fabricants WHERE nom = 'Kingston'), TRUE, 'Kingston_NV3', '.webp'),
    
    (14, 'MSI MAG32CQ6F (dalle incurvée)', 'Moniteur 32\" VA 180 Hz - HDR400 - 2560 x 1440 px (QHD) - 0.5 ms - DisplayPort / HDMI / USB-C - Pied réglable - Bords extra-fins', 'Vivez intensément votre victoire avec l''écran gaming MSI MAG 32CQ6FM ! Avec un taux de rafraîchissement de 180 Hz et un temps de réponse gris à gris de 0,5 ms, l''écran MAG 32CQ6FM sera votre meilleur allié pour prendre l''avantage sur vos adversaires.', '', 1, 284.99, 45, FALSE, (SELECT id FROM categories WHERE nom = 'ecran'), (SELECT id FROM fabricants WHERE nom = 'MSI'), TRUE, 'MSI_MAG32CQ6F', '.webp'),
    
    (15, 'Gigabyte Radeon RX 7800 XT GAMING OC', '', 'La carte graphique Radeon RX 7800 XT est une carte graphique conçue pour les passionnés, à la recherche de la meilleure expérience de jeu possible.', '', 6, 590.44, 0, FALSE, (SELECT id FROM categories WHERE nom = 'gpu'), (SELECT id FROM fabricants WHERE nom = 'Radeon'), TRUE, 'Radeon_RX_7800_XT', '.webp'),
    
    (16, '32 Go GDDR7 - HDMI/Tri DisplayPort - DLSS 4 - PCI Express (NVIDIA GeForce RTX 5090)', '', 'Décuple la puissance de ton PC avec la dernière génération de GPU Nvidia GeForce RTX 5090. Basée sur l''architecture Blackwell, elle offre des performances spectaculaires et ouvre un nouveau champs des possibles pour tes aspirations artistiques. Profite d''un framerate toujours plus élevé à l''aide du DLSS 4, et de graphismes incomparables grâce au rendu en temps réel du Ray-Traycing. Plus aucun jeu ne pourra te résister.', '', 56, 3399.69, 0, FALSE, (SELECT id FROM categories WHERE nom = 'gpu'), (SELECT id FROM fabricants WHERE nom = 'Gainward(Nvidia)'), TRUE, 'RTX_5090_Phantom_GS', '.jpg'),
    
    (17, 'Samsung SSD 990 Pro 2 To', 'SSD M.2 - PCI-Express 4.0 NVMe - Cache DRAM - Lecture max : 7450 Mo/s - Ecriture max : 6900 Mo/s - Mémoire TLC 3D', 'Accédez à la nouvelle génération de SSD. La gamme 990 PRO offre des vitesses révolutionnaires et la meilleure fiabilité de sa catégorie. La technologie V-NAND à base de mémoire TLC 3D améliore la réactivité de vos jeux et accélèrent l''édition graphique en 4K et 3D.', '', 23, 161.49, 8, FALSE, (SELECT id FROM categories WHERE nom = 'stockage'), (SELECT id FROM fabricants WHERE nom = 'Samsung'), TRUE, 'Samsung_SSD_990_Pro', '.webp'),
    
    (18, 'Thermalright Frozen Notte ARGB V2 Noir - 360 mm', 'Watercooling autonome - PWM - Socket AMD AM5 / AM4 / AM3(+) / AM2(+) / FM2(+) / FM1 et Intel 2066 / 2011(-V3) / 1700 / 1366 / 115x / 1200', 'Le Thermalright Frozen Notte 360 ARGB V2 est un système de watercooling AIO conçu pour offrir un refroidissement puissant et silencieux aux processeurs haut de gamme.', '', 22, 113.99, 2, TRUE, (SELECT id FROM categories WHERE nom = 'watercooling'), (SELECT id FROM fabricants WHERE nom = 'Thermalright'), TRUE, 'Thermalright_Frozen_Notte', '.webp'),
    
    (19, 'MCHOSE G3 ULTRA 8K Wireless Blanc', 'Souris Gaming sans-fil ultra-légère Blanc - Forme symétrique - Capteur Pixart PAW3395 - 26000 DPI - Switchs Omron - 8K', 'Avec son format adapté aux plus petites mains, ainsi qu''au Claw et Fingertip grip, la MCHOSE G3 Ultra dispose de tous les atoûts d''une souris compétitive, avec un accès à la 8K, des switchs Omron et un capteur Pixart PAW3395 !', '', 1234, 64.90, 0, FALSE, (SELECT id FROM categories WHERE nom = 'souris'), (SELECT id FROM fabricants WHERE nom = 'MCHOSE'), TRUE, 'MCHOSE_G3_ULTRA', '.webp'),
    
    (20, 'Razer Goliathus Extended Chroma (Fortnite Edition)', 'Tapis de souris Gamer - Souple - Revêtement lisse - Alimenté par Razer Chroma - 920 x 294 mm', 'Faites rayonner votre setup avec un grand tapis de souris rétroéclairé sur les bords et propulsé par Razer Chroma™ RGB. Traquez vos adversaires sans relâche grâce à une surface optimisée pour la vitesse et la précision.', 'Le meilleur tapis de souris gaming souple est maintenant alimenté par Razer Chroma™ RGB et prêt à illuminer chaque victoire dans un spectre de magnifiques couleurs.', 0, 119.99, 50, TRUE, (SELECT id FROM categories WHERE nom = 'tapis de souris'), (SELECT id FROM fabricants WHERE nom = 'Razer'), TRUE, 'Razer_Goliathus', '.webp');

-- Insertion des caractéristiques pour le produit 2 (Antec AX20)
INSERT INTO caracteristiques (produit_id, description) VALUES
    (2, 'Boîtier Moyen Tour gamer'),
    (2, 'Fenêtre latérale en verre trempé'),
    (2, 'Panneau frontal mesh'),
    (2, 'Prise en charge carte mère ATX, Micro-ATX et Mini ITX'),
    (2, 'Longueur maximum de l''alimentation : 170 mm (avec HDD) / 295 mm (sans HDD)'),
    (2, 'Hauteur maximum du ventirad : 155 mm'),
    (2, 'Longueur maximum carte graphique : 270 mm'),
    (2, '8 emplacements pour ventilateurs 120 mm (3 ventilateurs 120 mm RGB fixe inclus à l''avant)'),
    (2, 'Connectique : 2 x USB 2.0,1 x USB 3.0, audio (micro+casque)'),
    (2, 'Nombre de baies : 2 x 2.5'', 1 x 3.5'' et 1 x 2.5/3.5'''),
    (2, 'Compatibilité watercooling jusqu''à 280 mm à l''avant');

-- Insertion des caractéristiques pour le produit 9 (Kingston Fury Beast)
INSERT INTO caracteristiques (produit_id, description) VALUES
    (9, 'Meilleures performances à partir de 4 800 MHz'),
    (9, 'Stabilité accrue pour le sur-cadencement'),
    (9, 'Efficacité accrue'),
    (9, 'Compatible AMD EXPO et certifiée'),
    (9, 'Qualifiée par les plus grands fabricants de cartes mères au monde1'),
    (9, 'Plug N Play à 4 800 MHz2'),
    (9, 'Conception compacte du dissipateur de chaleur');

-- Insertion des caractéristiques pour le produit 16 (RTX 5090)
INSERT INTO caracteristiques (produit_id, description) VALUES
    (16, 'Architecture Nvidia Blackwell'),
    (16, '32 Go de VRAM GDDR7 (28 Gbps)'),
    (16, 'Système de ventilation Cyclone triple'),
    (16, 'DLSS 4.0'),
    (16, 'Dual Bios (performance/silencieux)'),
    (16, 'Mode 0 db'),
    (16, 'DisplayPort 2.1 et HDMI 2.1'),
    (16, 'Chambre à vapeur pour meilleure dissipation thermique'),
    (16, 'Backplate en métal et solidité renforcée');

-- Insertion des caractéristiques pour le produit 18 (Thermalright)
INSERT INTO caracteristiques (produit_id, description) VALUES
    (18, 'Système de refroidissement watercooling tout-en-un pour processeur'),
    (18, 'Compatibilité Intel 2066/2011-3/2011/1700/1366/1200/1156/1155/1151/1150'),
    (18, 'Compatibilité FM1/FM2(+)/AM2(+)/AM3(+)/AM4/AM5'),
    (18, 'Ventilateurs 120 mm PWM ARGB modèle TL-E12B-S'),
    (18, 'Longueur du tuyau : 400 mm'),
    (18, 'Dimensions de la pompe : 71.9 x 71.9 x 54 mm');

-- Insertion des caractéristiques pour le produit 19 (MCHOSE)
INSERT INTO caracteristiques (produit_id, description) VALUES
    (19, 'Souris gamer sans fil ultralégère'),
    (19, 'Capteur Pixart PAW3395 de 26000 DPI'),
    (19, '650 IPS et 50G d''accélération'),
    (19, 'Switchs Omron'),
    (19, 'Encodeur TTC Gold et puce Realtek'),
    (19, '8000 Hz atteignables avec dongle inclus'),
    (19, 'Batterie de 500 mAh et 130h d''autonomie maximale'),
    (19, 'DPI personnalisable via le logiciel MCHOSE'),
    (19, 'Triple mode de connexion : Sans fil 2.4 GHz, Bluetooth et Filaire'),
    (19, 'Patins en PTFE'),
    (19, 'Poids : 64 grammes'),
    (19, 'Dimensions : 116.5 x 62.9 x 38.2mm');

-- Création d'un utilisateur de test
INSERT INTO users (email, password, nom, prenom, is_admin) VALUES
    ('admin@example.com', '$2y$10$YpdDgKGiSYTDfwTH/gRjiuHpHQKxTAltsuQEKL0Pf.6wvTJFTIbOm', 'Admin', 'Système', TRUE),
    ('client@example.com', '$2y$10$fPRE6MR4yOSFyBdyv9IKuuPHhxZyG27R.w3SjDHNCLgW3yXa3WKu.', 'Dupont', 'Jean', FALSE);

-- Insertion d'adresses de test
INSERT INTO adresses (user_id, adresse, code_postal, ville, pays, adresse_par_defaut, facturation) VALUES
    (1, '123 Avenue Exemple', '75001', 'Paris', 'France', TRUE, TRUE),
    (2, '45 Rue du Commerce', '69002', 'Lyon', 'France', TRUE, FALSE),
    (2, '45 Rue du Commerce', '69002', 'Lyon', 'France', FALSE, TRUE);

-- Insertion d'un panier de test
INSERT INTO paniers (user_id) VALUES (2);

-- Ajout de produits au panier
INSERT INTO panier_produits (panier_id, produit_id, quantite) VALUES
    (1, 8, 1),
    (1, 11, 1),
    (1, 13, 2);

-- Insertion d'une commande de test
INSERT INTO commandes (user_id, adresse_livraison_id, adresse_facturation_id, montant_total, statut, reference, methode_paiement) VALUES
    (2, 2, 3, 672.32, 'livrée', 'CMD-20250101-001', 'Carte bancaire');

-- Détails de la commande
INSERT INTO commande_details (commande_id, produit_id, quantite, prix_unitaire, reduction_appliquee) VALUES
    (1, 10, 1, 170.99, 51.30),
    (1, 11, 1, 161.49, 8.07),
    (1, 13, 2, 71.24, 0);

-- Insertion d'avis
INSERT INTO avis (produit_id, user_id, note, commentaire, approuve) VALUES
    (10, 2, 5, 'Superbe boîtier, très facile à monter et avec un excellent flux d''air.', TRUE),
    (11, 2, 4, 'Bon rapport qualité-prix pour ce processeur, parfait pour le gaming.', TRUE);

-- Insertion d'articles dans la liste de souhaits
INSERT INTO liste_souhaits (user_id, produit_id) VALUES
    (2, 16),
    (2, 6);

-- Insertion d'un coupon
INSERT INTO coupons (code, type, valeur, minimum_commande, date_debut, date_fin, usage_unique, usage_max) VALUES
    ('BIENVENUE10', 'pourcentage', 10, 50, '2025-01-01', '2025-12-31', FALSE, 1000),
    ('ETE25', 'pourcentage', 25, 200, '2025-06-01', '2025-08-31', FALSE, 500),
    ('LIVRAISON', 'livraison', NULL, 100, '2025-01-01', '2025-12-31', FALSE, 2000);