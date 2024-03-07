import 'package:flutter/material.dart';
import '../app_const/myapp_const.dart';
import '../providers/cart.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import '../providers/product.dart';
import '../widgets/image_provider.dart';

class ProductItem extends StatelessWidget {
  // ProductItem(
  //     {required this.aID, required this.aTitle, required this.aImageUrl});

  // final String aImageUrl;
  // final String aID;
  // final String aTitle;

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: true);
    final lCart = Provider.of<Cart>(context, listen: true);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
            leading: Consumer<Product>(
              builder: (context, value, child) => IconButton(
                icon: Icon(Icons.favorite,
                    color: product.isfav ? Colors.red : Colors.white),
                onPressed: () {
                  product.toggleFavoriteStatus();
                },
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                lCart.addItem(product.id, product.price, product.title);
                SnackBar snackBar = SnackBar(
                  content: Text("add item"),
                  duration: Duration(milliseconds: 2000),
                  action: SnackBarAction(
                    label: "UNDO ",
                    onPressed: () {},
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              color: Theme.of(context).colorScheme.secondary,
            ),
            backgroundColor: Colors.black54,
            title: Text(
              product.imageurl,
              textAlign: TextAlign.center,
            )),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
                MyAppConst.cProductDetailScreenRouteName,
                arguments: product.id);
            //   Navigator.of(context).push(MaterialPageRoute(
            //     builder: (context) => ProductDetailScreen(aTitle: aTitle),
            // ));
          },
          child: Image(
            image: const CustomNetworkImage(
                'https://flutter.github.io/assets-for-api-docs/assets/widgets/flamingos.jpg'),
            width: 100,
            height: 100,
          ), //   Image.asset("assets/images/A.jpg"),
          // product.imageurl,
          // fit: BoxFit.cover,
        ),
      ),
    );
  }
}
