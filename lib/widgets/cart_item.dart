import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';
import '../widgets/autils/utils.dart' as utils;

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
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Are You Sure?"),
              content: Text("Do You want to remove"),
              actions: [
                utils.AppUtils().aTextButton(
                    clChild: Text("Yes"),
                    clOnPressed: () {
                      Navigator.of(context).pop(true);
                    }),
                utils.AppUtils().aTextButton(
                    clChild: Text("No"),
                    clOnPressed: () {
                      Navigator.of(context).pop(false);
                    }),
              ],
            );
          },
        );
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
