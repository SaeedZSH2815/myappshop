import 'package:flutter/material.dart';
import '../app_const/myapp_const.dart';
import '../providers/products.dart';
import '../widgets/appbar.dart';
import '../widgets/user_product_item.dart';
import 'package:provider/provider.dart';

class UserProductsScreen extends StatefulWidget {
  const UserProductsScreen({super.key});

  @override
  State<UserProductsScreen> createState() => _UserProductsScreenState();
}

class _UserProductsScreenState extends State<UserProductsScreen> {
  void deleteProduct(String clid) {
    Provider.of<Products>(context, listen: false).deleteProduct(clid);

    MyAppConst().aShowSnackBar(context, "clid:$clid", 1000);

    print("clid" + clid);
  }

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);

    return Scaffold(
      appBar:
          MyAppBar(clContext: context, clTitle: "Your Products", clActions: [
        IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(MyAppConst.cEditProductScreenRouteName);
            },
            icon: Icon(Icons.add))
      ]),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: productsData.items.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  UserProductItem(
                    id: productsData.items[index].id,
                    title: productsData.items[index].title,
                    imageurl: productsData.items[index].imageurl,
                    fnDeleteItem: deleteProduct,
                    //  MyAppConst().aShowSnackBar(context, "Add Item ", 1000);
                  ),
                  Divider(),
                ],
              );
            },
          )),
    );
  }
}
