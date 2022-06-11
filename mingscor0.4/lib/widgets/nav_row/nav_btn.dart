import 'package:flutter/material.dart';
import 'package:mhing_score_card/widgets/appearance/mhing_button.dart';

class NavBtn extends StatelessWidget {
  NavBtn({Key? key, required this.text, required this.onPressed})
      : super(key: key);
  final void Function() onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return MhingButton(
      label: text,
      onPressed: onPressed,
      height: 50,
      width: double.infinity,
    );
  }
}
