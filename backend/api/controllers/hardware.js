const fs = require('fs');
const path = require('path');
const ClassName = require('../models/hardware');

exports.GetAllHardwareData = (req, res) => {
    const hardwares = HardwareData.hardwares;
    res.json(hardwares);
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

exports.GetHardwareImage = async (req, res) => {
    try {
        const id = parseInt(req.params.id);
        const imageIndex = parseInt(req.params.n);  // Index de l'image demandée
        const hardware = HardwareData.hardwares.find(h => h.id === id);

        if (!hardware) {
            return res.status(404).json({ success: false, message: 'Produit non trouvé' });
        }

        const imageDir = path.join(__dirname, '../../data/imgs/', hardware.folder_name);
        
        // Vérifie si le dossier existe
        if (!fs.existsSync(imageDir)) {
            return res.status(404).json({
                success: false,
                message: 'Dossier images introuvable',
                path: imageDir
            });
        }

        const files = fs.readdirSync(imageDir);
        
        const imageFiles = files.filter(file => 
            file.toLowerCase().endsWith(hardware.image_extension.toLowerCase())
        ).sort();

        if (imageIndex <= 0 || imageIndex > imageFiles.length) {
            return res.status(404).json({
                success: false,
                message: 'Index image invalide',
                availableImages: imageFiles.length,
                requestedIndex: imageIndex
            });
        }

        const imagePath = path.join(imageDir, imageFiles[imageIndex - 1]);

        if (!fs.existsSync(imagePath)) {
            return res.status(404).json({
                success: false,
                message: 'Fichier image spécifique introuvable',
                file: imageFiles[imageIndex - 1]
            });
        }

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