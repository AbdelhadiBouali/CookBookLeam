import 'dart:developer';

import 'package:cookbook/main.dart';
import 'package:cookbook/views/sharedWidgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renovation_core/core.dart';

Future<void> getFavorites() async {
  RequestResponse<FrappeResponse> response = await renovationInstance.call({
    "cmd": "cookbook_backend.api.favorites.get_favorite_recipes",
  });

  log(response.httpCode.toString());
}

Future<void> deleteFavorite(dynamic item) async {
  Get.dialog(Center(child: CircularProgressIndicator()));

  RequestResponse<String> response = await getFrappeModelController()
      .deleteDoc('Favorite Item', item.childRef);
  Get.back();
  if (response.isSuccess) {
    customSnackbar("Favorite Item deleted", "", 5);
  } else {
    customSnackbar(
        response.error.info.cause, response.error.info.suggestion, 5);
  }
}
