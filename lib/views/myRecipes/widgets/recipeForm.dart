import 'dart:developer';

import 'package:cookbook/controllers/recipesController.dart';
import 'package:cookbook/models/recipe.model.dart';
import 'package:cookbook/providers/recipeProviders/crudRecipes.dart';
import 'package:cookbook/tools/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final RecipeController recipeController = Get.put(RecipeController());

Widget recipeForm() {
  recipeController.titleTextController.clear();
  recipeController.nameTextController.clear();
  recipeController.descTextController.clear();
  recipeController.selectedField(0);
  return Form(
    key: recipeController.formKey,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: Dimens.height * .05),

        SizedBox(height: Dimens.height * .023),
        new Text(
          "Please enter the recipe's credentials",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 13,
            color: Color(0xff000000),
          ),
        ),
        // These textfields are only to test and not all the fields.
        SizedBox(height: Dimens.height * .07),
        nameInput(),
        SizedBox(height: Dimens.height * .026),
        titleInput(),
        SizedBox(height: Dimens.height * .026),
        descriptionInput(),
        SizedBox(height: Dimens.height * .026),

        submitButton(),
        SizedBox(height: Dimens.height * .05),
      ],
    ),
  );
}

Widget nameInput() {
  return new Container(
    //first name
    height: Dimens.height * .068,
    width: Dimens.width * .84,
    decoration: BoxDecoration(
      color: Color(0xffffffff),
      border: Border.all(
        width: 1.00,
        color: Colors.transparent,
      ),
      boxShadow: [
        BoxShadow(
          offset: Offset(0.00, 3.00),
          color: Color(0xff000000).withOpacity(0.05),
          blurRadius: 6,
        ),
      ],
      borderRadius: BorderRadius.circular(29.00),
    ),
    child: Center(
      child: TextFormField(
        controller: recipeController.nameTextController, //
        onTap: () {
          recipeController.selectedField(1);
        },
        validator: (name) {
          String pattern = r"^([a-zA-Z]+[\'\,\.\-]?[a-zA-Z ]*)";
          RegExp regex = new RegExp(pattern);
          if (!regex
              .hasMatch(name != null ? name : 'Please Enter a correct name'))
            return 'Please Enter a correct name';
          else
            return null;
        },
        style: TextStyle(
          fontFamily: "Montserrat",
          fontSize: 13,
          color: Colors.black,
        ),
        keyboardType: TextInputType.name,
        cursorColor: Color(0xffeb786b),
        decoration: InputDecoration(
          errorStyle: TextStyle(height: 0),
          prefixIcon: Icon(
            Icons.person,
            color: recipeController.selectedField.value == 1
                ? Color(0xffeb786b)
                : Color(0xff707070).withOpacity(0.5),
          ),
          hintText: "Recipe's name",
          hintStyle: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 13,
            color: recipeController.selectedField.value == 1
                ? Color(0xffeb786b)
                : Color(0xffcfcfcf),
          ),
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(29.00),
            borderSide: BorderSide(
              color: Color(0xffeb786b),
              width: 1.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(29),
            borderSide: BorderSide(color: Colors.transparent, width: 0.0),
          ),
        ),
      ),
    ),
  );
}

Widget titleInput() {
  return new Container(
    //Last name
    height: Dimens.height * .068,
    width: Dimens.width * .84,
    decoration: BoxDecoration(
      color: Color(0xffffffff),
      border: Border.all(
        width: 1.00,
        color: Colors.transparent,
      ),
      boxShadow: [
        BoxShadow(
          offset: Offset(0.00, 3.00),
          color: Color(0xff000000).withOpacity(0.05),
          blurRadius: 6,
        ),
      ],
      borderRadius: BorderRadius.circular(29.00),
    ),
    child: Center(
      child: TextFormField(
        controller: recipeController.titleTextController, //
        onTap: () {
          recipeController.selectedField(2);
        },
        validator: (title) {
          String pattern = r"^([a-zA-Z]+[\'\,\.\-]?[a-zA-Z ]*)";
          RegExp regex = new RegExp(pattern);
          if (!regex
              .hasMatch(title != null ? title : 'Please Enter a correct title'))
            return 'Please Enter a correct title';
          else
            return null;
        },
        style: TextStyle(
          fontFamily: "Montserrat",
          fontSize: 13,
          color: Colors.black,
        ),
        keyboardType: TextInputType.name,
        cursorColor: Color(0xffeb786b),
        decoration: InputDecoration(
          errorStyle: TextStyle(height: 0),
          prefixIcon: Icon(
            Icons.person,
            color: recipeController.selectedField.value == 2
                ? Color(0xffeb786b)
                : Color(0xff707070).withOpacity(0.5),
          ),
          hintText: "Recipe's title",
          hintStyle: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 13,
            color: recipeController.selectedField.value == 2
                ? Color(0xffeb786b)
                : Color(0xffcfcfcf),
          ),
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(29.00),
            borderSide: BorderSide(
              color: Color(0xffeb786b),
              width: 1.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(29),
            borderSide: BorderSide(color: Colors.transparent, width: 0.0),
          ),
        ),
      ),
    ),
  );
}

Widget descriptionInput() {
  return new Container(
    //first name
    height: Dimens.height * .068,
    width: Dimens.width * .84,
    decoration: BoxDecoration(
      color: Color(0xffffffff),
      border: Border.all(
        width: 1.00,
        color: Colors.transparent,
      ),
      boxShadow: [
        BoxShadow(
          offset: Offset(0.00, 3.00),
          color: Color(0xff000000).withOpacity(0.05),
          blurRadius: 6,
        ),
      ],
      borderRadius: BorderRadius.circular(29.00),
    ),
    child: Center(
      child: TextFormField(
        controller: recipeController.descTextController, //
        onTap: () {
          recipeController.selectedField(3);
        },
        validator: (description) {
          String pattern = r"^([a-zA-Z]+[\'\,\.\-]?[a-zA-Z ]*)";
          RegExp regex = new RegExp(pattern);
          if (!regex.hasMatch(description != null
              ? description
              : 'Please Enter a correct description'))
            return 'Please Enter a correct description';
          else
            return null;
        },
        style: TextStyle(
          fontFamily: "Montserrat",
          fontSize: 13,
          color: Colors.black,
        ),
        keyboardType: TextInputType.name,
        cursorColor: Color(0xffeb786b),
        decoration: InputDecoration(
          errorStyle: TextStyle(height: 0),
          prefixIcon: Icon(
            Icons.person,
            color: recipeController.selectedField.value == 3
                ? Color(0xffeb786b)
                : Color(0xff707070).withOpacity(0.5),
          ),
          hintText: "Recipe's description",
          hintStyle: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 13,
            color: recipeController.selectedField.value == 3
                ? Color(0xffeb786b)
                : Color(0xffcfcfcf),
          ),
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(29.00),
            borderSide: BorderSide(
              color: Color(0xffeb786b),
              width: 1.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(29),
            borderSide: BorderSide(color: Colors.transparent, width: 0.0),
          ),
        ),
      ),
    ),
  );
}

Widget submitButton() {
  Recipe personalRecipe = Recipe(
    //name: recipeController.nameTextController.text,
    creation: DateTime.now(),
    modified: DateTime.now(),
    //description: recipeController.descTextController.text,
    //title: recipeController.titleTextController.text,
  );

  return InkWell(
    onTap: () {
      createRecipe(personalRecipe);

      //if (recipeController.formKey.currentState.validate()) {}
    },
    child: Container(
      height: Dimens.height * 0.053,
      width: Dimens.width * .55,
      decoration: BoxDecoration(
        color: Color(0xffeb786b),
        borderRadius: BorderRadius.circular(20.00),
      ),
      child: Center(
        child: new Text(
          "Create the recipe",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 16,
            color: Color(0xffffffff),
          ),
        ),
      ),
    ),
  );
}
