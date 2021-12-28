import 'package:cookbook/tools/dimensions.dart';
import 'package:cookbook/views/homeScreen/newRecipes.dart';
import 'package:cookbook/views/sharedWidgets/items.tools.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key key}) : super(key: key);

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
              child: Center(child: NewRecipe()))
        ],
      )),
    );
  }
}
