import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'product.dart';

class Products with ChangeNotifier {
  final List<Product> _items = [
    Product(
        id: "p4",
        title: "A Pen",
        price: 90.0,
        description: "",
        imageurl:
            "https://www.soorban.com/images/news/2022/06/1655089602_T0bZ5.jpg"),
    Product(
        id: "p5",
        title: "A Shert",
        price: 155.0,
        description: "",
        imageurl:
            "https://www.soorban.com/images/news/2022/06/1655089602_T0bZ5.jpg"),
    Product(
        id: "p6",
        title: "A Shert",
        price: 155.0,
        description: "",
        imageurl:
            "https://www.soorban.com/images/news/2021/11/1636616854_C7gX4.jpg"),
    Product(
        id: "p7",
        title: "A Shert",
        price: 155.0,
        description: "",
        imageurl:
            "https://xchap.com/60-thickbox_default/%DA%86%D8%A7%D9%BE-%D8%AA%DB%8C%D8%B4%D8%B1%D8%AA-%D9%85%D8%B4%DA%A9%DB%8C-%D8%B3%DB%8C%D8%A7%D9%87.jpg"),
    Product(
        id: "p8",
        title: "A Shert",
        price: 155.0,
        description: "",
        imageurl:
            "https://www.iranpooshak.com/wp-content/uploads/2019/07/x-1.jpg"),
  ];
  var isFavorite = false;

  List<Product> get items {
    if (isFavorite == false)
      return [..._items];
    // [..._items];
    else
      return _items.where((element) => element.isfav == true).toList();
  }

  Product findbyID(String clID) {
    return items.firstWhere((element) => element.id == clID);
  }

  void showFavoriteOnly() {
    isFavorite = true;
    notifyListeners();
  }

  void showAll() {
    isFavorite = false;
    notifyListeners();
  }

  void addProduct() {
    //_items.add(value)
    notifyListeners();
  }
}
