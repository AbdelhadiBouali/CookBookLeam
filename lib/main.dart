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
      title: 'CookBook App',
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.rightToLeft,
    );
  }
}
