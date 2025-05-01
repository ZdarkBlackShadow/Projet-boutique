const pool = require('../../config/db');

class Order {
  static async createOrder(userId, products, adresse) {
    const connection = await pool.getConnection();
    try {
      await connection.beginTransaction();

      const [panierResult] = await connection.query(`
        INSERT INTO paniers (user_id, date_creation, date_modification, adresse)
        VALUES (?, NOW(), NOW(), ?)
      `, [userId, adresse]);

      const panierId = panierResult.insertId;

      const insertProductQuery = `
        INSERT INTO panier_produits (panier_id, produit_id, quantite)
        VALUES (?, ?, ?)
      `;

      for (const product of products) {
        await connection.query(insertProductQuery, [
          panierId,
          product.id,
          product.quantity || 1
        ]);
      }

      await connection.commit();
      return { panierId };
    } catch (error) {
      await connection.rollback();
      throw error;
    } finally {
      connection.release();
    }
  }
}

module.exports = Order;
