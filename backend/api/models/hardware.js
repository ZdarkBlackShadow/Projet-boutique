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
			const query = `SELECT p.nom, p.description1, p.quantite, p.prix, p.reduction, p.rgb, p.categorie_id, f.nom AS fabricant_nom, c.nom AS categorie, p.compatible_intel, p.nom_dossier, p.extension_image FROM produits AS p INNER JOIN fabricants AS f ON p.fabricant_id = f.id INNER JOIN categories AS c ON categorie_id = c.id`;
			const [results] = await pool.query(query);
			return results;
		} catch (error) {
			console.error("Error message : ", error);
			throw error;
		}
	}
}

module.exports = ClassName

//boutique_hardware_db