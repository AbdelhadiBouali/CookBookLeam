import 'package:cookbook/controllers/signupController.dart';
import 'package:cookbook/tools/dimensions.dart';
import 'package:cookbook/views/sharedWidgets/snackbar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final SignUpController signUpController = Get.put(SignUpController());

Widget signupLayout() {
  return Form(
    key: signUpController.formKey,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: Dimens.height * .05),
        new Text(
          "Start the adventure",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w700,
            fontSize: 28,
            color: Color(0xff000000),
          ),
        ),
        SizedBox(height: Dimens.height * .023),
        new Text(
          "Create a cookbook account",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 13,
            color: Color(0xff000000),
          ),
        ),
        SizedBox(height: Dimens.height * .07),
        fullNameInput(),
        SizedBox(height: Dimens.height * .026),
        emailInput(),
        SizedBox(height: Dimens.height * .026),
        passwordInput(),
        SizedBox(height: Dimens.height * .025),
        submitButton(),
        SizedBox(height: Dimens.height * .05),
        new Text(
          "Already have an account?",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        InkWell(
          onTap: () {
            Get.back();
          },
          child: new Text(
            "Log in",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 16,
              color: Color(0xffeb786b),
            ),
          ),
        )
      ],
    ),
  );
}

// Input textfields

Widget fullNameInput() {
  return new Container(
    //Full name
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
        controller: signUpController.fullNameTextController, //
        onTap: () {
          signUpController.selectedField(1);
        },
        validator: (fullName) {
          String pattern =
              r"^([a-zA-Z]+[\'\,\.\-]?[a-zA-Z ]*)+[ ]([a-zA-Z]+[\'\,\.\-]?[a-zA-Z ]+)+$";
          RegExp regex = new RegExp(pattern);
          if (!regex.hasMatch(
              fullName != null ? fullName : 'Please Enter a correct name'))
            return 'Please Enter a correct name';
          else
            return null;
        },
        style: TextStyle(
          fontFamily: "Montserrat",
          fontSize: 13,
          color: Colors.black,
        ),
        keyboardType: TextInputType.name,
        cursorColor: Color(0xffeb786b),
        decoration: InputDecoration(
          errorStyle: TextStyle(height: 0),
          prefixIcon: Icon(
            Icons.person,
            color: signUpController.selectedField.value == 1
                ? Color(0xffeb786b)
                : Color(0xff707070).withOpacity(0.5),
          ),
          hintText: "Fullname",
          hintStyle: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 13,
            color: signUpController.selectedField.value == 1
                ? Color(0xffeb786b)
                : Color(0xffcfcfcf),
          ),
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(29.00),
            borderSide: BorderSide(
              color: Color(0xffeb786b),
              width: 1.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(29),
            borderSide: BorderSide(color: Colors.transparent, width: 0.0),
          ),
        ),
      ),
    ),
  );
}

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
    child: Align(
      alignment: Alignment.bottomCenter,
      child: TextFormField(
        controller: signUpController.emailTextController,
        validator: (value) => EmailValidator.validate(
                value != null ? value : "Please enter a valid adress")
            ? null
            : "Please enter a valid adress",
        style: TextStyle(
          fontFamily: "Montserrat",
          fontSize: 13,
          color: Colors.black,
        ),
        onTap: () {
          signUpController.selectedField(2);
        },
        keyboardType: TextInputType.emailAddress,
        cursorColor: Color(0xff006e77),
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.email,
            color: signUpController.selectedField.value == 2
                ? Color(0xffeb786b)
                : Color(0xff707070).withOpacity(0.5),
          ),
          hintText: "Email",
          hintStyle: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 13,
            color: signUpController.selectedField.value == 2
                ? Color(0xffeb786b)
                : Color(0xffcfcfcf),
          ),
          //Borders
          border: InputBorder.none,
          errorStyle: TextStyle(height: 0),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(29.00),
            borderSide: BorderSide(
              color: Color(0xffeb786b),
              width: 1.0,
            ),
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(29),
            borderSide: BorderSide(color: Colors.transparent, width: 0.0),
          ),
        ),
      ),
    ),
  );
}

Widget passwordInput() {
  return new Container(
    //Password
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
        controller: signUpController.passwordTextController,
        validator: (password) {
          if (password.length < 6)
            return 'The password must be > 6 caracters';
          else
            return null;
        },
        style: TextStyle(
          fontFamily: "Montserrat",
          fontSize: 13,
          color: Color(0xffeb786b),
        ),
        onTap: () {
          signUpController.selectedField(4);
        },
        obscureText: true,
        decoration: InputDecoration(
          errorStyle: TextStyle(height: 0),
          prefixIcon: Icon(
            Icons.lock,
            color: signUpController.selectedField.value == 4
                ? Color(0xffeb786b)
                : Color(0xff707070).withOpacity(0.5),
          ),
          hintText: "Password",
          hintStyle: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 13,
            color: signUpController.selectedField.value == 4
                ? Color(0xffeb786b)
                : Color(0xffcfcfcf),
          ),
          //Borders
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(29.00),
            borderSide: BorderSide(
              color: Color(0xffeb786b),
              width: 1.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(29),
            borderSide: BorderSide(color: Colors.transparent, width: 0.0),
          ),
          border: InputBorder.none,
        ),
      ),
    ),
  );
}

Widget submitButton() {
  return InkWell(
    onTap: () {
      customSnackbar(
          "SignUp Function Callback", "Error 500 : Internal Server error", 10);
    },
    child: Container(
      height: Dimens.height * 0.053,
      width: Dimens.width * .55,
      decoration: BoxDecoration(
        color: Color(0xffeb786b),
        borderRadius: BorderRadius.circular(20.00),
      ),
      child: Center(
        child: new Text(
          "Create an account",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 16,
            color: Color(0xffffffff),
          ),
        ),
      ),
    ),
  );
}
