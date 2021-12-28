import 'package:cookbook/tools/constants.dart';
import 'package:cookbook/views/homeScreen/recipeDetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/recipeCard.dart';

class NewRecipe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: demoRecipes.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                  child: InkWell(
                    onTap: () => Get.to(
                        () => RecipeDetails(
                              recipeModel: demoRecipes[index],
                            ),
                        transition: Transition.zoom),
                    child: RecipeCard(
                      recipeModel: demoRecipes[index],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
