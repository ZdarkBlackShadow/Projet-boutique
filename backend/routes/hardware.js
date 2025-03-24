const express = require('express');

const routeur = express.Router();

const controlleur = require('../controllers/hardware');

routeur.get("/hardwares", controlleur.GetAllHardwareData);
routeur.get("/hardaware:id", controlleur.GetHardwareById);

module.exports = routeur;