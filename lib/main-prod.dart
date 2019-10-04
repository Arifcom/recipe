import 'package:flutter/material.dart';
import 'package:recipe/splash.dart';

import 'config.dart';
import 'main.dart';

void main() {
  Config.app_flavor = Flavor.PROD;
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Recipe',
    home: SplashPage(),
  ));
}