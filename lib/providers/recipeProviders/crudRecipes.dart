import 'dart:developer';

import 'package:cookbook/controllers/recipesController.dart';
import 'package:cookbook/models/recipe.model.dart';
import 'package:cookbook/views/sharedWidgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renovation_core/core.dart';

final RecipeController recipeController = Get.put(RecipeController());

//////////////////////////////////////////////////////////////////////////////// METHOD TO GET ALL RECIPES

Future<List<Recipe>> getRecipes() async {
  // need to specify Recipes model attributes

  RequestResponse<List<Recipe>> response =
      await getFrappeModelController().getList(Recipe(), fields: ['*']);

  List<Recipe> recipes = response.data;

  return recipes;
}

//////////////////////////////////////////////////////////////////// Create a recipe

Future<bool> createRecipe(Recipe personalRecipe) async {
  Get.dialog(Center(child: CircularProgressIndicator()));

  personalRecipe.doctype = "Recipe";
  personalRecipe.isLocal = false;
  personalRecipe.name = "Recipe 5"; // What's exactly a docName?

  RequestResponse<Recipe> response =
      await getFrappeModelController().saveDoc<Recipe>(personalRecipe);

  log(response.httpCode
      .toString()); // isSuccesss = false / httpCode = 200 / error = null
  if (response.isSuccess) {
    // Save the recipe in the controller to refresh recipes
    recipeController.myRecipesList.add(response.data);
    Get.back();
    // If the document was successfully created
    customSnackbar("Recipe " + response.data.title + "Created Successfully",
        "By : " + response.data.owner, 5);
  } else {
    // If the document was not created => show error snackbar
    customSnackbar(
        response.error.info.cause, response.error.info.suggestion, 5);
  }
  return response.isSuccess;
}

//////////////////////////////////////////////////////////////////// Update a recipe

Future<bool> updateRecipe(Recipe personalRecipe) async {
  // need to specify Recipes model attributes

  RequestResponse<Recipe> response =
      await getFrappeModelController().saveDoc<Recipe>(personalRecipe);

  if (response.isSuccess) {
    // If the document was successfully updated => Show success snackbar

    customSnackbar(response.data.title, response.data.owner, 5);
  } else {
    // If the document was not updated => show error snackbar
    customSnackbar(
        response.error.info.cause, response.error.info.suggestion, 5);
  }
  return response.isSuccess;
}

////////////////////////////////////////// Delete a personal recipe
Future<bool> deleteRecipe(Recipe recipe) async {
  Get.dialog(Center(child: CircularProgressIndicator()));

  RequestResponse<String> response = await getFrappeModelController().deleteDoc(
      'Recipe', recipe.name); // Could not find the recipe ID or Reference
  Get.back();
  log(response.isSuccess.toString());
  if (response.isSuccess) {
    customSnackbar("Recipe deleted", "", 5);
  } else {
    customSnackbar(
        response.error.info.cause, response.error.info.suggestion, 5);
  }
  return response.isSuccess;
}
