import 'package:cookbook/controllers/loginController.dart';
import 'package:cookbook/tools/colors.dart';
import 'package:cookbook/tools/dimensions.dart';
import 'package:cookbook/views/sharedWidgets/spacers.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

final LoginController loginController = Get.put(LoginController());

Widget loginLayout(GlobalKey<FormState> formKey) {
  return Form(
    key: formKey,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: Dimens.height * .14,
          ),
          child: SvgPicture.asset(
            "assets/images/login.svg",
          ),
        ),
        new Text(
          "Welcome !",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w700,
            fontSize: 36,
            color: Color(0xff000000),
          ),
        ),
        SizedBox(height: Dimens.height * .023),
        new Text(
          "Sign in to discover a whole new world of cooking",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 13,
            color: Color(0xff707070),
          ),
        ),
        columnSpace(),
        // emailInput(),
        columnSpace(),
        //passwordInput(),
        columnSpace(),
        InkWell(
            onTap: () {
              //         Get.offAll(HomePage());
              if (formKey.currentState.validate()) {
                //   loginApi(); // Login Function
              }
            },
            child:
                nextButton(CookColors.white, "Sign in", CookColors.mainColor)),
        columnSpace(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Text(
              "You don't have an account? ",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 16,
                color: Color(0xff707070),
              ),
            ),
            InkWell(
              onTap: () {
                //Get.to(SignupScreen(), transition: Transition.rightToLeft);
              },
              child: new Text(
                "Sign up",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 16,
                  color: Color(0xffeb786b),
                ),
              ),
            )
          ],
        )
      ],
    ),
  );
}

/// Login Email Textfield
Widget emailInput() {
  return new Container(
    //Email
    height: Dimens.height * .068,
    width: Dimens.width * .84,
    decoration: BoxDecoration(
      color: Color(0xffffffff),
      border: Border.all(
        width: 1.00,
        color: Colors.transparent,
      ),
      boxShadow: [
        BoxShadow(
          offset: Offset(0.00, 3.00),
          color: Color(0xff000000).withOpacity(0.05),
          blurRadius: 6,
        ),
      ],
      borderRadius: BorderRadius.circular(29.00),
    ),
    child: Center(
      child: TextFormField(
        controller: loginController.loginEmailTextController,
        onTap: () {
          loginController.emailCheck(true);
          loginController.passCheck(false);
        },
        validator: (value) => EmailValidator.validate(value)
            ? null
            : "Veuillez introduire une adresse email correcte",
        keyboardType: TextInputType.emailAddress,
        cursorColor: Color(0xff006e77),
        style: TextStyle(
          fontFamily: "Montserrat",
          fontSize: 13,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.email,
            color: loginController.emailCheck.value == true
                ? CookColors.mainColor
                : Color(0xff707070).withOpacity(0.5),
          ),
          hintText: "Email",
          hintStyle: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 13,
            color: loginController.emailCheck.value == true
                ? Color(0xffeb786b)
                : Color(0xffcfcfcf),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(29.00),
            borderSide: BorderSide(
              color: CookColors.mainColor,
              width: 1.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(29),
            borderSide: BorderSide(color: Colors.transparent, width: 0.0),
          ),
          border: InputBorder.none,
          errorStyle: TextStyle(height: 0),
        ),
      ),
    ),
  );
}
