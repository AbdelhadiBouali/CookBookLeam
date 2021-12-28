import 'package:cookbook/tools/dimensions.dart';
import 'package:cookbook/views/homeScreen/newRecipes.dart';
import 'package:cookbook/views/sharedWidgets/items.tools.dart';
import 'package:flutter/material.dart';

class MyRecipesScreen extends StatelessWidget {
  const MyRecipesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          title("My recipes", context),
          Padding(
              padding: EdgeInsets.only(top: Dimens.height * .18),
              child: Center(child: NewRecipe()))
        ],
      )),
    );
  }
}
