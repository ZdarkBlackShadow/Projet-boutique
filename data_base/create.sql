-- Création de la table des catégories
CREATE TABLE categories (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL UNIQUE
);

-- Création de la table des fabricants
CREATE TABLE fabricants (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL UNIQUE
);

-- Création de la table principale des produits
CREATE TABLE produits (
    id INTEGER PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    intro TEXT,
    description1 TEXT NOT NULL,
    description2 TEXT,
    quantite INTEGER NOT NULL DEFAULT 0,
    prix DECIMAL(10, 2) NOT NULL,
    reduction INTEGER DEFAULT 0,
    rgb BOOLEAN NOT NULL DEFAULT FALSE,
    categorie_id INTEGER NOT NULL,
    fabricant_id INTEGER NOT NULL,
    compatible_intel BOOLEAN NOT NULL DEFAULT TRUE,
    nom_dossier VARCHAR(100) NOT NULL,
    extension_image VARCHAR(10) NOT NULL,
    date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (categorie_id) REFERENCES categories(id),
    FOREIGN KEY (fabricant_id) REFERENCES fabricants(id)
);

-- Table pour les caractéristiques de produits
CREATE TABLE caracteristiques (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    produit_id INTEGER NOT NULL,
    description VARCHAR(255) NOT NULL,
    FOREIGN KEY (produit_id) REFERENCES produits(id) ON DELETE CASCADE
);

-- Création de la table utilisateurs
CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    telephone VARCHAR(20),
    is_admin BOOLEAN DEFAULT FALSE,
    date_inscription TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    derniere_connexion TIMESTAMP,
    token_reset VARCHAR(100),
    expiration_token TIMESTAMP
);

-- Création de la table adresses
CREATE TABLE adresses (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    user_id INTEGER NOT NULL,
    adresse VARCHAR(255) NOT NULL,
    complement VARCHAR(255),
    code_postal VARCHAR(10) NOT NULL,
    ville VARCHAR(100) NOT NULL,
    pays VARCHAR(50) NOT NULL DEFAULT 'France',
    adresse_par_defaut BOOLEAN DEFAULT FALSE,
    facturation BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Création de la table commandes
CREATE TABLE commandes (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    user_id INTEGER NOT NULL,
    adresse_livraison_id INTEGER NOT NULL,
    adresse_facturation_id INTEGER NOT NULL,
    montant_total DECIMAL(10, 2) NOT NULL,
    statut VARCHAR(50) NOT NULL DEFAULT 'en attente',
    date_commande TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    reference VARCHAR(20) NOT NULL UNIQUE,
    methode_paiement VARCHAR(50),
    numero_suivi VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (adresse_livraison_id) REFERENCES adresses(id),
    FOREIGN KEY (adresse_facturation_id) REFERENCES adresses(id)
);

-- Création de la table détails des commandes
CREATE TABLE commande_details (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    commande_id INTEGER NOT NULL,
    produit_id INTEGER NOT NULL,
    quantite INTEGER NOT NULL,
    prix_unitaire DECIMAL(10, 2) NOT NULL,
    reduction_appliquee DECIMAL(10, 2) DEFAULT 0,
    FOREIGN KEY (commande_id) REFERENCES commandes(id) ON DELETE CASCADE,
    FOREIGN KEY (produit_id) REFERENCES produits(id)
);

-- Création de la table paniers
CREATE TABLE paniers (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    user_id INTEGER NOT NULL,
    date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    date_modification TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Création de la table produits dans le panier
CREATE TABLE panier_produits (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    panier_id INTEGER NOT NULL,
    produit_id INTEGER NOT NULL,
    quantite INTEGER NOT NULL DEFAULT 1,
    FOREIGN KEY (panier_id) REFERENCES paniers(id) ON DELETE CASCADE,
    FOREIGN KEY (produit_id) REFERENCES produits(id)
);

-- Table pour les avis/commentaires sur les produits
CREATE TABLE avis (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    produit_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    note INTEGER NOT NULL CHECK (note BETWEEN 1 AND 5),
    commentaire TEXT,
    date_avis TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    approuve BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (produit_id) REFERENCES produits(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Table pour la liste de souhaits (wishlist)
CREATE TABLE liste_souhaits (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    user_id INTEGER NOT NULL,
    produit_id INTEGER NOT NULL,
    date_ajout TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (produit_id) REFERENCES produits(id),
    UNIQUE(user_id, produit_id)
);

-- Table pour les coupons/codes promo
CREATE TABLE coupons (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    code VARCHAR(20) NOT NULL UNIQUE,
    type VARCHAR(20) NOT NULL, -- pourcentage, montant fixe, livraison gratuite
    valeur DECIMAL(10, 2),
    minimum_commande DECIMAL(10, 2) DEFAULT 0,
    date_debut TIMESTAMP NOT NULL,
    date_fin TIMESTAMP NOT NULL,
    usage_unique BOOLEAN DEFAULT FALSE,
    usage_max INTEGER,
    usage_actuel INTEGER DEFAULT 0
);

-- Création d'index pour améliorer les performances
CREATE INDEX idx_produits_categorie ON produits(categorie_id);
CREATE INDEX idx_produits_fabricant ON produits(fabricant_id);
CREATE INDEX idx_caracteristiques_produit ON caracteristiques(produit_id);
CREATE INDEX idx_produits_nom ON produits(nom);
CREATE INDEX idx_produits_prix ON produits(prix);
CREATE INDEX idx_produits_reduction ON produits(reduction);
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_adresses_user ON adresses(user_id);
CREATE INDEX idx_commandes_user ON commandes(user_id);
CREATE INDEX idx_commandes_reference ON commandes(reference);
CREATE INDEX idx_commande_details_commande ON commande_details(commande_id);
CREATE INDEX idx_commande_details_produit ON commande_details(produit_id);
CREATE INDEX idx_paniers_user ON paniers(user_id);
CREATE INDEX idx_panier_produits_panier ON panier_produits(panier_id);
CREATE INDEX idx_panier_produits_produit ON panier_produits(produit_id);
CREATE INDEX idx_avis_produit ON avis(produit_id);
CREATE INDEX idx_avis_user ON avis(user_id);
CREATE INDEX idx_liste_souhaits_user ON liste_souhaits(user_id);
CREATE INDEX idx_coupons_code ON coupons(code);