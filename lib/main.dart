import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yourhealth/data/services/auth_services.dart';
import 'package:yourhealth/view/widgets/auth_checker.dart';
import 'Product/providers/cart.dart';
import 'Product/providers/orders.dart';
import 'Product/providers/products.dart';
import 'Product/screens/cart_screen.dart';
import 'Product/screens/edit_product_screen.dart';
import 'Product/screens/orders_screen.dart';
import 'Product/screens/shopping_completed_screen.dart';
import 'Product/screens/user_products_screen.dart';
import 'view/pages/auth_dashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthenticationService().user,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: Products(),
          ),
          ChangeNotifierProvider.value(
            value: Cart(),
          ),
          ChangeNotifierProvider.value(
            value: Orders(),
          ),
        ],
        child: MaterialApp(
            title: 'Your Health',
            theme: ThemeData(
              primarySwatch: Colors.deepPurple,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            debugShowCheckedModeBanner: false,
            home: AuthChecker(),
            routes: {
              // ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
              CartScreen.routeName: (ctx) => CartScreen(),
              OrdersScreen.routeName: (ctx) => OrdersScreen(),
              UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
              EditProductScreen.routeName: (ctx) => EditProductScreen(),
              ShoppingCompletedScreen.routeName: (ctx) =>
                  ShoppingCompletedScreen(),
            }),
      ),
    );
  }
}
