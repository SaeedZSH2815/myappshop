import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
  });
}

//-----------
class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    // ignore: unnecessary_null_comparison
    return _items == null ? 0 : _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, value) {
      total += value.price;
    });
    return total;
  }

  void addItem(
    String clProductId,
    double clPrice,
    String clTitle,
  ) {
    if (_items.containsKey(clProductId)) {
      _items.update(
          clProductId,
          (existsItem) => CartItem(
              id: clProductId,
              title: existsItem.title,
              quantity: existsItem.quantity,
              price: existsItem.price));
    } else {
      _items.putIfAbsent(
        clProductId,
        () {
          return CartItem(
              id: DateTime.now().toString(),
              title: clTitle,
              quantity: 10,
              price: clPrice);
        },
      );
    }
    notifyListeners();
  }

  void removeItem(String clProductID) {
    _items.remove(clProductID);
    notifyListeners();
  }

  void removeSingleItem(String productItemID) {
    if (!_items.containsKey(productItemID)) {
      return;
    }

    if (_items[productItemID]!.quantity > 0) {
      _items.update(
          productItemID,
          (value) => CartItem(
              id: value.id,
              title: value.title,
              quantity: value.quantity-1,
              price: value.price));
    } else {
      _items.remove(productItemID);
    }
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
