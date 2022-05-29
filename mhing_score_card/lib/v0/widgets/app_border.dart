import 'package:flutter/material.dart';
import 'package:mhing_score_card/v0/res/constants.dart';

class AppBorder extends StatelessWidget {
  AppBorder(
      {Key? key,
      required this.child,
      Color? aBackgroundColor,
      required this.borderRadius})
      : super(key: key) {
    this.backgroundColor =
        aBackgroundColor == null ? kBackgroundColor : this.backgroundColor;
  }

  final Widget child;
  double borderRadius;
  Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/card_back.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Material(
            color: this.backgroundColor,
            borderRadius: BorderRadius.circular(this.borderRadius),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SafeArea(
                child: this.child,
              ),
            ),
          ),
        ));
  }
}
