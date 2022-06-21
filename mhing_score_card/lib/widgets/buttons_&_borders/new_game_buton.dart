import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mhing_score_card/modals/game_mode_modal.dart';
import 'package:mhing_score_card/modals/new_game_modal.dart';
import 'package:mhing_score_card/res/ad_helper.dart';
import 'package:mhing_score_card/res/constants.dart';
import 'package:mhing_score_card/res/strings.dart';
import 'package:mhing_score_card/screens/tabed_scorecard_screen.dart';

class NewGameBtn extends StatelessWidget {
  const NewGameBtn(this.flex, {Key? key}) : super(key: key);
  static double radius = 20;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kButtonPadding),
        child: Material(
          borderRadius: BorderRadius.circular(NewGameBtn.radius),
          elevation: 5.0,
          color: kAppBarColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              borderRadius: BorderRadius.circular(NewGameBtn.radius),
              color: Colors.red,
              child: MaterialButton(
                  child: sNewGameButtonText,
                  onPressed: () {
                    showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => GameModeModal());
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
