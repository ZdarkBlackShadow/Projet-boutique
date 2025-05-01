const Order = require('../models/order');

exports.createOrder = async (req, res) => {
  try {
    const { userId, products, adresseLivraisonId, adresseFacturationId } = req.body;

    if (!userId || !products || !adresseLivraisonId || !adresseFacturationId) {
      return res.status(400).json({ error: 'Missing required fields' });
    }

    const orderId = await Order.createOrder(userId, products, adresseLivraisonId, adresseFacturationId);

    return res.status(201).json({ message: 'Order created successfully', orderId });
  } catch (error) {
    console.error('Error creating order:', error);
    return res.status(500).json({ error: 'Internal server error' });
  }
};

exports.getOrderById = async (req, res) => {
  try {
    const { id } = req.params;
    const order = await Order.getOrderById(id);
    if (!order) {
      return res.status(404).json({ error: 'Order not found' });
    }
    return res.json(order);
  } catch (error) {
    console.error('Error fetching order:', error);
    return res.status(500).json({ error: 'Internal server error' });
  }
};

exports.getOrdersByUserId = async (req, res) => {
  try {
    const { userId } = req.params;
    const orders = await Order.getOrdersByUserId(userId);
    return res.json(orders);
  } catch (error) {
    console.error('Error fetching orders:', error);
    return res.status(500).json({ error: 'Internal server error' });
  }
};
