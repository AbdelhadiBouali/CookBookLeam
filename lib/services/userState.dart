import 'package:cookbook/models/user.dart';
import 'package:renovation_core/auth.dart' as Frappe;
import 'package:shared_preferences/shared_preferences.dart';

class UserState {
  static User user = User();
  static bool userIsLogged = false;
  static String token = "";
  static String session = "";
}

Future saveUser() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString("user", UserState.user.user);
  await prefs.setString("message", UserState.user.message);
  await prefs.setString("home_page", UserState.user.homePage);
  await prefs.setString("user_image", UserState.user.userImage);
  await prefs.setString("full_name", UserState.user.fullName);
  await prefs.setString("session", UserState.session);

  await prefs.setString("lang", UserState.user.lang);
  await prefs.setBool("has_quick_login_pin", UserState.user.hasQuickLoginPin);
  await prefs.setBool("userIsLogged", UserState.userIsLogged);
  await prefs.setString("token", UserState.token);
}

Future getUser() async {
  final prefs = await SharedPreferences.getInstance();
  UserState.user.user = prefs.getString("user") ?? "-1";
  UserState.user.message = prefs.getString("message") ?? "none";
  UserState.user.homePage = prefs.getString("home_page") ?? "none";
  UserState.user.userImage = prefs.getString("user_image") ?? "none";
  UserState.user.fullName = prefs.getString("full_name") ?? "none";
  UserState.session = prefs.getString("session") ?? "none";
  UserState.user.lang = prefs.getString("lang") ?? "none";
  UserState.user.hasQuickLoginPin =
      prefs.getBool("has_quick_login_pin") ?? false;
  UserState.userIsLogged = prefs.getBool("userIsLogged") ?? false;

  UserState.token = prefs.getString("token") ?? "";
}

Future deleteUser() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.clear();
  UserState.token = "";
  UserState.userIsLogged = false;
  UserState.user = User();
  UserState.session = "";
}
