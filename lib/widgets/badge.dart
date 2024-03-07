import 'package:flutter/material.dart';

class MyBadge extends StatelessWidget {
  final Widget child;
  final String value;
  final Color color;

  const MyBadge(
      {super.key,
      required this.child,
      required this.value,
      this.color = Colors.red});

  @override
  Widget build(BuildContext context) {
    return Stack(
      // alignment: Alignment.center,
      children: [
        child,
        Positioned(
            right: 8,
            top: 5,
            child: Container(
              padding: EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: color != null
                    ? Colors.black
                    : Theme.of(context).colorScheme.secondary,
              ),
              constraints: BoxConstraints(minHeight: 16, minWidth: 16),
              child: Text(
                value,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 10, color: Colors.white),
              ),
            ))
      ],
    );
  }
}
