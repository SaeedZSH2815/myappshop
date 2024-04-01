import 'package:flutter/material.dart';
import '../app_const/myapp_const.dart';

class UserProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageurl;
  final Function fnDeleteItem;

  UserProductItem(
      {required this.id,
      required this.title,
      required this.imageurl,
      required this.fnDeleteItem});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Container(
          child: Text(title),
          width: 10,
          constraints: BoxConstraints(minWidth: 0)),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageurl),
      ),
      trailing: Container(
        width: 100,
        constraints: BoxConstraints(minWidth: 110),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                    MyAppConst.cEditProductScreenRouteName,
                    arguments: id);
              },
              color: Theme.of(context).primaryColor,
              icon: Icon(Icons.edit)),
          IconButton(
              onPressed: () => fnDeleteItem(id),
              icon: const Icon(Icons.delete)),
        ]),
      ),
    );
  }
}
