import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cookbook/services/urls.dart';
import 'package:cookbook/views/sharedWidgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renovation_core/auth.dart';
import 'package:renovation_core/core.dart';
import 'package:cookbook/main.dart';

//The sign up method is show an internal server error (500)
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
    {"cmd": "cookbook_backend.api.signup", "input": body},
  );

  Get.back();

  if (signupResponse.isSuccess) {
  } else {
    // Showing a simple snackbar to the user
    customSnackbar(signupResponse.error.info.cause.toString(),
        signupResponse.error.info.suggestion.toString(), 5);
  }
}
