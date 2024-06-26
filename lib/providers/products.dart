import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'product.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Products with ChangeNotifier {
  final List<Product> _items = [
    Product(
        id: "1",
        title: "A Pen",
        price: 90.0,
        description: "",
        imageurl:
            "https://www.soorban.com/images/news/2022/06/1655089602_T0bZ5.jpg"),
    Product(
        id: "2",
        title: "A Shert",
        price: 155.0,
        description: "",
        imageurl:
            "https://www.soorban.com/images/news/2022/06/1655089602_T0bZ5.jpg"),
    Product(
        id: "3",
        title: "A Shert",
        price: 155.0,
        description: "",
        imageurl:
            "https://www.soorban.com/images/news/2021/11/1636616854_C7gX4.jpg"),
    Product(
        id: "4",
        title: "A Shert",
        price: 155.0,
        description: "",
        imageurl:
            "https://xchap.com/60-thickbox_default/%DA%86%D8%A7%D9%BE-%D8%AA%DB%8C%D8%B4%D8%B1%D8%AA-%D9%85%D8%B4%DA%A9%DB%8C-%D8%B3%DB%8C%D8%A7%D9%87.jpg"),
    Product(
        id: "5",
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
    if (clID == '0') {
      return Product(
          description: '',
          id: '',
          imageurl: '',
          price: 0,
          title: '',
          isfav: false);
    } else {
      return items.firstWhere((element) => element.id == clID);
    }
  }

  void showFavoriteOnly() {
    isFavorite = true;
    notifyListeners();
  }

  void showAll() {
    isFavorite = false;
    notifyListeners();
  }

  void addProduct(Product clProduct) {
    final url = Uri.parse(
        'https://flutter-update-ca55a-default-rtdb.firebaseio.com/Products.json');
    //ar url = Uri.https(
    //  'https://myappshop-7cbe3-default-rtdb.firebaseio.com/Products.json');
    http.post(url,
        body: json.encode({
          'id': '125',
          'title': clProduct.title,
          'description': clProduct.description,
          'price': clProduct.price,
          'imageurl': clProduct.imageurl
        }));
    /*final lNewProduct = Product(
        id: DateTime.now().toString(),
        title: clProduct.title,
        description: clProduct.description,
        price: clProduct.price,
        imageurl: clProduct.imageurl);
    _items.add(lNewProduct);

     */
    notifyListeners();
  }

  void updateProduct(Product clProduct) {
    final lNewProduct = Product(
        id: DateTime.now().toString(),
        title: clProduct.title,
        description: clProduct.description,
        price: clProduct.price,
        imageurl: clProduct.imageurl);
    _items.add(lNewProduct);
    final lIndex = _items.indexWhere((element) => element.id == clProduct.id);
    if (lIndex >= 0) _items[lIndex] = clProduct;
    notifyListeners();
  }

  void deleteProduct(String clid) {
    _items.removeWhere((element) => element.id == clid);
    notifyListeners();
  }
}
