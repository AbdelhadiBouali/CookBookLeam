import 'package:cookbook/services/userState.dart';
import 'package:cookbook/tools/dimensions.dart';
import 'package:cookbook/views/getStarted/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renovation_core/core.dart';

Future<dynamic> logoutDialog() {
  return Get.dialog(
    Scaffold(
      backgroundColor: Colors.transparent,
      body: GestureDetector(
        onTap: () => Get.back(),
        child: Container(
          width: Dimens.width,
          height: Dimens.height,
          decoration:
              BoxDecoration(color: Colors.transparent.withOpacity(0.30)),
          child: GestureDetector(
            onTap: () => print(''),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  color: Colors.white,
                  width: Dimens.width * .9,
                  height: Dimens.height * .35,
                  child: Material(
                    textStyle: TextStyle(color: Colors.black),
                    color: Colors.white,
                    child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            new Text(
                              "Logout",
                              style: TextStyle(
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Color(0xff313450),
                              ),
                            ),
                            SizedBox(height: Dimens.height * .02),
                            Container(
                              height: Dimens.height * .15,
                              width: Dimens.width * .8,
                              child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text:
                                          "If you continue, you will be disconnected from the application",
                                      style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 14,
                                        color: Color(0xff898a8f),
                                      )),
                                ]),
                                maxLines: 4,
                                softWrap: true,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.clip,
                              ),
                            ),
                            SizedBox(height: Dimens.height * .01),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Container(
                                      height: Dimens.height * 0.053,
                                      width: Dimens.width * .355,
                                      decoration: BoxDecoration(
                                        color: Color(0xfff5f5f5),
                                        borderRadius:
                                            BorderRadius.circular(20.00),
                                      ),
                                      child: Center(
                                        child: new Text(
                                          "Cancel",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontSize: 16,
                                            color: Color(0xff707070),
                                          ),
                                        ),
                                      )),
                                ),
                                SizedBox(width: Dimens.width * .05),
                                InkWell(
                                  onTap: () async {
                                    await deleteUser();
                                    getFrappeAuthController().logout();
                                    Get.dialog(Center(
                                        child: CircularProgressIndicator()));
                                    Future.delayed(Duration(seconds: 2))
                                        .then((_) async {
                                      Get.back();
                                      Get.offAll(() => SplashScreen(),
                                          transition: Transition.leftToRight);
                                    });
                                  },
                                  child: Container(
                                      height: Dimens.height * 0.053,
                                      width: Dimens.width * .355,
                                      decoration: BoxDecoration(
                                        color: Color(0xffeb786b),
                                        borderRadius:
                                            BorderRadius.circular(20.00),
                                      ),
                                      child: Center(
                                        child: new Text(
                                          "Continuer",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )),
                                ),
                              ],
                            )
                          ],
                        )),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
