import 'package:flutter/material.dart';
import '../app_const/myapp_const.dart';

class MyAppDrawer extends StatelessWidget {
  const MyAppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        AppBar(
          title: Text("data"),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.shop),
          title: Text('shop'),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
        ListTile(
          leading: Icon(Icons.payment),
          title: Text('Orders'),
          onTap: () {
            Navigator.of(context)
                .pushReplacementNamed(MyAppConst.cOrdersScreenRouteName);
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.payment),
          title: Text('Manage Product'),
          onTap: () {
            Navigator.of(context)
                .pushReplacementNamed(MyAppConst.cUserProductsScreenRouteName);
          },
        ),
      ]),
    );
  }
}
