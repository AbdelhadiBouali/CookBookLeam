import 'dart:developer';

import 'package:cookbook/models/recipe.model.dart';
import 'package:renovation_core/core.dart';

//////////////////////////////////////////////////////////////////////////////// METHOD TO GET ALL RECIPES

Future<List<Recipe>> getRecipes() async {
  // need to specify Recipes model attributes
  RequestResponse<List<Recipe>> response =
      await getFrappeModelController().getList(Recipe(), fields: ['*']);

  List<Recipe> recipes;

  if (response.isSuccess) {
    // If the document was successfully retrieved
    List<Recipe> recipes = response.data;
  } else {
    // If the document was not retrieved

  }
  return recipes;
}

//////////////////////////////////////////////////////////////////// Create a recipe

Future<void> createRecipe(Recipe personalRecipe) async {
  // need to specify Recipes model attributes

  RequestResponse<Recipe> response =
      await getFrappeModelController().saveDoc<Recipe>(personalRecipe);

  if (response.isSuccess) {
    // If the document was successfully retrieved

    print(response.data);
  } else {
    // If the document was not retrieved
    print(response.error);
  }
}

//////////////////////////////////////////////////////////////////// Update a recipe

Future<void> updateRecipe(Recipe personalRecipe) async {
  // need to specify Recipes model attributes

  RequestResponse<Recipe> response =
      await getFrappeModelController().saveDoc<Recipe>(personalRecipe);

  if (response.isSuccess) {
    // If the document was successfully retrieved

    print(response.data);
  } else {
    // If the document was not retrieved
    print(response.error);
  }
}
