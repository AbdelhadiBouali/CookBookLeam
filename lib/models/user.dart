import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.email,
    this.completeName,
    this.phoneNumber,
    this.password,
    this.profileImage,
    this.id,
    this.gender,
  });

  String email;
  String completeName;
  String phoneNumber;
  String password;
  String profileImage;
  String id;
  String gender;

  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json["email"],
        completeName: json["completeName"],
        phoneNumber: json["phoneNumber"],
        password: json["password"],
        profileImage: json["profileImage"],
        id: json["_id"],
        gender: json["gender"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "completeName": completeName,
        "phoneNumber": phoneNumber,
        "password": password,
        "profileImage": profileImage,
        "_id": id,
        "gender": gender,
      };

  @override
  String toString() {
    // TODO: implement toString
    return jsonEncode(this.toJson().toString());
  }
}
