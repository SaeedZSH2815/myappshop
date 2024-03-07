import 'package:flutter/material.dart';

class MyAppBar extends AppBar {
  final String clTitle;
  final BuildContext clContext;
  final List<Widget> clActions;
  MyAppBar(
      {super.key,
      required this.clContext,
      required this.clTitle,
      required this.clActions})
      : super(
            title: Text(clTitle),
            foregroundColor: Theme.of(clContext).appBarTheme.backgroundColor,
            elevation: 0.2,
            actions: clActions
            // [
            //   PopupMenuButton(
            //     onSelected: (value) {
            //       print(value);
            //     },
            //     icon: Icon(Icons.read_more, color: Colors.black),
            //     itemBuilder: (_) => [
            //       PopupMenuItem(
            //         child: Icon(Icons.abc_outlined),
            //       ),
            //       PopupMenuItem(child: Text("bhhjh")),
            //     ],
            //   )
            // ]

            );
}
