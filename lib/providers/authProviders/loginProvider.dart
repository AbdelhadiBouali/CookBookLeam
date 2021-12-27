import 'dart:developer';

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
    log(loginResponse.data.fullName);
  } else {
    customSnackbar(
        loginResponse.error.title, loginResponse.error.info.suggestion, 5);
  }
}
