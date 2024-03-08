import 'package:flutter/material.dart';

class UserProductItem extends StatelessWidget {
  final String title;
  final String imageurl;

  UserProductItem({required this.title, required this.imageurl});
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
              onPressed: () {},
              color: Theme.of(context).primaryColor,
              icon: Icon(Icons.edit)),
          IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
        ]),
      ),
    );
  }
}
