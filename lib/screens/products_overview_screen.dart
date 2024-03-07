import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import '../widgets/appbar.dart';
import '../app_const/myapp_const.dart';
import '../widgets/products_grid.dart';
import '../widgets/badge.dart';
import '../providers/cart.dart';

enum FilterOptions { isFavorite, allShow }

class ProductsOverViewScreen extends StatelessWidget {
  ProductsOverViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productContainer = Provider.of<Products>(context);
    Provider.of<Cart>(context, listen: true);

    return Scaffold(
      appBar: MyAppBar(
          clContext: context,
          
          clTitle: MyAppConst.cAppTitle,
          clActions: [
            Consumer<Cart>(
              builder: (context, cart, child) => MyBadge(
                  child: IconButton(
                    icon: Icon(
                      Icons.shopping_cart,
                      size: 40,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(MyAppConst.cCartScreenRouteName);
                    },
                  ),
                  value: cart.itemCount.toString()),
            ),
            PopupMenuButton(
              onSelected: (FilterOptions value) {
                if (value == FilterOptions.isFavorite)
                  productContainer.showFavoriteOnly();
                else
                  productContainer.showAll();
              },
              icon: Icon(Icons.read_more, color: Colors.black),
              itemBuilder: (_) => [
                PopupMenuItem(
                  child: Icon(Icons.shopping_cart),
                  value: FilterOptions.isFavorite,
                ),
                PopupMenuItem(child: Text("All"), value: FilterOptions.allShow),
              ],
            ),
          ]),
      //  drawer: MyAppDrawer(),
      body: ProductsGrid(),
    );
  }
}
