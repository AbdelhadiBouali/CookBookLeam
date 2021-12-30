import 'package:cookbook/models/recipe.model.dart';
import 'package:cookbook/tools/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class RecipeCard extends StatefulWidget {
  final Recipe recipeModel;
  RecipeCard({
    @required this.recipeModel,
  });

  @override
  _RecipeCardState createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  bool loved = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Hero(
                  tag: widget.recipeModel.image,
                  child: FadeInImage.assetNetwork(
                      width: double.infinity,
                      height: (Dimens.height / 2) + 50,
                      placeholder: 'assets/images/loader.gif',
                      fit: BoxFit.cover,
                      fadeInDuration: Duration(seconds: 3),
                      image: widget.recipeModel.image.toString(),
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
                      }),
                ),
              ),
            ),
            Positioned(
              top: 20,
              right: 20,
              child: InkWell(
                onTap: () {
                  setState(() {
                    loved = !loved;
                  });
                },
                child: Icon(
                  FlutterIcons.heart_circle_mco,
                  color: loved ? Colors.red : Colors.black,
                  size: 38,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.recipeModel.title,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      widget.recipeModel.owner.toString(),
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
              ),
              // Spacer(),
            ],
          ),
        ),
      ],
    );
  }
}
