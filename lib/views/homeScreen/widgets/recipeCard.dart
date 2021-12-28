import 'package:cookbook/models/recipe.model.dart';
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
  bool saved = false;
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
                  tag: widget.recipeModel.imgPath,
                  child: Image(
                    height: 320,
                    width: 320,
                    fit: BoxFit.cover,
                    image: AssetImage(widget.recipeModel.imgPath),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 20,
              right: 40,
              child: InkWell(
                onTap: () {
                  setState(() {
                    saved = !saved;
                  });
                },
                child: Icon(
                  saved
                      ? FlutterIcons.bookmark_check_mco
                      : FlutterIcons.bookmark_outline_mco,
                  color: Colors.white,
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
                      widget.recipeModel.writer,
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
              ),
              // Spacer(),
              Flexible(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      FlutterIcons.timer_mco,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      widget.recipeModel.cookingTime.toString() + '\'',
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        setState(() {
                          loved = !loved;
                        });
                      },
                      child: Icon(
                        FlutterIcons.heart_circle_mco,
                        color: loved ? Colors.red : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
