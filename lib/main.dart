import 'dart:convert';

import 'package:cookbook/services/urls.dart';
import 'package:cookbook/services/userState.dart' as LocalUser;
import 'package:cookbook/services/userState.dart';
import 'package:cookbook/views/getStarted/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renovation_core/auth.dart';
import 'package:renovation_core/core.dart';

import 'models/user.dart' as us;

Renovation renovationInstance = Renovation(); // To initialize Renovation
FrappeSessionStatusInfo sessionStatusInfo;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Getting the user
  LocalUser.UserState.user = us.User();
  await LocalUser.getUser();
  if (LocalUser.UserState.userIsLogged == false)
    await renovationInstance.init(urlBase, useJWT: true);
  else {
    // Get saved in local session
    await renovationInstance.init(urlBase,
        useJWT: true,
        sessionStatusInfo: FrappeSessionStatusInfo.fromJson(
            json.decode(LocalUser.UserState.session)));
  }
  runApp(CookBookApp());
}

class CookBookApp extends StatelessWidget {
  const CookBookApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // Using Getx for State Management, animations and routes
      title: 'CookBook App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: Colors.black,
        // Define the default font family.
        fontFamily: 'Montserrat',
        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontSize: 35.0,
              fontFamily: 'Montserrat',
              color: Colors.white,
              fontWeight: FontWeight.bold),
          headline2: TextStyle(
              fontSize: 18.0, fontFamily: 'Montserrat', color: Colors.white),
          headline3: TextStyle(
              fontSize: 18.0, fontFamily: 'Montserrat', color: Colors.black),
          bodyText2: TextStyle(
              fontSize: 14.0, fontFamily: 'Montserrat', color: Colors.white),
        ),
      ),
      home: SplashScreen(),
      defaultTransition: Transition.rightToLeft,
    );
  }
}
