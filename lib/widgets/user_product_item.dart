import 'package:flutter/material.dart';

class UserProductItem extends StatelessWidget {
  final String title;
  final String imageurl;

  UserProductItem({required this.title, required this.imageurl});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageurl),
      ),
      trailing: Row(children: [
        IconButton(
            onPressed: () {},
            color: Theme.of(context).primaryColor,
            icon: Icon(Icons.edit)),
        IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
        IconButton(
            onPressed: () {},
            color: Theme.of(context).colorScheme.error,
            icon: Icon(Icons.add)),
      ]),
    );
  }
}
