import 'package:cookbook/models/recipe.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecipeController extends GetxController {
  var myRecipesList = <Recipe>[].obs;
  //To control the form
  final formKey = GlobalKey<FormState>();
  var selectedField = 0.obs;

  TextEditingController nameTextController = TextEditingController();
  TextEditingController titleTextController = TextEditingController();
  TextEditingController descTextController =
      TextEditingController(); // description

  @override
  void onInit() {
    super.onInit();
  }
}
