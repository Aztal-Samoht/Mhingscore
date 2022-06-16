import 'package:flutter/material.dart';
import 'package:mhing_score_card/res/constants.dart';

class MhingCard extends StatelessWidget {
  const MhingCard({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(kBtnRadius),
      elevation: 5.0,
      color: kAppBarColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          borderRadius: BorderRadius.circular(kBtnRadius - 10),
          color: Colors.red,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(child: child),
          ),
        ),
      ),
    );
  }
}
