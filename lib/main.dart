import 'package:e_commerce_and_chat_apps/pages/cart_page.dart';
import 'package:e_commerce_and_chat_apps/pages/checkout_page.dart';
import 'package:e_commerce_and_chat_apps/pages/checkout_success_page.dart';
import 'package:e_commerce_and_chat_apps/pages/edit_profile_page.dart';
import 'package:e_commerce_and_chat_apps/pages/home/main_page.dart';
import 'package:e_commerce_and_chat_apps/pages/sign_in_page.dart';
import 'package:e_commerce_and_chat_apps/pages/sign_up_page.dart';
import 'package:e_commerce_and_chat_apps/pages/splash_page.dart';
import 'package:e_commerce_and_chat_apps/providers/auth_provider.dart';
import 'package:e_commerce_and_chat_apps/providers/cart_provider.dart';
import 'package:e_commerce_and_chat_apps/providers/product_provider.dart';
import 'package:e_commerce_and_chat_apps/providers/transaction_provider.dart';
import 'package:e_commerce_and_chat_apps/providers/wishlist_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishlistProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TransactionProvider(),
        ),
      ],
      child: MaterialApp(
        routes: {
          '/': (context) => const SplashPage(),
          '/sign-in': (context) => SignIn(),
          '/sign-up': (context) => SignUp(),
          '/home': (context) => const MainPage(),
          '/edit-profile': (context) => const EditProfile(),
          '/cart': (context) => const CartPage(),
          '/checkout': (context) => const CheckoutPage(),
          '/checkout-success': (context) => const CheckoutSuccessPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
