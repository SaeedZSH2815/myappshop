import 'package:flutter/material.dart';
import '../app_const/myapp_const.dart';
import '../providers/orders.dart';
import '../screens/cart_screen.dart';
import '../screens/product_detail_screen.dart';
import './screens/products_overview_screen.dart';
import 'package:provider/provider.dart';
import './providers/products.dart';
import './providers/cart.dart';
import './screens/orders_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Orders(),
        ),
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.amber,
              titleTextStyle:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple, secondary: Colors.deepOrange),
          useMaterial3: true,
          primarySwatch: Colors.purple,
        ),
        /* Home Page */
        // home: const MyHomeScreen(),

        initialRoute: "/",
        routes: {
          "/": (context) => ProductsOverViewScreen(),
          MyAppConst.cProductDetailScreenRouteName: (context) =>
              ProductDetailScreen(),
          MyAppConst.cCartScreenRouteName: (context) => CartScreen(),
          MyAppConst.cOrdersScreenRouteName: (context) => OrdersScreen(),
        },
      ),
    );
  }
}
