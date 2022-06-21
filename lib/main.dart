import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/screens/Splash/splash.dart';
import 'package:flutter_app/screens/home/home_screen.dart';
import 'package:flutter_app/screens/plans/plans.dart';
import 'package:flutter_app/screens/settlement/Earnings/earnings.dart';
import 'package:flutter_app/screens/settlement/settlement.dart';
import 'package:flutter_app/screens/signin/sign_in.dart';
import 'package:flutter_app/screens/sold_subscriptions/sold_subscription.dart';
import 'package:flutter_app/screens/stocks/stocks.dart';
import 'package:flutter_app/screens/sub_seller/onboard_seller.dart';
import 'package:flutter_app/screens/sub_seller/sub_seller.dart';
import 'package:flutter_app/screens/support/support.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}


final ThemeData _themeData = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey)
        .copyWith(secondary: Colors.white),
    primaryColor: Colors.blueGrey,
    fontFamily: 'poppins_regular',
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey.shade900,
      elevation: 0,
      centerTitle: true,
    ));


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Seller App',
      theme: _themeData,
      routes: {
        '/': (context) => const Splash(),
        '/signin': (context) => const SignIn(),
        '/home': (context) => const HomeScreen(),
        '/plans': (context) => const Plans(),
        '/stocks': (context) => const Stocks(),
        '/sold_subscription': (context) => const SoldSubscription(),
        '/sub_seller': (context) => const SubSeller(),
        '/onboard_seller': (context) => const OnboardSeller(),
        '/settlement': (context) => const Settlement(),
        '/earnings': (context) => const Earnings(),
        '/support': (context) => const Support(),
      },
    );
  }
}

