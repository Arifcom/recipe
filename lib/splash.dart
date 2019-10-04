import 'package:flutter/material.dart';
import 'package:recipe/modules/controllers/dessert_controller.dart';
import 'dart:async';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    startSplash();
  }
  startSplash() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          return DessertController();
        })
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff329cef),
      body: Center(
        child: Image.asset(
          "images/logo.png",
          width: 100.0,
          height: 100.0,
        )
      ),
    );
  }
}