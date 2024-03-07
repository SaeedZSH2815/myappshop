import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class CartItem extends StatelessWidget {
  final String productID;
  final String id;
  final double price;
  final int quantity;
  final String title;

  const CartItem(
      {super.key,
      required this.productID,
      required this.id,
      required this.price,
      required this.quantity,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      onDismissed: (direction) {
        Provider.of<Cart>(context /*, listen: false*/).removeItem(productID);
      },
      direction: DismissDirection.endToStart,
      background: Container(
        color: Theme.of(context).colorScheme.error,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        child: Icon(Icons.delete),
      ),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListTile(
            leading: CircleAvatar(
                child: Padding(
                    padding: EdgeInsets.all(10),
                    child: FittedBox(
                        alignment: Alignment.center,
                        child: Text('\$${price}')))),
            title: Text(title),
            subtitle: Text('total : \$${price}'),
            trailing: Text('quantity : \$${price}'),
          ),
        ),
      ),
    );
  }
}
