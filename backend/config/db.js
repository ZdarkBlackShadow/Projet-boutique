const mysql = require('mysql2/promise');

const pool = new mysql.createPool({
	host: 'localhost',
	user: 'nati',
	password: 'Hardarch@64',
    database: 'test2',
	connectionLimit: 10,
	queueLimit: 0,
});

pool.getConnection()
	.then((connection) => {
		console.log("Connected to the database!");
		connection.release();
	})
	.catch((error) => {
		console.log("not connected to the database", error);
	});

module.exports = pool;