import 'package:cookbook/controllers/homeController.dart';
import 'package:cookbook/services/userState.dart';
import 'package:cookbook/tools/colors.dart';
import 'package:cookbook/tools/dimensions.dart';
import 'package:cookbook/views/sharedWidgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:renovation_core/auth.dart';

import '../../../main.dart';

final HomePageController homePageController = Get.put(HomePageController());

Widget profileBody() {
  ScrollController _scrollController =
      ScrollController(initialScrollOffset: 0.0);
  return ListView(
    controller: _scrollController,
    children: [
      SizedBox(height: Dimens.height * .07),
      profileCard(),
      SizedBox(height: Dimens.height * .03),
      userPages()
    ],
  );
}

Widget profileCard() {
  return Container(
    height: Dimens.height * .12,
    width: Dimens.width,
    decoration: BoxDecoration(
      color: CookColors.mainColor,
      borderRadius: BorderRadius.circular(20.00),
    ),
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: InkWell(
              onTap: () {
                customSnackbar("To logout", "Page unavailable", 5);
              },
              child: Container(
                  child: Icon(FlutterIcons.logout_ant, color: Colors.white)),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              onTap: () {
                customSnackbar("To modify profile", "Page unavailable", 5);
              },
              child: Icon(FlutterIcons.person_oct, color: Colors.white),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  new Text(
                    UserState.user.fullName,
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 17,
                      color: Color(0xffffffff),
                    ),
                  ),
                  new Text(
                    UserState.user.user,
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 12,
                      color: Color(0xffffffff),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    ),
  );
}

Widget userPages() {
  return Container(
      height: Dimens.height * .45,
      width: Dimens.width,
      decoration: BoxDecoration(
        color: Color(0xffffffff),
        boxShadow: [
          BoxShadow(
            offset: Offset(0.00, 6.00),
            color: Color(0xff000000).withOpacity(0.09),
            blurRadius: 18,
          ),
        ],
        borderRadius: BorderRadius.circular(20.00),
      ),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            // Agenda
            InkWell(
              onTap: () {
                homePageController.selectedIndex(0);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    FlutterIcons.home_ant,
                    color: CookColors.mainColor,
                  ),
                  SizedBox(width: Dimens.width * .07),
                  new Text(
                    "The new recipes",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 12,
                      color: Color(0xff898a8f),
                    ),
                  ),
                  Expanded(child: Container()),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 10,
                  )
                ],
              ),
            ),
            SizedBox(height: Dimens.height * .03),
            Divider(),
            SizedBox(height: Dimens.height * .03),
            // Historique Rendez vous
            InkWell(
              onTap: () {
                homePageController.selectedIndex(1);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.food_bank_outlined,
                    color: CookColors.mainColor,
                  ),
                  SizedBox(width: Dimens.width * .07),
                  new Text(
                    "My recipes",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 12,
                      color: Color(0xff898a8f),
                    ),
                  ),
                  Expanded(child: Container()),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 10,
                  )
                ],
              ),
            ),
            SizedBox(height: Dimens.height * .03),
            Divider(),
            SizedBox(height: Dimens.height * .03),
            // notifications
            InkWell(
              onTap: () {
                homePageController.selectedIndex(2);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(FlutterIcons.heart_circle_outline_mco,
                      color: CookColors.mainColor),
                  SizedBox(width: Dimens.width * .07),
                  new Text(
                    "Favorite Recipes",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 12,
                      color: Color(0xff898a8f),
                    ),
                  ),
                  Expanded(child: Container()),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 10,
                  )
                ],
              ),
            ),
            SizedBox(height: Dimens.height * .03),
            Divider(),
            SizedBox(height: Dimens.height * .03),
          ],
        ),
      ));
}
