import 'package:cookbook/tools/dimensions.dart';
import 'package:cookbook/views/getStarted/widgets/slideModel.dart';
import 'package:cookbook/views/sharedWidgets/spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SlideItem extends StatelessWidget {
  final int index;
  SlideItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20), // Padding of the whole layout
      child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // To show title
              Container(
                width: Dimens.width * .5,
                child: Text(slideList[index].title,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.headline1),
              ),
              columnSpace(),
              // to show description
              Text(slideList[index].description,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.headline2),
              columnSpace(),
              Container(
                  height: Dimens.height * 0.3,
                  width: Dimens.width * .75,
                  child: SvgPicture.asset(slideList[index].imageUrl)),
            ],
          )),
    );
  }
}
