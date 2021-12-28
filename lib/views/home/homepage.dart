import 'package:cookbook/controllers/homeController.dart';
import 'package:cookbook/tools/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final HomePageController homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () {
      // The function to quit the app
      return homePageController.quitApp();
    }, child: Obx(() {
      return Scaffold(
        body: Center(
          child: screensChoice.elementAt(homePageController.selectedIndex
              .value), // Using Homepage controller to control selected nav bar index and update it
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(FlutterIcons.home_ant),
                title: Text('Recipes',
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 12,
                      //   color: Color(0xff006e77),
                    )),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.food_bank_outlined),
                title: Text('My recipes',
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 12,
                      //   color: Color(0xff006e77),
                    )),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  FlutterIcons.heart_circle_outline_mco,
                ),
                title: Text('Favorites',
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 12,
                      //  color: Color(0xff006e77),
                    )),
              ),
              BottomNavigationBarItem(
                icon: Icon(FlutterIcons.person_mdi),
                title: Text('Profile',
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 12,
                      //  color: Color(0xff006e77),
                    )),
              ),
            ],
            currentIndex: homePageController.selectedIndex.value,
            showUnselectedLabels: true,
            selectedItemColor: Color(0xffeb786b),
            unselectedItemColor: Color(0xff000000),
            selectedLabelStyle: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 12,
              color: Color(0xffeb786b),
            ),
            unselectedLabelStyle: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 12,
              color: Color(0xff818181),
            ),
            onTap: (value) {
              homePageController.selectedIndex(value);
              homePageController.queue.add(value);
            }),
      );
    }));
  }
}
