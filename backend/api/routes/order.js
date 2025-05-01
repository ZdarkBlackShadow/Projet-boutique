const express = require('express');
const router = express.Router();
const orderController = require('../controllers/order');

router.post('/orders', orderController.createOrder);
router.get('/orders/:id', orderController.getOrderById);
router.get('/orders/user/:userId', orderController.getOrdersByUserId);

module.exports = router;
