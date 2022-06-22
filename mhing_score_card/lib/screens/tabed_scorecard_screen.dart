import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mhing_score_card/res/ad_helper.dart';
import 'package:mhing_score_card/providers/game_provider.dart';
import 'package:mhing_score_card/res/constants.dart';
import 'package:mhing_score_card/res/strings.dart';
import 'package:mhing_score_card/screens/rules_screen.dart';
import 'package:mhing_score_card/widgets/scorecard_tab_displayer.dart';
import 'package:provider/provider.dart';

class TabedScorecardScreen extends StatelessWidget {
  static String id = '/scorecard';

  const TabedScorecardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(builder: (context, gp, child) {
      Map<Tab, Widget> tabs = {};
      for (String element in gp.players.keys) {
        tabs.addAll({Tab(text: element): ScorecardTabDisplayer(element)});
      }
      return WillPopScope(
        onWillPop: gp.canPop,
        child: SafeArea(
          child: DefaultTabController(
            length: gp.players.length,
            child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
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
                  tabs: tabs.keys.toList(),
                ),
              ),
              body: TabBarView(children: tabs.values.toList()),
            ),
          ),
        ),
      );
    });
  }
}
