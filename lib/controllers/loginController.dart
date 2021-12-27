import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //To animate the textfields
  var emailCheck = false.obs;
  var passCheck = false.obs;
  var formKey = GlobalKey<FormState>();

  // To save email and password
  TextEditingController loginEmailTextController = TextEditingController();
  TextEditingController loginPasswordTextController = TextEditingController();

  @override
  void onInit() {
    loginEmailTextController = TextEditingController();
    loginPasswordTextController = TextEditingController();
    super.onInit();
  }
}
