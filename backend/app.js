const express = require('express');
const cors = require('cors');
const app = express();
const port = 3000;

app.use(cors({ origin: "*" }));
app.use(express.json());

const hardwareRoutes = require('./api/routes/hardware');
const orderRoutes = require('./api/routes/order');
app.use(hardwareRoutes);
app.use('/api', orderRoutes);

app.listen(port, () => {
    console.log(`Serveur lancé sur http://localhost:${port}`);
});