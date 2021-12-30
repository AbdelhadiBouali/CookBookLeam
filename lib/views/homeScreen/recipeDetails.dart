import 'package:cookbook/models/recipe.model.dart';
import 'package:cookbook/tools/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class RecipeDetails extends HookWidget {
  // Using hook to control state of the widgets
  final Recipe recipeModel;
  RecipeDetails({
    @required this.recipeModel,
  });

  @override
  Widget build(BuildContext context) {
    final likeItem = useState<bool>(false);
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SlidingUpPanel(
        parallaxEnabled: true,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 12,
        ),
        minHeight: (Dimens.height / 2),
        maxHeight: Dimens.height / 1.2,
        panel: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 5,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                recipeModel.title,
                style: textTheme.headline3,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                recipeModel.description,
                style: textTheme.headline3,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    FlutterIcons.heart_circle_mco,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    recipeModel.likedBy != null
                        ? recipeModel.likedBy.toString()
                        : "0",
                    style: textTheme.headline3,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 2,
                    height: 30,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    recipeModel.rating != null
                        ? recipeModel.rating.toString() + ' Rating'
                        : "0" + ' Rating',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontFamily: "Montserrat"),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.black.withOpacity(0.3),
              ),
              Expanded(
                child: DefaultTabController(
                  length: 1,
                  initialIndex: 0,
                  child: Column(
                    children: [
                      TabBar(
                        isScrollable: true,
                        indicatorColor: Colors.red,
                        tabs: [
                          Tab(
                            text: "Comments".toUpperCase(),
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
                          horizontal: 32,
                        ),
                      ),
                      Divider(
                        color: Colors.black.withOpacity(0.3),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            Comments(recipeModel: recipeModel),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Hero(
                    tag: recipeModel.image,
                    child: ClipRRect(
                        child: FadeInImage.assetNetwork(
                            width: double.infinity,
                            height: (Dimens.height / 2) + 50,
                            placeholder: 'assets/images/loader.gif',
                            fit: BoxFit.cover,
                            image: recipeModel.image.toString(),
                            imageErrorBuilder: (context, error, stackTrace) {
                              return FadeInImage.assetNetwork(
                                width: double.infinity,
                                height: (Dimens.height / 2) + 50,
                                placeholder: 'assets/images/loader.gif',
                                fit: BoxFit.cover,
                                fadeInDuration: Duration(seconds: 3),
                                image:
                                    "https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
                              );
                            })),
                  ),
                ],
              ),
              Positioned(
                top: 40,
                right: 20,
                child: InkWell(
                  onTap: () {
                    likeItem.value = !likeItem.value;
                  },
                  child: Icon(
                    FlutterIcons.heart_circle_mco,
                    color: likeItem.value ? Colors.red : Colors.black,
                    size: 38,
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 20,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    CupertinoIcons.back,
                    color: Colors.white,
                    size: 38,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Comments extends StatelessWidget {
  const Comments({
    Key key,
    @required this.recipeModel,
  }) : super(key: key);

  final Recipe recipeModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Column(
          children: [
            recipeModel.comments != null
                ? ListView.separated(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: recipeModel.comments.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 2.0,
                        ),
                        child: Text(
                          '⚫️ ' + recipeModel.comments[index],
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontFamily: "Montserrat"),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(color: Colors.black.withOpacity(0.3));
                    },
                  )
                : Padding(
                    padding: EdgeInsets.only(top: Dimens.height * .15),
                    child: Center(
                      child: Text("No comments yet",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontFamily: "Montserrat")),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
