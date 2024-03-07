import 'package:flutter/material.dart';

class MyAppConst {
  static String cAppTitle = "My Shop";
  static String cProductDetailScreenRouteName = "/ProductDetailScreen";
  static String cCartScreenRouteName = "/CartScreen";
  static String cOrdersScreenRouteName = "/OrdersScreen";

  void aShowSnackBar(BuildContext clCtx, String clMsg, int clDuration) {
    ScaffoldMessenger.of(clCtx).hideCurrentSnackBar();
    SnackBar snackBar = SnackBar(
      backgroundColor: Colors.black45,
      content: Container(
        child: Text(clMsg),
        margin: EdgeInsets.all(10),
      ),
      duration: Duration(milliseconds: clDuration),
      action: SnackBarAction(
        label: "UNDO ",
        onPressed: () {},
      ),
    );
    ScaffoldMessenger.of(clCtx).showSnackBar(snackBar);
  }
}
