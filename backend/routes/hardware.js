const express = require('express');

const routeur = express.Router();

const controlleur = require('../controllers/hardware');

routeur.get("/hardwares", controlleur.GetAllHardwareData);
routeur.get("/hardware/:id", controlleur.GetHardwareById);
routeur.get("/hardware/:id/image", controlleur.GetNumberOfHardwareImage);
routeur.get("/hardware/:id/image/:n", controlleur.GetHardwareImage);

module.exports = routeur;