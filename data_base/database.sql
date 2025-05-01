-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 01, 2025 at 11:29 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test2`
--

-- --------------------------------------------------------

--
-- Table structure for table `caracteristiques`
--

CREATE TABLE `caracteristiques` (
  `id` int(11) NOT NULL,
  `produit_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Dumping data for table `caracteristiques`
--

INSERT INTO `caracteristiques` (`id`, `produit_id`, `description`) VALUES
(1, 2, 'Boîtier Moyen Tour gamer'),
(2, 2, 'Fenêtre latérale en verre trempé'),
(3, 2, 'Panneau frontal mesh'),
(4, 2, 'Prise en charge carte mère ATX, Micro-ATX et Mini ITX'),
(5, 2, 'Longueur maximum de l\'alimentation : 170 mm (avec HDD) / 295 mm (sans HDD)'),
(6, 2, 'Hauteur maximum du ventirad : 155 mm'),
(7, 2, 'Longueur maximum carte graphique : 270 mm'),
(8, 2, '8 emplacements pour ventilateurs 120 mm (3 ventilateurs 120 mm RGB fixe inclus à l\'avant)'),
(9, 2, 'Connectique : 2 x USB 2.0,1 x USB 3.0, audio (micro+casque)'),
(10, 2, 'Nombre de baies : 2 x 2.5\', 1 x 3.5\' et 1 x 2.5/3.5\''),
(11, 2, 'Compatibilité watercooling jusqu\'à 280 mm à l\'avant'),
(12, 9, 'Meilleures performances à partir de 4 800 MHz'),
(13, 9, 'Stabilité accrue pour le sur-cadencement'),
(14, 9, 'Efficacité accrue'),
(15, 9, 'Compatible AMD EXPO et certifiée'),
(16, 9, 'Qualifiée par les plus grands fabricants de cartes mères au monde1'),
(17, 9, 'Plug N Play à 4 800 MHz2'),
(18, 9, 'Conception compacte du dissipateur de chaleur'),
(19, 16, 'Architecture Nvidia Blackwell'),
(20, 16, '32 Go de VRAM GDDR7 (28 Gbps)'),
(21, 16, 'Système de ventilation Cyclone triple'),
(22, 16, 'DLSS 4.0'),
(23, 16, 'Dual Bios (performance/silencieux)'),
(24, 16, 'Mode 0 db'),
(25, 16, 'DisplayPort 2.1 et HDMI 2.1'),
(26, 16, 'Chambre à vapeur pour meilleure dissipation thermique'),
(27, 16, 'Backplate en métal et solidité renforcée'),
(28, 18, 'Système de refroidissement watercooling tout-en-un pour processeur'),
(29, 18, 'Compatibilité Intel 2066/2011-3/2011/1700/1366/1200/1156/1155/1151/1150'),
(30, 18, 'Compatibilité FM1/FM2(+)/AM2(+)/AM3(+)/AM4/AM5'),
(31, 18, 'Ventilateurs 120 mm PWM ARGB modèle TL-E12B-S'),
(32, 18, 'Longueur du tuyau : 400 mm'),
(33, 18, 'Dimensions de la pompe : 71.9 x 71.9 x 54 mm'),
(34, 19, 'Souris gamer sans fil ultralégère'),
(35, 19, 'Capteur Pixart PAW3395 de 26000 DPI'),
(36, 19, '650 IPS et 50G d\'accélération'),
(37, 19, 'Switchs Omron'),
(38, 19, 'Encodeur TTC Gold et puce Realtek'),
(39, 19, '8000 Hz atteignables avec dongle inclus'),
(40, 19, 'Batterie de 500 mAh et 130h d\'autonomie maximale'),
(41, 19, 'DPI personnalisable via le logiciel MCHOSE'),
(42, 19, 'Triple mode de connexion : Sans fil 2.4 GHz, Bluetooth et Filaire'),
(43, 19, 'Patins en PTFE'),
(44, 19, 'Poids : 64 grammes'),
(45, 19, 'Dimensions : 116.5 x 62.9 x 38.2mm');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `nom`) VALUES
(4, 'alimentation'),
(3, 'boitier'),
(2, 'carte mère'),
(9, 'clavier'),
(11, 'ecran'),
(7, 'gpu'),
(1, 'processeur'),
(6, 'ram'),
(10, 'souris'),
(8, 'stockage'),
(12, 'tapis de souris'),
(5, 'watercooling');

-- --------------------------------------------------------

--
-- Table structure for table `fabricants`
--

CREATE TABLE `fabricants` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Dumping data for table `fabricants`
--

INSERT INTO `fabricants` (`id`, `nom`) VALUES
(1, 'AMD'),
(2, 'Antec'),
(3, 'Asus'),
(4, 'Corsair'),
(10, 'Gainward(Nvidia)'),
(5, 'Hyte'),
(6, 'Intel'),
(7, 'Kingston'),
(13, 'MCHOSE'),
(8, 'MSI'),
(9, 'Radeon'),
(14, 'Razer'),
(11, 'Samsung'),
(12, 'Thermalright');

-- --------------------------------------------------------

--
-- Table structure for table `paniers`
--

CREATE TABLE `paniers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_modification` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `adresse` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Dumping data for table `paniers`
--
-- --------------------------------------------------------

--
-- Table structure for table `panier_produits`
--

CREATE TABLE `panier_produits` (
  `id` int(11) NOT NULL,
  `panier_id` int(11) NOT NULL,
  `produit_id` int(11) NOT NULL,
  `quantite` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Dumping data for table `panier_produits`
--

-- --------------------------------------------------------

--
-- Table structure for table `produits`
--

CREATE TABLE `produits` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `intro` text DEFAULT NULL,
  `description1` text NOT NULL,
  `description2` text DEFAULT NULL,
  `quantite` int(11) NOT NULL DEFAULT 0,
  `prix` decimal(10,2) NOT NULL,
  `reduction` int(11) DEFAULT 0,
  `rgb` tinyint(1) NOT NULL DEFAULT 0,
  `categorie_id` int(11) NOT NULL,
  `fabricant_id` int(11) NOT NULL,
  `compatible_intel` tinyint(1) NOT NULL DEFAULT 1,
  `nom_dossier` varchar(100) NOT NULL,
  `extension_image` varchar(10) NOT NULL,
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Dumping data for table `produits`
--

INSERT INTO `produits` (`id`, `nom`, `intro`, `description1`, `description2`, `quantite`, `prix`, `reduction`, `rgb`, `categorie_id`, `fabricant_id`, `compatible_intel`, `nom_dossier`, `extension_image`, `date_creation`) VALUES
(1, 'Ryzen 7 9800X3D (4.7 GHz)', '', 'La légendaire série de processeurs AMD X3D est de retour avec le Ryzen 7 9800X3D. Profitez de performances magistrales en jeu grâce à la technologie 3D V-Cache et ses 104 Mo de cache ultrarapide.', '', 3, 554.59, 10, 0, 1, 1, 0, 'AMD_Ryzen 7_9800X3D_(4.7 GHz)', '.webp', '2025-04-11 09:58:49'),
(2, 'Antec AX20', 'Boitier PC Moyen Tour - ATX / mATX / Mini-ITX - USB 3.0 - Avec fenêtre (pleine taille)', 'L\'Antec AX20 est un boîtier Moyen Tour compatible avec des cartes mère aux formats ATX, Micro-ATX et Mini-ITX. Son large espace intérieur configurée de manière optimale est pensé pour les configurations gamers. Sa façade en mesh et les 3 ventilateurs 120 mm RGB fixe positionnés à l\'avant assurent une ventilation optimale.', '', 6, 47.49, 0, 1, 3, 2, 1, 'Antec_AX20', '.webp', '2025-04-11 09:58:49'),
(3, 'Asus ROG Loki SFX-L - 1200W', 'Alimentation pour mini-PC et media-centers (SFX-L) - Certifiée 80+ Titanium - Modulaire - Semi-passive - ATX 3.0', 'L\' Asus ROG Loki SFX-L combine des composants de haute qualité, une capacité de refroidissement inédite et une illumination ARGB captivante. Ses dissipateurs de chaleur ROG et son ventilateur à double roulements haute performance caractérisent cette alimentation conçue et pensée pour les configurations gaming les plus exigeantes dans un format SFX-L.', '', 9, 299.99, 0, 1, 4, 3, 1, 'Asus_ROG_Loki', '.webp', '2025-04-11 09:58:49'),
(4, 'ASUS ROG STRIX B760-F GAMING WIFI', 'Carte mère ATX - Socket 1700 - Chipset Intel B760 - USB 3.2 - M.2 PCIe 4.0 - WiFi 6E / Bluetooth', 'La carte mère Asus ROG STRIX B760-F GAMING WIFI est le socle idéal pour fonder votre configuration basée sur un processeur Intel Raptor Lake. Sa conception intègre le chipset Intel B760 et un socket LGA 1700.', 'Passez à la vitesse supérieure grâce au support natif de la mémoire DDR5 à 5600 MHz (et jusqu\'à 7800 MHz en XMP).', 17, 242.24, 10, 1, 2, 3, 1, 'ASUS_ROG_STRIX_B760-F', '.webp', '2025-04-11 09:58:49'),
(5, 'ASUS ROG STRIX X870-F GAMING WIFI', 'Carte mère ATX - Socket AM5 - Chipset AMD X870 - USB 4 - M.2 PCIe 5.0 - WiFi 7 / Bluetooth', 'La carte mère ASUS ROG STRIX X870-F GAMING WIFI est le socle idéal pour fonder votre configuration basée sur un processeur AMD Ryzen 7xxx ou 9xxx. Sa conception intègre le chipset AMD X870 et un socket AM5, permettant d\'exploiter pleinement les performances des nouveaux processeurs Ryzen.', 'Passez à la vitesse supérieure grâce au support natif de la mémoire DDR5 5200MHz (et jusqu\'à 8000+ MHz en EXPO), pour des performances plus élevées en jeu et dans les tâches applicatives. Du jamais vu sur une plateforme AMD !', 0, 474.99, 30, 1, 2, 3, 0, 'ASUS_ROG_STRIX_X870-F', '.webp', '2025-04-11 09:58:49'),
(6, 'Corsair iCUE H170i Elite Capellix - 420 mm', 'Watercooling autonome - PWM - Socket AMD TRX4 / TR4 / AM5 / AM4 et Intel 2066 / 2011(-V3) / 1200 / 115x', 'Éclairée par 33 LED CAPELLIX RGB ultra lumineuses, elle fournit un refroidissement puissant et silencieux à votre processeur. Accompagnée d\'un grand radiateur de 420 mm qui offre une surface maximale pour des performances de refroidissement extrêmes.', '', 5, 189.99, 0, 1, 5, 4, 1, 'Corsair_iCUE_H170i', '.webp', '2025-04-11 09:58:49'),
(7, 'Corsair RM850E - 850W', 'Alimentation PC Certifiée 80+ Gold - Modulaire - Semi-passive - ATX 3.1', 'Dotés d\'une temporisation précise, les blocs d\'alimentation Rme sont compatibles avec le mode veille Modern Standby, assurant des délais de passage de la veille au fonctionnement extrêmement rapides et une efficacité à faible charge améliorée.', '', 105, 142.49, 0, 0, 4, 4, 1, 'Corsair_RM850E', '.webp', '2025-04-11 09:58:49'),
(8, 'DDR5 Corsair Vengeance RGB - 32 Go (2 x 16 Go) 6000 MHz - CAS 36', '', 'Repoussez les limites de votre système comme jamais auparavant avec la mémoire DDR5, permettant des fréquences encore plus élevées, de meilleures capacités et une performance améliorée.', '', 5, 145.34, 20, 1, 6, 4, 1, 'DDR5_Corsair_Vengeance_RGB', '.webp', '2025-04-11 09:58:49'),
(9, 'DDR5 Kingston Fury Beast Black - 16 Go (2 x 8 Go) 5200 MHz - CAS 36', 'Mémoire DDR5 - PC-41600 - Low-Profile - Optimisée AMD EXPO', 'La mémoire Kingston FURY Beast DDR5 intègre la toute dernière technologie de pointe aux plateformes de jeu de prochaine génération.', '', 23, 66.49, 0, 0, 6, 7, 1, 'DDR5_Kingston_Fury_Beast_Black', '.webp', '2025-04-11 09:58:49'),
(10, 'Hyte Y60 - Noir', 'Boitier PC Moyen Tour - E-ATX / ATX / mATX / Mini-ITX - USB 3.1 Type C - Avec fenêtres', 'Le Hyte Y60 est un boîter au design unique qui s\'articule autour d\'une conception double chambre. Son triple panneau en verre trempé sans montant offre une vue panoramique sur ta configuration. Ces trois panneaux peuvent être retirés, l\'Y60 devient alors un boîtier ouvert original, offrant une vue inédite sur les panneaux internes supérieurs et inférieurs dont l\'esthétique travaillée attireront l\'œil.', '', 56, 170.99, 30, 0, 3, 5, 1, 'Hyte_Y60', '.jpg', '2025-04-11 09:58:49'),
(11, 'Intel Core i5-14400F (2.5 GHz)', '', 'Les processeurs Intel® Core™ i5 de 14ème génération (Raptor Lake Refresh), prennent en charge les dernières innovations, à commencer par le support natif de la DDR5 à 4800 MHz, plus rapide et plus économe ainsi qu\'une finesse de gravure Intel 7 (10 nm Enhanced Superfin).', '', 69, 161.49, 5, 0, 1, 6, 1, 'Intel_Core_i5-14400F', '.webp', '2025-04-11 09:58:49'),
(12, 'Clavier gaming optique-mécanique K100 RGB — Switch CORSAIR OPX — Noir (FR)', '', 'L\'incomparable clavier gaming optique-mécanique CORSAIR K100 RGB allie un design aluminium et un éclairage RGB par touche avec la puissante technologie d\'hyper-traitement CORSAIR AXON, et des switchs de touche CORSAIR OPX RGB.', 'Le design raffiné du K100 RGB est doté d\'un châssis en aluminium robuste et d\'un rétroéclairage RGB par touche dynamique optimisé par la fonction LightEdge RGB à 44 zones et trois côtés.', 67, 229.99, 0, 1, 9, 4, 1, 'K100_RGB', '.avif', '2025-04-11 09:58:49'),
(13, 'Kingston NV3 1 To', 'SSD M.2 - PCI-Express 4.0 NVMe - Lecture Max : 6000 Mo/s - Ecriture max : 4000 Mo/s - Mémoire QLC 3D', 'Le Kingston NV3 PCIe 4.0 NVMe SSD est une solution de stockage de nouvelle génération alimentée par un contrôleur NVMe Gen 4x4 qui offre des vitesses de lecture/écriture allant jusqu\'à 6 000/4 000 Mo/s.', '', 3, 71.24, 0, 0, 8, 7, 1, 'Kingston_NV3', '.webp', '2025-04-11 09:58:49'),
(14, 'MSI MAG32CQ6F (dalle incurvée)', 'Moniteur 32\" VA 180 Hz - HDR400 - 2560 x 1440 px (QHD) - 0.5 ms - DisplayPort / HDMI / USB-C - Pied réglable - Bords extra-fins', 'Vivez intensément votre victoire avec l\'écran gaming MSI MAG 32CQ6FM ! Avec un taux de rafraîchissement de 180 Hz et un temps de réponse gris à gris de 0,5 ms, l\'écran MAG 32CQ6FM sera votre meilleur allié pour prendre l\'avantage sur vos adversaires.', '', 1, 284.99, 45, 0, 11, 8, 1, 'MSI_MAG32CQ6F', '.webp', '2025-04-11 09:58:49'),
(15, 'Gigabyte Radeon RX 7800 XT GAMING OC', '', 'La carte graphique Radeon RX 7800 XT est une carte graphique conçue pour les passionnés, à la recherche de la meilleure expérience de jeu possible.', '', 6, 590.44, 0, 0, 7, 9, 1, 'Radeon_RX_7800_XT', '.webp', '2025-04-11 09:58:49'),
(16, '32 Go GDDR7 - HDMI/Tri DisplayPort - DLSS 4 - PCI Express (NVIDIA GeForce RTX 5090)', '', 'Décuple la puissance de ton PC avec la dernière génération de GPU Nvidia GeForce RTX 5090. Basée sur l\'architecture Blackwell, elle offre des performances spectaculaires et ouvre un nouveau champs des possibles pour tes aspirations artistiques. Profite d\'un framerate toujours plus élevé à l\'aide du DLSS 4, et de graphismes incomparables grâce au rendu en temps réel du Ray-Traycing. Plus aucun jeu ne pourra te résister.', '', 56, 3399.69, 0, 0, 7, 10, 1, 'RTX_5090_Phantom_GS', '.jpg', '2025-04-11 09:58:49'),
(17, 'Samsung SSD 990 Pro 2 To', 'SSD M.2 - PCI-Express 4.0 NVMe - Cache DRAM - Lecture max : 7450 Mo/s - Ecriture max : 6900 Mo/s - Mémoire TLC 3D', 'Accédez à la nouvelle génération de SSD. La gamme 990 PRO offre des vitesses révolutionnaires et la meilleure fiabilité de sa catégorie. La technologie V-NAND à base de mémoire TLC 3D améliore la réactivité de vos jeux et accélèrent l\'édition graphique en 4K et 3D.', '', 23, 161.49, 8, 0, 8, 11, 1, 'Samsung_SSD_990_Pro', '.webp', '2025-04-11 09:58:49'),
(18, 'Thermalright Frozen Notte ARGB V2 Noir - 360 mm', 'Watercooling autonome - PWM - Socket AMD AM5 / AM4 / AM3(+) / AM2(+) / FM2(+) / FM1 et Intel 2066 / 2011(-V3) / 1700 / 1366 / 115x / 1200', 'Le Thermalright Frozen Notte 360 ARGB V2 est un système de watercooling AIO conçu pour offrir un refroidissement puissant et silencieux aux processeurs haut de gamme.', '', 22, 113.99, 2, 1, 5, 12, 1, 'Thermalright_Frozen_Notte', '.webp', '2025-04-11 09:58:49'),
(19, 'MCHOSE G3 ULTRA 8K Wireless Blanc', 'Souris Gaming sans-fil ultra-légère Blanc - Forme symétrique - Capteur Pixart PAW3395 - 26000 DPI - Switchs Omron - 8K', 'Avec son format adapté aux plus petites mains, ainsi qu\'au Claw et Fingertip grip, la MCHOSE G3 Ultra dispose de tous les atoûts d\'une souris compétitive, avec un accès à la 8K, des switchs Omron et un capteur Pixart PAW3395 !', '', 1234, 64.90, 0, 0, 10, 13, 1, 'MCHOSE_G3_ULTRA', '.webp', '2025-04-11 09:58:49'),
(20, 'Razer Goliathus Extended Chroma (Fortnite Edition)', 'Tapis de souris Gamer - Souple - Revêtement lisse - Alimenté par Razer Chroma - 920 x 294 mm', 'Faites rayonner votre setup avec un grand tapis de souris rétroéclairé sur les bords et propulsé par Razer Chroma™ RGB. Traquez vos adversaires sans relâche grâce à une surface optimisée pour la vitesse et la précision.', 'Le meilleur tapis de souris gaming souple est maintenant alimenté par Razer Chroma™ RGB et prêt à illuminer chaque victoire dans un spectre de magnifiques couleurs.', 0, 119.99, 50, 1, 12, 14, 1, 'Razer_Goliathus', '.webp', '2025-04-11 09:58:49');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT 0,
  `date_inscription` timestamp NOT NULL DEFAULT current_timestamp(),
  `derniere_connexion` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `token_reset` varchar(100) DEFAULT NULL,
  `expiration_token` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Dumping data for table `users`
--

--
-- Indexes for dumped tables
--

--
-- Indexes for table `caracteristiques`
--
ALTER TABLE `caracteristiques`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_caracteristiques_produit` (`produit_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nom` (`nom`);

--
-- Indexes for table `fabricants`
--
ALTER TABLE `fabricants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nom` (`nom`);

--
-- Indexes for table `paniers`
--
ALTER TABLE `paniers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_paniers_user` (`user_id`);

--
-- Indexes for table `panier_produits`
--
ALTER TABLE `panier_produits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_panier_produits_panier` (`panier_id`),
  ADD KEY `idx_panier_produits_produit` (`produit_id`);

--
-- Indexes for table `produits`
--
ALTER TABLE `produits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_produits_categorie` (`categorie_id`),
  ADD KEY `idx_produits_fabricant` (`fabricant_id`),
  ADD KEY `idx_produits_nom` (`nom`),
  ADD KEY `idx_produits_prix` (`prix`),
  ADD KEY `idx_produits_reduction` (`reduction`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_users_email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `caracteristiques`
--
ALTER TABLE `caracteristiques`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `fabricants`
--
ALTER TABLE `fabricants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `paniers`
--
ALTER TABLE `paniers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `panier_produits`
--
ALTER TABLE `panier_produits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `caracteristiques`
--
ALTER TABLE `caracteristiques`
  ADD CONSTRAINT `caracteristiques_ibfk_1` FOREIGN KEY (`produit_id`) REFERENCES `produits` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `paniers`
--
ALTER TABLE `paniers`
  ADD CONSTRAINT `paniers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `panier_produits`
--
ALTER TABLE `panier_produits`
  ADD CONSTRAINT `panier_produits_ibfk_1` FOREIGN KEY (`panier_id`) REFERENCES `paniers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `panier_produits_ibfk_2` FOREIGN KEY (`produit_id`) REFERENCES `produits` (`id`);

--
-- Constraints for table `produits`
--
ALTER TABLE `produits`
  ADD CONSTRAINT `produits_ibfk_1` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `produits_ibfk_2` FOREIGN KEY (`fabricant_id`) REFERENCES `fabricants` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
