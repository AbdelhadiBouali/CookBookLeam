import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  var selectedField = 0.obs;
  var errorMessage = "".obs; // signup error message

  //To control the form
  final formKey = GlobalKey<FormState>();
  // To save email and password

  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController firstNameTextController = TextEditingController();
  TextEditingController lastNameTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }
}
