import 'package:flutter/material.dart';
import 'package:mhing_score_card/v0.0.0/res/constants.dart';

class AppBorder extends StatelessWidget {
  const AppBorder({Key? key, required this.child}) : super(key: key);

  final Widget child;

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
            color: kBackgroundColor,
            borderRadius: BorderRadius.circular(50),
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
