import 'dart:developer';

import 'package:cookbook/models/recipe.model.dart';
import 'package:cookbook/views/sharedWidgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renovation_core/core.dart';

//////////////////////////////////////////////////////////////////////////////// METHOD TO GET ALL RECIPES

Future<List<Recipe>> getRecipes() async {
  // need to specify Recipes model attributes
  RequestResponse<List<Recipe>> response =
      await getFrappeModelController().getList(Recipe(), fields: ['*']);
  List<Recipe> recipes = response.data;

  return recipes;
}

//////////////////////////////////////////////////////////////////// Create a recipe

Future<void> createRecipe(Recipe personalRecipe) async {
  // need to specify Recipes model attributes

  RequestResponse<Recipe> response =
      await getFrappeModelController().saveDoc<Recipe>(personalRecipe);

  if (response.isSuccess) {
    // If the document was successfully created

    customSnackbar(response.data.title, response.data.writer, 5);
  } else {
    // If the document was not created => show error snackbar
    customSnackbar(
        response.error.info.cause, response.error.info.suggestion, 5);
  }
}

//////////////////////////////////////////////////////////////////// Update a recipe

Future<void> updateRecipe(Recipe personalRecipe) async {
  // need to specify Recipes model attributes

  RequestResponse<Recipe> response =
      await getFrappeModelController().saveDoc<Recipe>(personalRecipe);

  if (response.isSuccess) {
    // If the document was successfully updated => Show success snackbar

    customSnackbar(response.data.title, response.data.writer, 5);
  } else {
    // If the document was not updated => show error snackbar
    customSnackbar(
        response.error.info.cause, response.error.info.suggestion, 5);
  }
}

////////////////////////////////////////// Delete a personal recipe
Future<void> deleteRecipe(Recipe recipe) async {
  Get.dialog(Center(child: CircularProgressIndicator()));

  RequestResponse<String> response =
      await getFrappeModelController().deleteDoc('Recipe', recipe.id);
  Get.back();
  if (response.isSuccess) {
    customSnackbar("Recipe deleted", "", 5);
  } else {
    customSnackbar(
        response.error.info.cause, response.error.info.suggestion, 5);
  }
}
