import 'dart:async';
import 'package:cookbook/controllers/getStartedController.dart';
import 'package:cookbook/tools/dimensions.dart';
import 'package:cookbook/views/getStarted/widgets/slideDots.dart';
import 'package:cookbook/views/getStarted/widgets/slideItem.dart';
import 'package:cookbook/views/getStarted/widgets/slideModel.dart';
import 'package:cookbook/views/login/loginScreen.dart';
import 'package:cookbook/views/sharedWidgets/spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

import 'widgets/suivantButton.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GetStartedController getStartedController =
        Get.put(GetStartedController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffeb786b),
        body: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: getStartedController.pageController,
              onPageChanged: (index) {},
              itemCount: slideList.length,
              itemBuilder: (ctx, i) => SlideItem(i),
            ),
            Positioned(
                top: Dimens.height * .73,
                child: Column(
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
                    columnSpace(),
                    InkWell(
                      //suivant
                      onTap: () {
                        if (getStartedController.currentPage.value != 2) {
                          Get.to(LoginScreen(),
                              transition: Transition.rightToLeftWithFade);
                        } else {
                          Get.offAll(LoginScreen(),
                              transition: Transition.rightToLeftWithFade);
                        }
                      },
                      child: nextButton(
                          Color(0xffffffff), "Get Started", Color(0xffeb786b)),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
