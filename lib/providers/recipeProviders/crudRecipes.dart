import 'dart:developer';

import 'package:cookbook/models/recipe.dart';
import 'package:renovation_core/core.dart';


//// METHOD TO GET ALL RECIPES
/*
Future<void> getRecipes() async {
  RequestResponse<List<Recipe>> response =
      await getFrappeModelController().getList(Recipe(), fields: ['*']);
  log(response.httpCode.toString());

  if (response.isSuccess) {
    // If the document was successfully retrieved
    //List<Recipe> recipes = response.data;
    print(response.data);
  } else {
    // If the document was not retrieved
    print(response.error);
  }
}*/
