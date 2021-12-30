import 'package:cookbook/models/recipe.model.dart';
import 'package:cookbook/providers/recipeProviders/crudRecipes.dart';
import 'package:cookbook/tools/colors.dart';
import 'package:cookbook/tools/constants.dart';
import 'package:cookbook/tools/dimensions.dart';
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
            FutureBuilder<List<Recipe>>(
                future: getRecipes(),
                builder: (context, snapshot) {
                  return snapshot.data != null
                      ? ListView.builder(
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 12,
                              ),
                              child: InkWell(
                                onTap: () => Get.to(
                                    () => RecipeDetails(
                                          recipeModel: snapshot.data[index],
                                        ),
                                    transition: Transition.zoom),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15.0, right: 15),
                                  child: RecipeCard(
                                    recipeModel: snapshot.data[index],
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      : Padding(
                          padding: EdgeInsets.only(top: Dimens.height * .3),
                          child: Align(
                              alignment: Alignment.center,
                              child: CircularProgressIndicator(
                                color: CookColors.mainColor,
                              )),
                        );
                })
          ],
        ),
      ),
    );
  }
}
