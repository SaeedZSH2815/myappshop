import 'package:flutter/material.dart';

class MyAppConst {
  static String cAppTitle = "My Shop";
  static String cProductDetailScreenRouteName = "/ProductDetailScreen";
  static String cCartScreenRouteName = "/CartScreen";
  static String cOrdersScreenRouteName = "/OrdersScreen";

  void aShowSnackBar(BuildContext clCtx, String clMsg, int clDuration) {
    ScaffoldMessenger.of(clCtx).hideCurrentSnackBar();
    SnackBar snackBar = SnackBar(
      content: Text(clMsg),
      duration: Duration(milliseconds: clDuration),
      action: SnackBarAction(
        label: "UNDO ",
        onPressed: () {},
      ),
    );
    ScaffoldMessenger.of(clCtx).showSnackBar(snackBar);
  }
}
