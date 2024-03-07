import 'package:flutter/material.dart';
import './cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem(
      {required this.id,
      required this.amount,
      required this.products,
      required this.dateTime});
}

class Orders with ChangeNotifier {
  List<OrderItem> _itemOrders = [];

  List<OrderItem> get itemOrders {
    return [..._itemOrders];
  }

  void addOrder(List<CartItem> cartProducts, double total) {
    _itemOrders.insert(
        0,
        OrderItem(
            id: DateTime.now().toString(),
            amount: total,
            products: cartProducts,
            dateTime: DateTime.now()));
    notifyListeners();
  }

  void removeItem(String productId) {}
}
