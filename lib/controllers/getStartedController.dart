import 'dart:async';
import 'dart:io';
import 'package:cookbook/services/userState.dart';
import 'package:cookbook/services/userState.dart';
import 'package:cookbook/views/getStarted/getStartedScreen.dart';
import 'package:cookbook/views/getStarted/noConnectionScreen.dart';
import 'package:cookbook/views/home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// This controller is created to manage the state of the splash screen and getting started screens

class GetStartedController extends GetxController {
  var currentPage = 0.obs; // Observable
  final PageController pageController =
      PageController(initialPage: 0); // Page builder controller

  // Function to control the slide items

  void slideController() {
    try {
      Timer.periodic(Duration(seconds: 5), (Timer timer) {
        if (currentPage < 2) {
          currentPage++;
        } else {
          currentPage(0);
        }
        pageController.animateToPage(
          currentPage.value,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      });
    } catch (e) {}
  }

  // Take the user to Get started screen or Home Screen if internet available
  // Take the user to the no connection screen if it's not the case

  void pageDirection() {
    Future.delayed(Duration(seconds: 3)).then((_) async {
      try {
        final result = await InternetAddress.lookup('google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          // We should verify the User State (Logged in or not), and take the user to welcome screen or homepage
          UserState.userIsLogged == true
              ? Get.offAll(HomePage(),
                  transition: Transition.fade, duration: Duration(seconds: 1))
              : Get.offAll(GetStartedScreen(),
                  transition: Transition.fade, duration: Duration(seconds: 1));
        }
      } on SocketException catch (_) {
        Get.offAll(NoConnectionScreen());
      }
    });
  }

  @override
  void onInit() async {
    pageDirection();
    slideController();
    super.onInit();
  }

  @override
  void dispose() {
    pageController.dispose();

    super.dispose();
  }
}
