const mysql = require('mysql2/promise');

const pool = new mysql.createPool({
    host: 'localhost',
    user: 'nati',
    password: 'Hardarch@64',
    database: 'boutique_hardware_db',
    queueLimit: 0,
})