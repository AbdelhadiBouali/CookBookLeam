import 'package:flutter/material.dart';
import 'package:get/get.dart';

void customSnackbar(String title, String detail, int duration) {
  return Get.snackbar(title, detail,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration));
}
