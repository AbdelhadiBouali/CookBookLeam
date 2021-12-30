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
