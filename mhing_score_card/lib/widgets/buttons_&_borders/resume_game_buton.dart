import 'package:flutter/material.dart';
import 'package:mhing_score_card/providers/game_provider.dart';
import 'package:mhing_score_card/res/constants.dart';
import 'package:mhing_score_card/res/strings.dart';
import 'package:mhing_score_card/screens/solo_scorecard_screen.dart';
import 'package:mhing_score_card/screens/tabed_scorecard_screen.dart';
import 'package:provider/provider.dart';

class ResumeGameBtn extends StatelessWidget {
  const ResumeGameBtn(this.flex, {Key? key}) : super(key: key);
  static double radius = 20;
  final int flex;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: flex,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kButtonPadding),
          child: Consumer<GameProvider>(builder: (context, gp, child) {
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
                    child: sResumeButtonText,
                    onPressed: () {
                      if (gp.isGameActive) {
                        gp.singlePlayerMode
                            ? Navigator.pushNamed(
                                context, SoloScorecardScreen.id)
                            : Navigator.pushNamed(
                                context, TabedScorecardScreen.id);
                      } else {
                        showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                  title: const Text('No Active Game'),
                                  content: const Text(
                                      'There is no game currently being scored.'),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Close'))
                                  ],
                                ));
                      }
                    },
                  ),
                ),
              ),
            );
          }),
        ));
  }
}
