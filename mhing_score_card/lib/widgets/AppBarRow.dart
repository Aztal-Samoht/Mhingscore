import 'package:flutter/material.dart';
import 'package:mhing_score_card/res/constants.dart';
import 'package:mhing_score_card/screens/rules_screen.dart';

class AppBarRow extends StatelessWidget {
  AppBarRow(
    this.aTitle, {
    Key? key,
  }) : super(key: key);
  final String aTitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(aTitle),
        TextButton(
          child: const Text(
            'view rules',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              decoration: TextDecoration.underline,
            ),
          ),
          onPressed: () {
            Navigator.pushNamed(context, RulesScreen.id);
          },
        ),
      ],
    );
  }
}
