// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

import 'package:renovation_core/model.dart';

List<Recipe> recipeJson(String str) =>
    List<Recipe>.from(json.decode(str).map((x) => Recipe.fromJson(x)));

String recipeToJson(List<Recipe> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// Attributes not specified
class Recipe extends FrappeDocument {
  Recipe(
      {this.title,
      this.writer,
      this.description,
      this.cookingTime,
      this.servings,
      this.imgPath,
      this.ingredients,
      this.id})
      : super('Recipe');

  String title, writer, description, id;
  int cookingTime;
  int servings;
  List<String> ingredients = [];
  String imgPath;

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
      title: json["title"],
      writer: json["writer"],
      description: json["description"],
      id: json["_id"],
      cookingTime: json["cookingTime"],
      servings: json["servings"],
      imgPath: json["imgPath"],
      ingredients: json["ingredients"]);

  Map<String, dynamic> toJson() => {
        "title": title,
        "writer": writer,
        "description": description,
        "_id": id,
        "cookingTime": cookingTime,
        "servings": servings,
        "imgPath": imgPath,
        "ingredients": ingredients
      };

  @override
  T fromJson<T>(Map<String, dynamic> json) {
    throw UnimplementedError();
  }
}
