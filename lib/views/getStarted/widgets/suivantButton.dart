import 'package:cookbook/tools/dimensions.dart';
import 'package:flutter/material.dart';

Widget nextButton(Color color, String text, Color textColor) {
  return Container(
    height: Dimens.height * 0.075,
    width: Dimens.width * .7,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(2250.00),
    ),
    child: Center(
      child: new Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: "Montserrat",
          fontSize: 16,
          color: textColor,
        ),
      ),
    ),
  );
}
