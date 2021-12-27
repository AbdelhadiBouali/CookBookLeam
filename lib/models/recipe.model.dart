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
  Recipe({
    this.title,
    this.message,
    this.id,
    this.type,
    this.idTarget,
    this.createdAt,
    this.updatedAt,
    this.v,
  }) : super('Recipe');

  String title;
  String message;
  String id;
  String type;
  String idTarget;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        title: json["title"],
        message: json["message"],
        id: json["_id"],
        type: json["type"],
        idTarget: json["id_target"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "message": message,
        "_id": id,
        "type": type,
        "id_target": idTarget,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };

  @override
  T fromJson<T>(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }
}
