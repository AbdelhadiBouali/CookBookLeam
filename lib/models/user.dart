// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.user,
    this.message,
    this.homePage,
    this.userImage,
    this.fullName,
    this.hasQuickLoginPin,
    this.lang,
    this.token,
  });

  String user;
  String message;
  String homePage;
  dynamic userImage;
  String fullName;
  bool hasQuickLoginPin;
  String lang;
  String token;

  factory User.fromJson(Map<String, dynamic> json) => User(
        user: json["user"],
        message: json["message"],
        homePage: json["home_page"],
        userImage: json["user_image"],
        fullName: json["full_name"],
        hasQuickLoginPin: json["has_quick_login_pin"],
        lang: json["lang"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "message": message,
        "home_page": homePage,
        "user_image": userImage,
        "full_name": fullName,
        "has_quick_login_pin": hasQuickLoginPin,
        "lang": lang,
        "token": token,
      };
}
