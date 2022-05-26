import 'package:flutter/material.dart';
import 'package:mhing_score_card/v0.0.0/res/constants.dart';
import 'package:mhing_score_card/v0.0.0/screens/scorecard_screen.dart';

class MhingButton extends StatelessWidget {
  const MhingButton({Key? key, required this.child}) : super(key: key);
  static double radius = 20;
  final Text? child;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(radius),
      elevation: 5.0,
      color: kAppBarColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          borderRadius: BorderRadius.circular(radius),
          color: Colors.red,
          child: MaterialButton(
            child: child,
            onPressed: () {
              Navigator.pushNamed(context, ScorecardScreen.id);
            },
          ),
        ),
      ),
    );
  }
}
