import 'package:cookbook/controllers/getStartedController.dart';
import 'package:cookbook/tools/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoConnectionScreen extends StatelessWidget {
  final GetStartedController getStartedController =
      Get.put(GetStartedController());
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/images/NoConnection.png"),
              SizedBox(height: 43),
              new Text(
                "No internet Connection !\n",
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 20,
                  color: Color(0xff393939),
                ),
              ),
              new Text(
                "Please activate your Wi-Fi or Mobile Data to continu",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                  color: Color(0xff434343),
                ),
              ),
              SizedBox(height: 50),
              InkWell(
                child: new Container(
                  height: 42.00,
                  width: 144.00,
                  decoration: BoxDecoration(
                    color: CookColors.mainColor,
                    borderRadius: BorderRadius.circular(21.00),
                  ),
                  child: Center(
                    child: new Text(
                      "Refresh",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Gotham",
                        fontSize: 18,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
                onTap: () async {
                  getStartedController.pageDirection();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
