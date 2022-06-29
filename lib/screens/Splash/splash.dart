import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}


class _SplashState extends State<Splash> {
  final GetStorage box = GetStorage();

  @override
  void initState() {
    super.initState();
    _checkUser();
  }

  _checkUser() async {
    var user = box.hasData('user') ? await jsonDecode(box.read('user')) : {'token': null};

    if (user != null) {
      var token = user['token'];

      Timer(
          const Duration(seconds: 3), ()=>{

        if(token == null || token.toString().isEmpty){
          Navigator.pushReplacementNamed(context, '/signin')
        } else {
          Navigator.pushReplacementNamed(context, '/home')
        }
      }
      );

    } else {
      // Login
      Navigator.pushReplacementNamed(context, '/signin');

    }
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
