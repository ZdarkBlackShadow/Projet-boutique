-- Création des tables si elles n'existent pas déjà
CREATE TABLE IF NOT EXISTS images (
    image_id INT PRIMARY KEY AUTO_INCREMENT,
    image_path VARCHAR(255) NOT NULL,
    is_primary BOOLEAN DEFAULT FALSE,
    upload_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS produit_images (
    produit_image_id INT PRIMARY KEY AUTO_INCREMENT,
    produit_id INT NOT NULL,
    image_id INT NOT NULL,
    position INT DEFAULT 0,
    FOREIGN KEY (produit_id) REFERENCES produits(id) ON DELETE CASCADE,
    FOREIGN KEY (image_id) REFERENCES images(image_id) ON DELETE CASCADE,
    UNIQUE KEY (produit_id, image_id)
);

-- Insertion des images pour tous les produits

-- Produit 1: AMD Ryzen 7 9800X3D (4.7 GHz)
INSERT INTO images (image_path, is_primary) VALUES 
('http://localhost:3000/image/AMD_Ryzen%207_9800X3D_(4.7%20GHz)/1.webp', TRUE),
('http://localhost:3000/image/AMD_Ryzen%207_9800X3D_(4.7%20GHz)/2.webp', FALSE),
('http://localhost:3000/image/AMD_Ryzen%207_9800X3D_(4.7%20GHz)/3.webp', FALSE);

INSERT INTO produit_images (produit_id, image_id, position) VALUES 
(1, LAST_INSERT_ID()-2, 1),
(1, LAST_INSERT_ID()-1, 2),
(1, LAST_INSERT_ID(), 3);

-- Produit 2: Antec AX20
INSERT INTO images (image_path, is_primary) VALUES 
('http://localhost:3000/image/Antec_AX20/1.webp', TRUE),
('http://localhost:3000/image/Antec_AX20/2.webp', FALSE),
('http://localhost:3000/image/Antec_AX20/3.webp', FALSE);

INSERT INTO produit_images (produit_id, image_id, position) VALUES 
(2, LAST_INSERT_ID()-2, 1),
(2, LAST_INSERT_ID()-1, 2),
(2, LAST_INSERT_ID(), 3);

-- Produit 3: Asus ROG Loki SFX-L - 1200W
INSERT INTO images (image_path, is_primary) VALUES 
('http://localhost:3000/image/Asus_ROG_Loki/1.webp', TRUE),
('http://localhost:3000/image/Asus_ROG_Loki/2.webp', FALSE),
('http://localhost:3000/image/Asus_ROG_Loki/3.webp', FALSE);

INSERT INTO produit_images (produit_id, image_id, position) VALUES 
(3, LAST_INSERT_ID()-2, 1),
(3, LAST_INSERT_ID()-1, 2),
(3, LAST_INSERT_ID(), 3);

-- Produit 4: ASUS ROG STRIX B760-F GAMING WIFI
INSERT INTO images (image_path, is_primary) VALUES 
('http://localhost:3000/image/ASUS_ROG_STRIX_B760-F/1.webp', TRUE),
('http://localhost:3000/image/ASUS_ROG_STRIX_B760-F/2.webp', FALSE),
('http://localhost:3000/image/ASUS_ROG_STRIX_B760-F/3.webp', FALSE);

INSERT INTO produit_images (produit_id, image_id, position) VALUES 
(4, LAST_INSERT_ID()-2, 1),
(4, LAST_INSERT_ID()-1, 2),
(4, LAST_INSERT_ID(), 3);

-- Produit 5: ASUS ROG STRIX X870-F GAMING WIFI
INSERT INTO images (image_path, is_primary) VALUES 
('http://localhost:3000/image/ASUS_ROG_STRIX_X870-F/1.webp', TRUE),
('http://localhost:3000/image/ASUS_ROG_STRIX_X870-F/2.webp', FALSE),
('http://localhost:3000/image/ASUS_ROG_STRIX_X870-F/3.webp', FALSE);

INSERT INTO produit_images (produit_id, image_id, position) VALUES 
(5, LAST_INSERT_ID()-2, 1),
(5, LAST_INSERT_ID()-1, 2),
(5, LAST_INSERT_ID(), 3);

-- Produit 6: Corsair iCUE H170i Elite Capellix - 420 mm
INSERT INTO images (image_path, is_primary) VALUES 
('http://localhost:3000/image/Corsair_iCUE_H170i/1.webp', TRUE),
('http://localhost:3000/image/Corsair_iCUE_H170i/2.webp', FALSE),
('http://localhost:3000/image/Corsair_iCUE_H170i/3.webp', FALSE);

INSERT INTO produit_images (produit_id, image_id, position) VALUES 
(6, LAST_INSERT_ID()-2, 1),
(6, LAST_INSERT_ID()-1, 2),
(6, LAST_INSERT_ID(), 3);

-- Produit 7: Corsair RM850E - 850W
INSERT INTO images (image_path, is_primary) VALUES 
('http://localhost:3000/image/Corsair_RM850E/1.webp', TRUE),
('http://localhost:3000/image/Corsair_RM850E/2.webp', FALSE),
('http://localhost:3000/image/Corsair_RM850E/3.webp', FALSE);

INSERT INTO produit_images (produit_id, image_id, position) VALUES 
(7, LAST_INSERT_ID()-2, 1),
(7, LAST_INSERT_ID()-1, 2),
(7, LAST_INSERT_ID(), 3);

-- Produit 8: DDR5 Corsair Vengeance RGB - 32 Go
INSERT INTO images (image_path, is_primary) VALUES 
('http://localhost:3000/image/DDR5_Corsair_Vengeance_RGB/62e10c350a99f142340918fd.webp', TRUE),
('http://localhost:3000/image/DDR5_Corsair_Vengeance_RGB/62e10c35465c9f4e09582ba3.webp', FALSE),
('http://localhost:3000/image/DDR5_Corsair_Vengeance_RGB/62e10c3884f9a772d46d2bbb.webp', FALSE);

INSERT INTO produit_images (produit_id, image_id, position) VALUES 
(8, LAST_INSERT_ID()-2, 1),
(8, LAST_INSERT_ID()-1, 2),
(8, LAST_INSERT_ID(), 3);

-- Produit 9: DDR5 Kingston Fury Beast Black - 16 Go
INSERT INTO images (image_path, is_primary) VALUES 
('http://localhost:3000/image/DDR5_Kingston_Fury_Beast_Black/619e443aa5c58356de785070.webp', TRUE),
('http://localhost:3000/image/DDR5_Kingston_Fury_Beast_Black/619f8cef2572885fae3152d3.webp', FALSE),
('http://localhost:3000/image/DDR5_Kingston_Fury_Beast_Black/619f8cefce5de428736252b5.webp', FALSE);

INSERT INTO produit_images (produit_id, image_id, position) VALUES 
(9, LAST_INSERT_ID()-2, 1),
(9, LAST_INSERT_ID()-1, 2),
(9, LAST_INSERT_ID(), 3);

-- Produit 10: Hyte Y60 - Noir
INSERT INTO images (image_path, is_primary) VALUES 
('http://localhost:3000/image/Hyte_Y60/63b6c5838e47437635529d45(1).jpg', TRUE),
('http://localhost:3000/image/Hyte_Y60/63b6c5af807633062f1403e3(1).jpg', FALSE),
('http://localhost:3000/image/Hyte_Y60/63b6c5afeed7e1781e096c8d(1).jpg', FALSE),
('http://localhost:3000/image/Hyte_Y60/63b6cd8685d0c166f5406bbc.jpg', FALSE);

INSERT INTO produit_images (produit_id, image_id, position) VALUES 
(10, LAST_INSERT_ID()-3, 1),
(10, LAST_INSERT_ID()-2, 2),
(10, LAST_INSERT_ID()-1, 3),
(10, LAST_INSERT_ID(), 4);

-- Produit 11: Intel Core i5-14400F (2.5 GHz)
INSERT INTO images (image_path, is_primary) VALUES 
('http://localhost:3000/image/Intel_Core_i5-14400F/652ce8b4c560943d131b3070.webp', TRUE),
('http://localhost:3000/image/Intel_Core_i5-14400F/659bce4810aaba7be428dbb8.webp', FALSE),
('http://localhost:3000/image/Intel_Core_i5-14400F/659bcf2d9c03b422551afa74.webp', FALSE);

INSERT INTO produit_images (produit_id, image_id, position) VALUES 
(11, LAST_INSERT_ID()-2, 1),
(11, LAST_INSERT_ID()-1, 2),
(11, LAST_INSERT_ID(), 3);

-- Produit 12: Clavier gaming optique-mécanique K100 RGB
INSERT INTO images (image_path, is_primary) VALUES 
('http://localhost:3000/image/K100_RGB/K100_RGB_04.avif', TRUE),
('http://localhost:3000/image/K100_RGB/K100_RGB_05.avif', FALSE),
('http://localhost:3000/image/K100_RGB/K100_RGB_RENDER_FR_CH-912A01A-FR.avif', FALSE);

INSERT INTO produit_images (produit_id, image_id, position) VALUES 
(12, LAST_INSERT_ID()-2, 1),
(12, LAST_INSERT_ID()-1, 2),
(12, LAST_INSERT_ID(), 3);

-- Produit 13: Kingston NV3 1 To
INSERT INTO images (image_path, is_primary) VALUES 
('http://localhost:3000/image/Kingston_NV3/66a8af0c8aa42e58637dbbe6.webp', TRUE),
('http://localhost:3000/image/Kingston_NV3/66a8af33e4d06d27600b9efd.webp', FALSE),
('http://localhost:3000/image/Kingston_NV3/66a8af3af1e919583b22df43.webp', FALSE);

INSERT INTO produit_images (produit_id, image_id, position) VALUES 
(13, LAST_INSERT_ID()-2, 1),
(13, LAST_INSERT_ID()-1, 2),
(13, LAST_INSERT_ID(), 3);

-- Produit 14: MSI MAG32CQ6F (dalle incurvée)
INSERT INTO images (image_path, is_primary) VALUES 
('http://localhost:3000/image/MSI_MAG32CQ6F/1.webp', TRUE),
('http://localhost:3000/image/MSI_MAG32CQ6F/2.webp', FALSE),
('http://localhost:3000/image/MSI_MAG32CQ6F/3.webp', FALSE);

INSERT INTO produit_images (produit_id, image_id, position) VALUES 
(14, LAST_INSERT_ID()-2, 1),
(14, LAST_INSERT_ID()-1, 2),
(14, LAST_INSERT_ID(), 3);

-- Produit 15: Gigabyte Radeon RX 7800 XT GAMING OC
INSERT INTO images (image_path, is_primary) VALUES 
('http://localhost:3000/image/Radeon_RX_7800_XT/1.webp', TRUE),
('http://localhost:3000/image/Radeon_RX_7800_XT/2.webp', FALSE),
('http://localhost:3000/image/Radeon_RX_7800_XT/3.webp', FALSE);

INSERT INTO produit_images (produit_id, image_id, position) VALUES 
(15, LAST_INSERT_ID()-2, 1),
(15, LAST_INSERT_ID()-1, 2),
(15, LAST_INSERT_ID(), 3);

-- Produit 16: NVIDIA GeForce RTX 5090
INSERT INTO images (image_path, is_primary) VALUES 
('http://localhost:3000/image/RTX_5090_Phantom_GS/1.jpg', TRUE),
('http://localhost:3000/image/RTX_5090_Phantom_GS/2.jpg', FALSE),
('http://localhost:3000/image/RTX_5090_Phantom_GS/3.jpg', FALSE);

INSERT INTO produit_images (produit_id, image_id, position) VALUES 
(16, LAST_INSERT_ID()-2, 1),
(16, LAST_INSERT_ID()-1, 2),
(16, LAST_INSERT_ID(), 3);

-- Produit 17: Samsung SSD 990 Pro 2 To
INSERT INTO images (image_path, is_primary) VALUES 
('http://localhost:3000/image/Samsung_SSD_990_Pro/63063d1f4729d92be5430b2a.webp', TRUE),
('http://localhost:3000/image/Samsung_SSD_990_Pro/6306457fb465d24fd71ba1e6.webp', FALSE),
('http://localhost:3000/image/Samsung_SSD_990_Pro/6306458a57d67f1a4a113225.webp', FALSE);

INSERT INTO produit_images (produit_id, image_id, position) VALUES 
(17, LAST_INSERT_ID()-2, 1),
(17, LAST_INSERT_ID()-1, 2),
(17, LAST_INSERT_ID(), 3);

-- Produit 18: Thermalright Frozen Notte ARGB V2 Noir - 360 mm
INSERT INTO images (image_path, is_primary) VALUES 
('http://localhost:3000/image/Thermalright_Frozen_Notte/668e62a9403e1c099b56c00f.webp', TRUE),
('http://localhost:3000/image/Thermalright_Frozen_Notte/668e62b8ea349e6897441089.webp', FALSE),
('http://localhost:3000/image/Thermalright_Frozen_Notte/668e62bbc8591176f21639e4.webp', FALSE);

INSERT INTO produit_images (produit_id, image_id, position) VALUES 
(18, LAST_INSERT_ID()-2, 1),
(18, LAST_INSERT_ID()-1, 2),
(18, LAST_INSERT_ID(), 3);

-- Produit 19: MCHOSE G3 ULTRA 8K Wireless Blanc
INSERT INTO images (image_path, is_primary) VALUES 
('http://localhost:3000/image/MCHOSE_G3_ULTRA/MCHOSE-G3-Ultra-Blanc-1.webp', TRUE),
('http://localhost:3000/image/MCHOSE_G3_ULTRA/MCHOSE-G3-Ultra-Blanc-2-640x640.webp', FALSE),
('http://localhost:3000/image/MCHOSE_G3_ULTRA/MCHOSE-G3-Ultra-Blanc-3-640x640.webp', FALSE),
('http://localhost:3000/image/MCHOSE_G3_ULTRA/MCHOSE-G3-Ultra-Blanc-4-640x640.webp', FALSE);

INSERT INTO produit_images (produit_id, image_id, position) VALUES 
(19, LAST_INSERT_ID()-3, 1),
(19, LAST_INSERT_ID()-2, 2),
(19, LAST_INSERT_ID()-1, 3),
(19, LAST_INSERT_ID(), 4);

-- Produit 20: Razer Goliathus Extended Chroma
INSERT INTO images (image_path, is_primary) VALUES 
('http://localhost:3000/image/Razer_Goliathus/1.webp', TRUE),
('http://localhost:3000/image/Razer_Goliathus/2.webp', FALSE),
('http://localhost:3000/image/Razer_Goliathus/3.webp', FALSE);

INSERT INTO produit_images (produit_id, image_id, position) VALUES 
(20, LAST_INSERT_ID()-2, 1),
(20, LAST_INSERT_ID()-1, 2),
(20, LAST_INSERT_ID(), 3);