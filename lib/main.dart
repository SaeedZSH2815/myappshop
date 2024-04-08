import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_const/myapp_const.dart';
import '../providers/orders.dart';
import './providers/products.dart';
import './providers/cart.dart';
import 'screens/all_screen.dart';
//import '../screens/user_products_screen';

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
          MyAppConst.cUserProductsScreenRouteName: (context) =>
              UserProductsScreen(),
          MyAppConst.cEditProductScreenRouteName: (context) =>
              EditProductScreen(),
        },
      ),
    );
  }
}
/*



plugins {
  id("com.android.application")

  // Add the Google services Gradle plugin
  id("com.google.gms.google-services")

  ...
}

dependencies {
  // Import the Firebase BoM
  implementation(platform("com.google.firebase:firebase-bom:32.8.0"))


  // TODO: Add the dependencies for Firebase products you want to use
  // When using the BoM, don't specify versions in Firebase dependencies
  implementation("com.google.firebase:firebase-analytics")


  // Add the dependencies for any other desired Firebase products
  // https://firebase.google.com/docs/android/setup#available-libraries
} */
