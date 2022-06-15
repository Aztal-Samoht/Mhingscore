import 'package:flutter/material.dart';
import 'package:mhing_score_card/providers/game_provider.dart';
import 'package:mhing_score_card/res/constants.dart';
import 'package:mhing_score_card/res/strings.dart';
import 'package:mhing_score_card/modals/add_hand_screen.dart';
import 'package:mhing_score_card/screens/rules_screen.dart';
import 'package:mhing_score_card/widgets/appearance/app_border.dart';
import 'package:mhing_score_card/widgets/appearance/mhing_button.dart';
import 'package:mhing_score_card/widgets/datatable_displayer.dart';
import 'package:mhing_score_card/widgets/nav_row/nav_row.dart';
import 'package:mhing_score_card/widgets/scorecard_tab_displayer.dart';
import 'package:provider/provider.dart';

class TabedScorecardScreen extends StatelessWidget {
  static String id = '/scorecard';

  const TabedScorecardScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(builder: (context, gp, child) {
      List<Tab> playerTabs = [];
      List<Widget> scorecards = [];
      gp.players.keys.forEach(
        (element) {
          // gp.activePlayer = element;
          playerTabs.add(Tab(text: element));
          scorecards.add(ScorecardTabDisplayer(element));
        },
      );

      return SafeArea(
        child: DefaultTabController(
          length: gp.players.length,
          child: Scaffold(
              appBar: AppBar(
                backgroundColor: kAppBarColor,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(sScoreCardTitle),
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
                ),
                bottom: TabBar(
                  tabs: playerTabs,
                ),
              ),
              body: TabBarView(children: scorecards)),
        ),
      );
    });
  }
}

class TotalScoreDisplayer extends StatelessWidget {
  const TotalScoreDisplayer(String this.playerName, {Key? key})
      : super(key: key);

  final String playerName;

  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(builder: (context, gp, child) {
      return Text(
        'Total Score: ${gp.players[playerName]?.totalScore}',
        style: const TextStyle(
            fontSize: 20, color: Colors.red, fontWeight: FontWeight.w600),
      );
    });
  }
}
