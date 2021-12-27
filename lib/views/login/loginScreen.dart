import 'package:cookbook/controllers/loginController.dart';
import 'package:cookbook/views/login/widgets/loginLayout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final formkey = GlobalKey<FormState>();
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: GetX<LoginController>(builder: (loginController) {
              return loginLayout(formkey);
            }),
          ),
        ),
      ),
    );
  }
}
