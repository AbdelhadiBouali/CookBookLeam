import 'dart:developer';

import 'package:cookbook/main.dart';
import 'package:cookbook/models/favoriteRecipe.model.dart';
import 'package:cookbook/views/sharedWidgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renovation_core/core.dart';

/////////////////////////////////////////////////// Get all favorites recipes

Future<List<FavoriteRecipe>> getFavorites() async {
  RequestResponse<FrappeResponse> response = await renovationInstance.call({
    "cmd": "cookbook_backend.api.favorites.get_favorite_recipes",
  });

  log(response.rawResponse.toString());
  List<dynamic> favoritesArray;
  List<FavoriteRecipe> favoriteRecipes;
  if (response.isSuccess) {
    favoritesArray = response.data.message; // containing the response as a json
    favoriteRecipes = List<FavoriteRecipe>.of(
        favoritesArray.map((tmp) => FavoriteRecipe.fromJson(tmp))).toList();
  }
  return favoriteRecipes;
}

////////////////////////////////////////// Delete a favorite recipe
Future<void> deleteFavorite(FavoriteRecipe favoriteRecipe) async {
  Get.dialog(Center(child: CircularProgressIndicator()));

  RequestResponse<String> response = await getFrappeModelController()
      .deleteDoc('Favorite Recipe', favoriteRecipe.id);
  Get.back();
  if (response.isSuccess) {
    customSnackbar("Favorite Recipe deleted", "", 5);
  } else {
    customSnackbar(
        response.error.info.cause, response.error.info.suggestion, 5);
  }
}
