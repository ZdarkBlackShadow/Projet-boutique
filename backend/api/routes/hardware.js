const express = require('express');

const routeur = express.Router();

const controlleur = require('../controllers/hardware');

//get
routeur.get("/produits", controlleur.GetAllHardwareData);
routeur.get("/produits/:id", controlleur.GetHardwareById);
routeur.get("/produits/:id/images", controlleur.GetNumberOfHardwareImage);
routeur.get("/produits/:id/images/:n", controlleur.GetHardwareImage);

//post
routeur.post("/login", controlleur.Login)
routeur.post("/register", controlleur.Register)
routeur.post("/checkout", controlleur.Checkout)

module.exports = routeur;