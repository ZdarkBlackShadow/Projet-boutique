const fs = require('fs');
const path = require('path');
const ClassName = require('../models/hardware');

exports.GetAllHardwareData = async (req, res) => {
    const hardwares = await ClassName.getAllObjects();

    if (!hardwares) {
        return res.status(404).json({
            message : "hardwares not found"
        });
    }

    res.status(200).json({
        message:"hardwares found",
        hardwares
    });
};

exports.GetHardwareById = async (req, res) => {
    const id = parseInt(req.params.id);

    //dans la méthode
    const hardware = await ClassName.getObjectById(id)

    if (!hardware) {
        return res.status(404).json({
            message : "hardware not found"
        });
    }

    res.status(200).json({
        message:"hardware found",
        hardware
    });
};

exports.GetNumberOfHardwareImage = async (req, res) => {
    try {
        const id = parseInt(req.params.id);
        const hardware = HardwareData.hardwares.find(h => h.id === id);

        if (!hardware) {
            return res.status(404).json({ message: 'Hardware not found' });
        }

        const imagePath = path.join(__dirname, `../data/imgs/${hardware.folder_name}`);
        if (!fs.existsSync(imagePath)) {
            return res.status(200).json({
                message: "Dossier d'images trouvé mais vide",
                numberOfImage: 0
            });
        }

        const result = await countFiles(imagePath, hardware.image_extension);

        res.status(200).json({
            message: "Images trouvées",
            numberOfImage: result.count,
            files: result.files
        });
    } catch (error) {
        console.error(error);
        res.status(500).json({ 
            message: "Erreur serveur",
            error: error.message 
        });
    }
};

exports.GetHardwareImage = async (req, res) => {
    try {
        const id = parseInt(req.params.id);
        const imageIndex = parseInt(req.params.n);  // Index de l'image demandée (commence à 1)

        const hardware = await ClassName.getObjectById(id);
        if (!hardware) {
            return res.status(404).json({
                success: false,
                message: 'Matériel introuvable'
            });
        }

        const hardwareDir = path.join(__dirname, '../../data/imgs/', hardware.nom_dossier);
        
        // Vérifier si le dossier existe
        if (!fs.existsSync(hardwareDir)) {
            return res.status(404).json({
                success: false,
                message: 'Dossier du matériel introuvable',
                path : hardwareDir
            });
        }

        // Lire tous les fichiers du dossier
        const allFiles = fs.readdirSync(hardwareDir);
        
        // Filtrer les fichiers qui ont la bonne extension
        const imageFiles = allFiles.filter(file => 
            file.endsWith(hardware.extension_image)
        ).sort(); // Tri pour un ordre cohérent

        // Vérifier si l'index demandé est valide
        if (imageIndex < 1 || imageIndex > imageFiles.length) {
            return res.status(404).json({
                success: false,
                message: 'Index image invalide',
                availableImages: imageFiles.length
            });
        }

        // Construire le chemin de l'image demandée (n-1 car l'index commence à 0)
        const imagePath = path.join(hardwareDir, imageFiles[imageIndex - 1]);

        res.sendFile(imagePath);

    } catch (error) {
        console.error('Erreur:', error);
        res.status(500).json({
            success: false,
            message: 'Erreur serveur',
            error: error.message
        });
    }
};

exports.Login = async (req, res) => {
    try {
        const { email, password } = req.body;
        const userId = await ClassName.GetIdFromUser(email, password);
        if (userId) {
            res.status(200).json({ message: 'Connexion réussie', userId });
          } else {
            res.status(401).json({ message: 'Identifiants invalides' });
          }
    } catch (error) {
        console.error('Erreur:', error);
        res.status(500).json({
            success: false,
            message: 'Erreur serveur',
            error: error.message
        });
    }
};

exports.Register = async (req, res) => {
    try {
        const { email, firstName, lastname, password } = req.body;

        const userId = await ClassName.createNewUser(email, password, firstName, lastname)
        
        if (userId) {
            res.status(200).json({ message: 'Adding user sucees', userId });
          } else {
            res.status(401).json({ message: 'Identifiants invalides' });
          }
    } catch (error) {
        console.error('Erreur:', error);
        res.status(500).json({
            success: false,
            message: 'Erreur serveur',
            error: error.message
        });
    }
};

const Order = require('../models/order');

exports.Checkout = async (req, res) => {
    try {
        const { userId, products, address } = req.body;

        if (!userId || !products || !address) {
            return res.status(400).json({ message: 'Missing required fields' });
        }
        console.log(address)

        // Convertir l'adresse en ID numérique

        const { orderId, reference, totalAmount } = await Order.createOrder(
            userId, 
            products, 
            address,
        );

        res.status(200).json({ 
            message: 'Checkout successful', 
            orderId,
            reference,
            totalAmount
        });
    } catch (error) {
        console.error('Erreur:', error);
        res.status(500).json({
            success: false,
            message: 'Erreur serveur',
            error: error.message
        });
    }
};

async function countFiles(directoryPath, extension) {
    return new Promise((resolve, reject) => {
        fs.readdir(directoryPath, (err, files) => {
            if (err) {
                reject(err);
                return;
            }

            const filteredFiles = files
                .filter(file => path.extname(file).toLowerCase() === extension)
                .sort();

            resolve({
                count: filteredFiles.length,
                files: filteredFiles
            });
        });
    });
};