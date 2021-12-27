import 'package:cookbook/controllers/getStartedController.dart';
import 'package:cookbook/tools/colors.dart';
import 'package:cookbook/tools/dimensions.dart';
import 'package:cookbook/views/getStarted/widgets/slideItem.dart';
import 'package:cookbook/views/getStarted/widgets/slideModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/nextButtonCustomized.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<GetStartedController>(builder: (getStartedController) {
      // To update children in case of values changement (GetX as listener)
      return SafeArea(
        child: Scaffold(
          backgroundColor: CookColors.mainColor,
          body: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(top: Dimens.height * .1),
                child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: getStartedController.pageController,
                  onPageChanged: (index) {
                    getStartedController.currentPage(
                        index); // Change current page value which will be updated in the widget by GetX
                  },
                  itemCount: slideList.length,
                  itemBuilder: (ctx, i) => SlideItem(i),
                ),
              ),
              Positioned(
                  bottom: Dimens.height * .05, child: nextButtonCustomized())
            ],
          ),
        ),
      );
    });
  }
}
