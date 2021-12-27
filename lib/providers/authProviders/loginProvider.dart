import 'dart:developer';

import 'package:cookbook/services/userState.dart';
import 'package:cookbook/views/home/homepage.dart';
import 'package:cookbook/views/sharedWidgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renovation_core/auth.dart';
import 'package:renovation_core/core.dart';

Future<void> loginApi(String email, String password) async {
  Get.dialog(Center(child: CircularProgressIndicator()));

  RequestResponse<FrappeSessionStatusInfo> loginResponse =
      await getFrappeAuthController().login(email, password);

  Get.back();

  if (loginResponse.isSuccess) {
    UserState.token = loginResponse.data.token;
    UserState.user.completeName = loginResponse.data.fullName;
    UserState.userIsLogged = true;
    await saveUser();
    Get.offAll(HomePage(),
        transition: Transition.rightToLeft, duration: Duration(seconds: 5));
  } else {
    // Showing a simple snackbar to the user
    customSnackbar(
        loginResponse.error.title, loginResponse.error.info.suggestion, 5);
  }
}
