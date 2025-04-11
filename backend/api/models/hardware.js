const pool = require('../../config/db');

class ClassName {
	static async getObjectById(id){
		try {
			const query = `SELECT * FROM produits WHERE id = ?`;
			const [results] = await pool.query(query, [id]);
			return results[0];
		} catch (error) {
			console.error("Error message : ", error);
			throw error;
		}
	}
}

module.exports = ClassName

//boutique_hardware_db