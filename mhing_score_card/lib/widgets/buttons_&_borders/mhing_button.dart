import 'package:flutter/material.dart';
import 'package:mhing_score_card/res/constants.dart';

class MhingButton extends StatelessWidget {
  const MhingButton(
    this.label, {
    Key? key,
    required this.onPressed,
    required this.height,
    required this.width,
    this.style,
  }) : super(key: key);
  final String? label;
  final TextStyle? style;
  final void Function() onPressed;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Material(
        borderRadius: BorderRadius.circular(kBtnRadius),
        elevation: 5.0,
        color: kAppBarColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
            borderRadius: BorderRadius.circular(kBtnRadius),
            color: Colors.red,
            child: MaterialButton(
              child: Text(
                label!,
                style: this.style ?? const TextStyle(color: kButtonTextColor),
              ),
              onPressed: onPressed,
            ),
          ),
        ),
      ),
    );
  }
}
