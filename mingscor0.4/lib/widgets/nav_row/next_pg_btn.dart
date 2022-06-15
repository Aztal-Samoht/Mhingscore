import 'package:flutter/material.dart';
import 'package:mhing_score_card/providers/game_provider.dart';
import 'package:mhing_score_card/providers/hand_list_provider.dart';
import 'package:mhing_score_card/screens/tabed_scorecard_screen.dart';
import 'package:mhing_score_card/widgets/nav_row/nav_btn.dart';
import 'package:provider/provider.dart';

class NextPageBtn extends StatelessWidget {
  const NextPageBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(builder: (context, gp, child) {
      return Expanded(
        child: NavBtn(
          text: 'Next',
          onPressed: () {
            // Navigator.pop(context);
            gp.incPage();
            // Navigator.pushNamed(context, TabedScorecardScreen.id);
          },
        ),
      );
    });
  }
}
