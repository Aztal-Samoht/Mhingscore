import 'package:flutter/material.dart';
import 'package:mhing_score_card/modals/game_mode_modal.dart';
import 'package:mhing_score_card/modals/new_game_modal.dart';
import 'package:mhing_score_card/res/constants.dart';
import 'package:mhing_score_card/res/strings.dart';

class NewGameBtn extends StatelessWidget {
  const NewGameBtn({Key? key}) : super(key: key);
  static double radius = 20;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kButtonPadding),
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
                  child: sNewGameButtonText,
                  onPressed: () {
                    showDialog<String>(
                        context: context,
                        builder: (BuildContext context) =>
                            const GameModeModal());
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
