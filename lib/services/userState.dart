import 'package:cookbook/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserState {
  static User user = User(
    completeName: "",
    email: "",
    gender: "",
    id: "",
    password: "",
    phoneNumber: "",
    profileImage: "",
  );
  static bool userIsLogged = false;
  static bool profileAvailable = false;
  static String token = "";
}

Future saveUser() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString("id", UserState.user.id);
  await prefs.setString("completeName", UserState.user.completeName);
  await prefs.setString("password", UserState.user.password);
  await prefs.setString("phoneNumber", UserState.user.phoneNumber);
  await prefs.setString("gender", UserState.user.gender);
  await prefs.setBool("userIsLogged", UserState.userIsLogged);
  await prefs.setBool("profileAvailable", UserState.profileAvailable);

  await prefs.setString("token", UserState.token);
  await prefs.setString("profileImage", UserState.user.profileImage);
}

Future getUser() async {
  final prefs = await SharedPreferences.getInstance();
  UserState.user.id = await prefs.getString("id") ?? "-1";
  UserState.user.completeName = await prefs.getString("completeName") ?? "none";
  UserState.user.password = await prefs.getString("password") ?? "none";
  UserState.user.phoneNumber = await prefs.getString("phoneNumber") ?? "none";
  UserState.user.gender = await prefs.getString("gender") ?? "none";
  UserState.user.profileImage = await prefs.getString("profileImage") ?? "none";
  UserState.userIsLogged = await prefs.getBool("userIsLogged") ?? false;
  UserState.profileAvailable = await prefs.getBool("profileAvailable") ?? false;

  UserState.token = await prefs.getString("token") ?? "";
}

Future deleteUser() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.clear();
  UserState.token = "";
  UserState.userIsLogged = false;
  UserState.profileAvailable = false;
  UserState.user = User(
    completeName: "",
    email: "",
    gender: "",
    id: "",
    password: "",
    phoneNumber: "",
    profileImage: "",
  );
  await prefs.setBool("userIsOnline", UserState.userIsLogged);
  await prefs.setBool("profileAvailable", UserState.profileAvailable);
}
