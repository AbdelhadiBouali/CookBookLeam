import 'package:cookbook/tools/dimensions.dart';
import 'package:cookbook/views/myRecipes/widgets/recipeForm.dart';
import 'package:cookbook/views/sharedWidgets/items.tools.dart';
import 'package:flutter/material.dart';

class CreateRecipe extends StatelessWidget {
  const CreateRecipe({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(30.0),
              child: title("Create A recipe", context),
            ),
            Padding(
                padding: EdgeInsets.only(top: Dimens.height * .1),
                child: Center(child: recipeForm()))
          ],
        ),
      )),
    );
  }
}
