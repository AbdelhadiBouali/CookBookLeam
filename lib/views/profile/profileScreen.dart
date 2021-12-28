import 'package:cookbook/views/profile/widgets/profileWidgets.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: profileBody())));
  }
}
