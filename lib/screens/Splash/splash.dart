import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/screens/signin/sign_in.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}


class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacementNamed(context, '/signin'
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child:const Center(
          child: Text(
            'Subscription',
            style: TextStyle(fontSize: 40,
                fontWeight: FontWeight.w500,
                color: Colors.black,
            letterSpacing: 0.05,
            decoration: TextDecoration.none),
          ),
        )
    );
  }
}
