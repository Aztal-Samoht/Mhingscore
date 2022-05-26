import 'package:flutter/material.dart';
import 'package:mhing_score_card/v0.0.0/res/constants.dart';

class MhingButton extends StatelessWidget {
  const MhingButton({
    Key? key,
    required this.label,
    required this.onPressed,
    required this.height,
    required this.width,
  }) : super(key: key);
  static double radius = 20;
  final Text? label;
  final void Function() onPressed;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: this.width,
      height: this.height,
      child: Material(
        borderRadius: BorderRadius.circular(radius),
        elevation: 5.0,
        color: kAppBarColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
            borderRadius: BorderRadius.circular(radius),
            color: Colors.red,
            child: MaterialButton(
              child: label,
              onPressed: this.onPressed,
            ),
          ),
        ),
      ),
    );
  }
}
