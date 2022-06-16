import 'package:flutter/material.dart';
import 'package:mhing_score_card/v0_4/widgets/buttons_&_borders/mhing_button.dart';

class NavBtn extends StatelessWidget {
  const NavBtn({Key? key, required this.text, required this.onPressed})
      : super(key: key);
  final void Function() onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return MhingButton(
      text,
      onPressed: onPressed,
      height: 50,
      width: double.infinity,
    );
  }
}
