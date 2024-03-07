import 'package:flutter/material.dart';

class AppUtils {
  Widget aTextButton({required Widget clChild, required Function clOnPressed}) {
    return TextButton(
        onPressed: () {
          clOnPressed();
        },
        child: clChild);
  }
}
