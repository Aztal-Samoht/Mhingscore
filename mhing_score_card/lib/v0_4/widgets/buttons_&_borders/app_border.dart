import 'package:flutter/material.dart';
import 'package:mhing_score_card/v0/res/constants.dart';

class AppBorder extends StatelessWidget {
  AppBorder(
      {Key? key,
      required this.child,
      Color? backgroundColor,
      required this.borderRadius})
      : super(key: key) {
    this.backgroundColor =
        backgroundColor == null ? kBackgroundColor : this.backgroundColor;
  }

  final Widget child;
  double borderRadius;
  Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/card_back.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Material(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(borderRadius),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SafeArea(
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
