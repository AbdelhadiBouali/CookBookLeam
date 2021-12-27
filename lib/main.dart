import 'package:cookbook/views/getStarted/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(CookBookApp());
}

class CookBookApp extends StatelessWidget {
  const CookBookApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // Using Getx for State Management, animations and routes
      title: 'CookBook App',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      defaultTransition: Transition.rightToLeft,
    );
  }
}
