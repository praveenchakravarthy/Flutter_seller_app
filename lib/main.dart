import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/screens/home/home_screen.dart';
import 'package:flutter_app/screens/signin/sign_in.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      theme: ThemeData(
        backgroundColor: Colors.white
      ),
      routes: {
        '/': (context) => const SignIn(),
        '/home': (context) => const HomeScreen(),
        // '/subscription': (context) => const Subscription(),
      },
    );
  }
}

