import 'package:flutter/material.dart';
import 'package:mhing_score_card/modals/add_hand_modal.dart';
import 'package:mhing_score_card/providers/game_provider.dart';
import 'package:mhing_score_card/res/constants.dart';
import 'package:mhing_score_card/res/strings.dart';
import 'package:mhing_score_card/widgets/buttons_&_borders/app_border.dart';
import 'package:mhing_score_card/widgets/buttons_&_borders/mhing_button.dart';
import 'package:mhing_score_card/widgets/buttons_&_borders/score_hand_btn.dart';
import 'package:mhing_score_card/widgets/datatable_displayer.dart';
import 'package:mhing_score_card/widgets/buttons_&_borders/nav_row/nav_row.dart';
import 'package:mhing_score_card/widgets/total_score_displayer.dart';
import 'package:provider/provider.dart';

class ScorecardTabDisplayer extends StatelessWidget {
  const ScorecardTabDisplayer(this.playerName, {Key? key}) : super(key: key);

  final String playerName;
  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(builder: (context, gp, child) {
      gp.activePlayer = playerName;
      return AppBorder(
        backgroundColor: Colors.white,
        borderRadius: kAppBorderRadiusSm,
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              const NavRow(),
              const SizedBox(height: 15), ScoreHandBtn(playerName: playerName),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ///this widget should keep track of your score and update as you add hands to it
                      DataDisplayer(playerName),
                      // HandListAsDataTableDisplayer(),
                    ],
                  ),
                ),
              ), //DataTableDisplayer
              const Divider(color: Colors.red, thickness: 3),
              TotalScoreDisplayer(playerName),
            ],
          ),
        ),
      );
    });
  }
}
