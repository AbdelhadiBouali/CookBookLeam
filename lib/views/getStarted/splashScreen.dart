import 'package:cookbook/controllers/getStartedController.dart';
import 'package:cookbook/tools/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final GetStartedController getStartedController =
      Get.put(GetStartedController());

  @override
  Widget build(BuildContext context) {
    Dimens.Height = MediaQuery.of(context)
        .size
        .height; // To initialize the Height and Width of diffrent screens (Responsivity)
    Dimens.Width = MediaQuery.of(context).size.width; //
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Container(
                height: MediaQuery.of(context).size.height * .5,
                width: MediaQuery.of(context).size.width * .5,
                child: Text("App Logo"))));
  }
}
