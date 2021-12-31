// To parse this JSON data, do
//
//     final recipe = recipeFromJson(jsonString);

import 'dart:convert';

import 'package:renovation_core/model.dart';

List<Recipe> recipeFromJson(String str) =>
    List<Recipe>.from(json.decode(str).map((x) => Recipe.fromJson(x)));

String recipeToJson(List<Recipe> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Recipe extends FrappeDocument {
  Recipe({
    this.creation,
    this.modified,
    this.modifiedBy,
    this.owner,
    this.docstatus,
    this.parentfield,
    this.parenttype,
    this.idx,
    this.image,
    this.description,
    this.title,
    this.rating,
    this.userTags,
    this.comments,
    this.assign,
    this.likedBy,
  }) : super('Recipe');

  DateTime creation;
  DateTime modified;
  String modifiedBy;
  String owner;
  int docstatus;
  dynamic parentfield;
  dynamic parenttype;
  int idx;
  String image;
  String description;
  String title;
  int rating;
  dynamic userTags;
  dynamic comments;
  dynamic assign;
  dynamic likedBy;

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        creation: DateTime.parse(json["creation"]),
        modified: DateTime.parse(json["modified"]),
        modifiedBy: json["modified_by"],
        owner: json["owner"],
        docstatus: json["docstatus"],
        parentfield: json["parentfield"],
        parenttype: json["parenttype"],
        idx: json["idx"],
        image: json["image"],
        description: json["description"],
        title: json["title"],
        rating: json["rating"],
        userTags: json["_user_tags"],
        comments: json["_comments"],
        assign: json["_assign"],
        likedBy: json["_liked_by"],
      );

  Map<String, dynamic> toJson() => {
        "creation": creation.toIso8601String(),
        "modified": modified.toIso8601String(),
        "modified_by": modifiedBy,
        "owner": owner,
        "docstatus": docstatus,
        "parent": parent,
        "parentfield": parentfield,
        "parenttype": parenttype,
        "idx": idx,
        "image": image,
        "description": description,
        "title": title,
        "rating": rating,
        "_user_tags": userTags,
        "_comments": comments,
        "_assign": assign,
        "_liked_by": likedBy,
      };

  @override
  T fromJson<T>(Map<String, dynamic> json) => Recipe.fromJson(json) as T;
}
