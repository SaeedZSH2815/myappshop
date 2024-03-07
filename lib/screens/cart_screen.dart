import 'package:flutter/material.dart';
import '../providers/orders.dart';
import '../widgets/appbar.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart' show Cart;
import '../widgets/cart_item.dart';
import '../widgets/app_drawer.dart';

// import '../providers/cart.dart' show Cart;
//import '../widgets/cart_item.dart' as di; gi.CartItem

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final orders = Provider.of<Orders>(context);
    print("cart : " + cart.toString());
    return Scaffold(
      appBar: MyAppBar(clContext: context, clTitle: "clTitle", clActions: []),
      drawer: MyAppDrawer(),
     
      body: Column(children: [
        Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(fontSize: 20),
                    ),
                    //SizedBox(height: 80),
                    Spacer(),
                    Chip(
                      label: Text(
                        '\$${cart.totalAmount}',
                        style: Theme.of(context).primaryTextTheme.titleSmall,
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                      onPressed: () {
                        orders.addOrder(
                            cart.items.values.toList(), cart.totalAmount);

                        cart.clear();
                      },
                      child: Text(
                          'Order Now : ' + orders.itemOrders.length.toString()),
                    )
                  ]),
            )),
        SizedBox(
          height: 10,
        ),
        Expanded(
            child: ListView.builder(
          itemCount: cart.itemCount,
          itemBuilder: (context, index) {
            return CartItem(
                productID: cart.items.keys.toList()[index],
                id: cart.items.values.toList()[index].id,
                price: cart.items.values.toList()[index].price,
                quantity: cart.items.values.toList()[index].quantity,
                title: cart.items.values.toList()[index].title);
          },
        ))
      ]),
    );
  }
}
