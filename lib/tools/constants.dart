// List of Screens
import 'package:cookbook/models/recipe.model.dart';
import 'package:cookbook/views/favorite/favoriteScreen.dart';
import 'package:cookbook/views/homeScreen/homeScreen.dart';
import 'package:cookbook/views/myRecipes/myRecipesScreen.dart';
import 'package:cookbook/views/profile/profileScreen.dart';
import 'package:flutter/material.dart';

final List<Widget> screensChoice = <Widget>[
  HomeScreen(),
  MyRecipesScreen(),
  FavoriteScreen(),
  ProfileScreen()
];

final List<Recipe> demoRecipes = [
  Recipe(
    title: 'Gruyère, Bacon, and Spinach Scrambled Eggs',
    writer: "Abdelhadi Bouali",
    description:
        'A touch of Dijon mustard, salty bacon, melty cheese, and a handful of greens seriously upgrades scrambled eggs, without too much effort!',
    cookingTime: 10,
    servings: 4,
    imgPath: 'assets/images/img1.jpg',
    ingredients: [
      '8 large eggs',
      '1 tsp. Dijon mustard',
      'Kosher salt and pepper',
      '1 tbsp. olive oil or unsalted butter',
      '2 slices thick-cut bacon, cooked and broken into pieces',
      '2 c. spinach, torn',
      '2 oz. Gruyère cheese, shredded',
    ],
  ),
  Recipe(
    title: 'Classic Omelet and Greens ',
    writer: "Abdelhadi Bouali",
    description:
        'Sneak some spinach into your morning meal for a boost of nutrients to start your day off right.',
    cookingTime: 10,
    servings: 4,
    imgPath: 'assets/images/img2.jpg',
    ingredients: [
      '8 large eggs',
      '1 tsp. Dijon mustard',
      'Kosher salt and pepper',
      '1 tbsp. olive oil or unsalted butter',
      '2 slices thick-cut bacon, cooked and broken into pieces',
      '2 c. spinach, torn',
      '2 oz. Gruyère cheese, shredded',
    ],
  ),
  Recipe(
    title: 'Sheet Pan Sausage and Egg Breakfast Bake ',
    writer: "Abdelhadi Bouali",
    description:
        'A hearty breakfast that easily feeds a family of four, all on one sheet pan? Yes, please.',
    cookingTime: 10,
    servings: 4,
    imgPath: 'assets/images/img3.jpg',
    ingredients: [
      '8 large eggs',
      '1 tsp. Dijon mustard',
      'Kosher salt and pepper',
      '1 tbsp. olive oil or unsalted butter',
      '2 slices thick-cut bacon, cooked and broken into pieces',
      '2 c. spinach, torn',
      '2 oz. Gruyère cheese, shredded',
    ],
  ),
  Recipe(
    title: 'Shakshuka',
    writer: "Abdelhadi Bouali",
    description:
        'Just wait til you break this one out at the breakfast table: sweet tomatoes, runny yolks, and plenty of toasted bread for dipping.',
    cookingTime: 10,
    servings: 4,
    imgPath: 'assets/images/img4.jpg',
    ingredients: [
      '8 large eggs',
      '1 tsp. Dijon mustard',
      'Kosher salt and pepper',
      '1 tbsp. olive oil or unsalted butter',
      '2 slices thick-cut bacon, cooked and broken into pieces',
      '2 c. spinach, torn',
      '2 oz. Gruyère cheese, shredded',
    ],
  ),
];
