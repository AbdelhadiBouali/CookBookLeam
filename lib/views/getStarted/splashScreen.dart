import 'package:cookbook/controllers/getStartedController.dart';
import 'package:cookbook/tools/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dimens.height = MediaQuery.of(context)
        .size
        .height; // To initialize the Height and Width of diffrent screens (Responsivity)
    Dimens.width = MediaQuery.of(context).size.width; //

    final GetStartedController getStartedController =
        Get.put(GetStartedController());

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
              child: Container(
                  height: MediaQuery.of(context).size.height * .5,
                  // width: MediaQuery.of(context).size.width * .5,
                  // LOGO HERE
                  child: Text(
                    "App Logo",
                    style: Theme.of(context).textTheme.headline3,
                  )))),
    );
  }
}
