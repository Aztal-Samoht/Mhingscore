import 'package:flutter/material.dart';
import 'package:mhing_score_card/modals/new_game_modal.dart';
import 'package:mhing_score_card/res/constants.dart';
import 'package:mhing_score_card/res/strings.dart';

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
                showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => NewGameModal());
              }),
        ),
      ),
    );
  }
}
