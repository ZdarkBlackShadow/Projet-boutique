const express = require('express');
const app = express();
const port = 3000;

const cors = require('cors');
app.use(cors({
    origin:"*"
}));

const hardawareRoutes = require('./api/routes/hardware');

app.use(hardawareRoutes);

app.listen(port, () => {
    console.log(`Serveur lancé sur http://localhost:${port}`);
});