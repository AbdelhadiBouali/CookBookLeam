import 'package:cookbook/views/homeScreen/newRecipes.dart';
import 'package:cookbook/views/sharedWidgets/items.tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class HomeScreen extends HookWidget {
  // Using hook widget to manage state
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: DefaultTabController(
          length: 3,
          initialIndex: 0,
          child: Column(
            children: [
              /*  Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  title("New Recipes", context),
                ],
              ),*/
              SizedBox(
                height: 20,
              ),
              TabBar(
                isScrollable: true,
                indicatorColor: Colors.red,
                tabs: [
                  Tab(
                    text: "New Recipes".toUpperCase(),
                  ),
                  Tab(
                    text: "Favourites".toUpperCase(),
                  ),
                  Tab(
                    text: "Categories".toUpperCase(),
                  ),
                ],
                labelColor: Colors.black,
                indicator: DotIndicator(
                  color: Colors.black,
                  distanceFromCenter: 16,
                  radius: 3,
                  paintingStyle: PaintingStyle.fill,
                ),
                unselectedLabelColor: Colors.black.withOpacity(0.3),
                labelStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Montserrat"),
                labelPadding: EdgeInsets.symmetric(
                  horizontal: 24,
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    NewRecipe(),
                    NewRecipe(),
                    NewRecipe(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
