import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.email,
    this.completeName,
    this.password,
    this.profileImage,
    this.id,
  });

  String email;
  String completeName;
  String password;
  String profileImage;
  String id;

  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json["email"],
        completeName: json["completeName"],
        password: json["password"],
        profileImage: json["profileImage"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "completeName": completeName,
        "password": password,
        "profileImage": profileImage,
        "_id": id,
      };

  @override
  String toString() {
    return jsonEncode(this.toJson().toString());
  }
}
