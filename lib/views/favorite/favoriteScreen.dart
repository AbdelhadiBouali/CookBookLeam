import 'dart:developer';

import 'package:cookbook/models/favoriteRecipe.model.dart';
import 'package:cookbook/providers/recipeProviders/crudFavorite.dart';
import 'package:cookbook/providers/recipeProviders/crudRecipes.dart';
import 'package:cookbook/tools/dimensions.dart';
import 'package:cookbook/views/homeScreen/newRecipes.dart';
import 'package:cookbook/views/sharedWidgets/items.tools.dart';
import 'package:flutter/material.dart';

import 'favoriteRecipeLayout.dart';

class FavoriteRecipesScreen extends StatelessWidget {
  const FavoriteRecipesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(30.0),
            child: title("Favorite Recipes", context),
          ),
          Padding(
              padding: EdgeInsets.only(top: Dimens.height * .1),
              child: Center(child: FavRecipeLayout()))
        ],
      )),
    );
  }
}
