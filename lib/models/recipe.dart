// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

List<Recipe> recipeJson(String str) =>
    List<Recipe>.from(json.decode(str).map((x) => Recipe.fromJson(x)));

String recipeToJson(List<Recipe> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Recipe {
  Recipe({
    this.title,
    this.message,
    this.id,
    this.idDeliveryMan,
    this.idTrip,
    this.type,
    this.idTarget,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String title;
  String message;
  String id;
  String idDeliveryMan;
  String idTrip;
  String type;
  String idTarget;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        title: json["title"],
        message: json["message"],
        id: json["_id"],
        idDeliveryMan: json["id_delivery_man"],
        idTrip: json["id_trip"],
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
        "id_delivery_man": idDeliveryMan,
        "id_trip": idTrip,
        "type": type,
        "id_target": idTarget,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
