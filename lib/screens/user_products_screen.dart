import 'package:flutter/material.dart';
import '../providers/products.dart';
import '../widgets/appbar.dart';
import '../widgets/user_product_item.dart';
import 'package:provider/provider.dart';

class UserProductsScreen extends StatelessWidget {
  const UserProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);

    return Scaffold(
      appBar: MyAppBar(
          clContext: context,
          clTitle: "Your Products",
          clActions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))]),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: productsData.items.length,
            itemBuilder: (context, index) {
              return UserProductItem(
                  title: productsData.items[index].title,
                  imageurl: productsData.items[index].imageurl);
            },
          )),
    );
  }
}
