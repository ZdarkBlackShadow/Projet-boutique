const mysql = require('mysql2/promise');

const pool = new mysql.createPool({
	host: 'localhost',
	user: 'nati',
	password: 'hgnvouihbo6465:4',
    database: 'test2',
	connectionLimit: 10,
	queueLimit: 0,
	flags: '-NO_SCHEMA'
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