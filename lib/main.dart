import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import '../app_const/myapp_const.dart';
import '../providers/orders.dart';
import './providers/products.dart';
import './providers/cart.dart';
import 'screens/all_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:firebase_core/firebase_core.dart';
//import '../screens/user_products_screen';

Future<void> main() async {
  await dotenv.load(fileName: "ap.env");
  String foo = dotenv.get('FOO');
  print(foo);
  // WidgetsFlutterBinding.ensureInitialized();
//  await Firebase.initializeApp();
  //final PackageInfo info = await PackageInfo.fromPlatform();

//  Future<Null> _initPackageInfo() async {
//         final PackageInfo info = await PackageInfo.fromPlatform();
//         setState(() {
//           _packageInfo = info;
//           packageName = info.packageName;
//           appName = info.appName;
//           buildNumber = info.buildNumber;
//         });
//       }

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
