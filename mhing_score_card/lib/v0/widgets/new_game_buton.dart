import 'package:flutter/material.dart';
import 'package:mhing_score_card/v0/providers/hand_list_provider.dart';
import 'package:mhing_score_card/v0/providers/hand_v2_list_provider.dart';
import 'package:mhing_score_card/v0/res/constants.dart';
import 'package:mhing_score_card/v0/res/strings.dart';
import 'package:mhing_score_card/v0/screens/scorecard_screen.dart';
import 'package:provider/provider.dart';

class NewGameButton extends StatelessWidget {
  const NewGameButton({Key? key}) : super(key: key);
  static double radius = 20;

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
            child: sNewGameButtonText,
            onPressed: () {
              context.read<Hand2ListProvider>().reset();
              Navigator.pushNamed(context, ScorecardScreen.id);
            },
          ),
        ),
      ),
    );
  }
}
