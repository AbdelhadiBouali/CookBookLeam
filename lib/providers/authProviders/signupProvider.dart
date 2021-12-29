import 'package:cookbook/views/sharedWidgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renovation_core/core.dart';
import 'package:cookbook/main.dart';

Future<void> signupApi(
    String firstName, String lastName, String email, String password) async {
  Get.dialog(Center(child: CircularProgressIndicator()));
  var body = {
    'first_name': firstName,
    'last_name': lastName,
    'email': email,
    'password': password
  };

  RequestResponse<FrappeResponse> signupResponse =
      await renovationInstance.call(
    {
      "cmd": "cookbook_backend.api.signup",
      "args": body
    }, // using the right call
  );

  Get.back();

  if (signupResponse.isSuccess) {
    Get.back();
    customSnackbar("Signed up successfully", "Sign in please", 7);
  } else {
    // Showing a simple snackbar to the user
    customSnackbar(signupResponse.error.info.cause.toString(),
        signupResponse.error.info.suggestion.toString(), 5);
  }
}
