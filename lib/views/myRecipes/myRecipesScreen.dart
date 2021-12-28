import 'package:cookbook/tools/colors.dart';
import 'package:cookbook/tools/dimensions.dart';
import 'package:cookbook/views/homeScreen/newRecipes.dart';
import 'package:cookbook/views/sharedWidgets/items.tools.dart';
import 'package:cookbook/views/sharedWidgets/snackbar.dart';
import 'package:flutter/material.dart';

class MyRecipesScreen extends StatelessWidget {
  const MyRecipesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(30.0),
            child: title("My recipes", context),
          ),
          Padding(
              padding: EdgeInsets.only(top: Dimens.height * .1),
              child: Center(child: NewRecipe())),
          Positioned(
            bottom: Dimens.height * .025,
            right: Dimens.width * .05,
            child: InkWell(
              onTap: () {
                customSnackbar("To add a recipe", "Page unavailable", 5);
              },
              child: new Container(
                  height: 59.46,
                  width: 59.46,
                  decoration: BoxDecoration(
                    color: CookColors.mainColor.withOpacity(0.88),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0.00, 0.00),
                        color: CookColors.mainColor.withOpacity(0.14),
                        blurRadius: 24,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(30.00),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 35,
                    ),
                  )),
            ),
          ),
        ],
      )),
    );
  }
}
