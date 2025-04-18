const express = require('express');

const routeur = express.Router();

const controlleur = require('../controllers/hardware');

routeur.get("/produits", controlleur.GetAllHardwareData);
routeur.get("/produits/:id", controlleur.GetHardwareById);
routeur.get("/produits/:id/image", controlleur.GetNumberOfHardwareImage);
routeur.get("/produits/:id/image/:n", controlleur.GetHardwareImage);

module.exports = routeur;