import 'package:flutter/material.dart';
import '../widgets/appbar.dart';
import '../app_const/myapp_const.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
          clContext: context, clTitle: MyAppConst.cAppTitle, clActions: []),
      body: Center(child: Text("Shop")),
    );
  }
}
