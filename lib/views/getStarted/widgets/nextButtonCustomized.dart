import 'package:cookbook/controllers/getStartedController.dart';
import 'package:cookbook/tools/colors.dart';
import 'package:cookbook/tools/dimensions.dart';
import 'package:cookbook/views/getStarted/widgets/slideDots.dart';
import 'package:cookbook/views/getStarted/widgets/slideModel.dart';
import 'package:cookbook/views/login/loginScreen.dart';
import 'package:cookbook/views/sharedWidgets/items.tools.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final GetStartedController getStartedController =
    Get.put(GetStartedController());

Widget nextButtonCustomized() {
  return Column(
    children: [
      Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          for (int i = 0; i < slideList.length; i++)
            if (i == getStartedController.currentPage.value)
              SlideDots(true)
            else
              SlideDots(false)
        ],
      ),
      SizedBox(height: Dimens.height * .1),
      InkWell(
        //suivant
        onTap: () {
          Get.to(LoginScreen(), transition: Transition.rightToLeftWithFade);
        },
        child:
            nextButton(CookColors.white, "Get Started", CookColors.mainColor),
      ),
    ],
  );
}
