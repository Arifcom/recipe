import 'package:flutter/material.dart';

enum Flavor {
  DEV,
  PROD,
}

class Config {
  static Flavor app_flavor;

  static String get app_string {
    switch (app_flavor) {
      case Flavor.DEV:
        return 'DEVELOPMENT';
        break;
      case Flavor.PROD:
        return 'PRODUCTION';
        break;
      default:
        return 'MAIN';
        break;
    }
  }
}