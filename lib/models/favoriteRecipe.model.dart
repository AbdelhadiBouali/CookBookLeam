// To parse this JSON data, do
//
//     final favoriteRecipe = favoriteRecipeFromJson(jsonString);

import 'dart:convert';

import 'package:renovation_core/model.dart';

FavoriteRecipe favoriteRecipeFromJson(String str) =>
    FavoriteRecipe.fromJson(json.decode(str));

String favoriteRecipeToJson(FavoriteRecipe data) => json.encode(data.toJson());

class FavoriteRecipe extends FrappeDocument {
  FavoriteRecipe({
    this.title,
    this.id,
    this.type,
  }) : super("Favorite Item");

  String title;
  String id;
  String type;

  factory FavoriteRecipe.fromJson(Map<String, dynamic> json) => FavoriteRecipe(
        title: json["title"],
        id: json["_id"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "_id": id,
        "type": type,
      };

  @override
  T fromJson<T>(Map<String, dynamic> json) {
    throw UnimplementedError();
  }
}
