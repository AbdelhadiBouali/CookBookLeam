import 'package:flutter/material.dart';

class SlideDots extends StatefulWidget {
  final bool isActive;
  SlideDots(this.isActive);

  @override
  _SlideDotsState createState() => _SlideDotsState();
}

class _SlideDotsState extends State<SlideDots> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 7),
      height: 8,
      width: widget.isActive ? 25 : 8,
      decoration: BoxDecoration(
        color: widget.isActive ? Colors.white : Color(0xffd8d8d9),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
