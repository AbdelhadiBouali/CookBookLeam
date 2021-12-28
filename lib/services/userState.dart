import 'package:cookbook/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserState {
  static User user = User(
    completeName: "",
    email: "",
    id: "",
    password: "",
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
  await prefs.setBool("userIsLogged", UserState.userIsLogged);
  await prefs.setBool("profileAvailable", UserState.profileAvailable);

  await prefs.setString("token", UserState.token);
  await prefs.setString("profileImage", UserState.user.profileImage);
}

Future getUser() async {
  final prefs = await SharedPreferences.getInstance();
  UserState.user.id = prefs.getString("id") ?? "-1";
  UserState.user.completeName = prefs.getString("completeName") ?? "none";
  UserState.user.profileImage = prefs.getString("profileImage") ?? "none";
  UserState.userIsLogged = prefs.getBool("userIsLogged") ?? false;
  UserState.profileAvailable = prefs.getBool("profileAvailable") ?? false;

  UserState.token = prefs.getString("token") ?? "";
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
    id: "",
    password: "",
    profileImage: "",
  );
  await prefs.setBool("userIsOnline", UserState.userIsLogged);
  await prefs.setBool("profileAvailable", UserState.profileAvailable);
}
