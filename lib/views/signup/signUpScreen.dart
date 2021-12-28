import 'package:cookbook/controllers/signupController.dart';
import 'package:cookbook/tools/dimensions.dart';
import 'package:cookbook/views/signup/signupLayout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

class SignupScreen extends HookWidget {
  final SignUpController signUpController = Get.put(SignUpController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.only(top: Dimens.height * .15),
              child: Center(
                  child: GetX<SignUpController>(builder: (signUpController) {
                // Using getx to control textfields colors and state
                return signupLayout();
              }))),
        ),
      ),
    );
  }
}
