const pool = require('../../config/db');

class ClassName {
	static async getObjectById(id) {
		try {
			const query = `SELECT * FROM produits WHERE id = ?`;
			const [results] = await pool.query(query, [id]);
			return results[0];
		} catch (error) {
			console.error("Error message : ", error);
			throw error;
		}
	}

	static async getAllObjects() {
		try {
			const query = `SELECT p.id, p.nom, p.intro, p.description1, p.description2, p.quantite, p.prix, p.reduction, p.rgb, p.categorie_id, f.nom AS fabricant_nom, c.nom AS categorie, p.compatible_intel, p.nom_dossier, p.extension_image FROM produits AS p INNER JOIN fabricants AS f ON p.fabricant_id = f.id INNER JOIN categories AS c ON categorie_id = c.id`;
			const [results] = await pool.query(query);
			return results;
		} catch (error) {
			console.error("Error message : ", error);
			throw error;
		}
	}

	static async createNewUser(email, password, username, firstname, lastname) {
		try {
			// Vérifier si l'utilisateur existe déjà
			let query = `SELECT * FROM users WHERE email = ?`;
			let [results] = await pool.query(query, [email]);
	
			if (results.length > 0) {
				// L'utilisateur existe déjà
				return null;
			}
			query = `INSERT INTO users (email, password, nom, prenom) VALUES (?, ?, ?, ?)`;
			await pool.query(query, [email, password, username, firstname, lastname]);
			query = `SELECT id FROM users WHERE email = ?`;
			[results] = await pool.query(query, [email]);
	
			return results[0];
	
		} catch (error) {
			console.error("Error message:", error);
			throw error;
		}
	}
	

	static async GetIdFromUser(email, password) {
		const query = `SELECT id FROM users WHERE email = ? AND password = ?`;
		const [results] = await pool.query(query, [email, password]);
	
		if (results.length === 0) {
			return null;
		}
	
		return results[0];
	}
	
	
}

module.exports = ClassName