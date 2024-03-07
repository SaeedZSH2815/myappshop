import 'package:flutter/material.dart';
import '../app_const/myapp_const.dart';
import '../widgets/appbar.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  ProductDetailScreen();

  @override
  Widget build(BuildContext context) {
    final productID = ModalRoute.of(context)!.settings.arguments as String;

    final loadProduct = Provider.of<Products>(context).findbyID(productID);

    return Scaffold(
      appBar: MyAppBar(
          clContext: context, clTitle: loadProduct.title, clActions: []),
    );
  }
}
