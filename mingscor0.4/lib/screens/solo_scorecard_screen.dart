import 'package:flutter/material.dart';
import 'package:mhing_score_card/providers/game_provider.dart';
import 'package:mhing_score_card/res/constants.dart';
import 'package:mhing_score_card/res/strings.dart';
import 'package:mhing_score_card/screens/rules_screen.dart';
import 'package:mhing_score_card/widgets/appearance/app_border.dart';
import 'package:mhing_score_card/widgets/nav_row/nav_row.dart';
import 'package:provider/provider.dart';

class SoloScorecardScreen extends StatelessWidget {
  static String id = '/scorecard';

  const SoloScorecardScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(builder: (context, gp, child) {
      return SafeArea(
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
          ),
          body: AppBorder(
            backgroundColor: Colors.white,
            borderRadius: kAppBorderRadiusSm,
            child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Column(
                children: [
                  const NavRow(),
                  const SizedBox(height: 15),
                  // MhingButton(
                  //   label: sScoreHandButtonText,
                  //   onPressed: () {
                  //     showModalBottomSheet(
                  //       isScrollControlled: true,
                  //       context: context,
                  //       builder: (context) => AddHandScreen(),
                  //     );
                  //   },
                  //   height: 50.0,
                  //   width: double.infinity,
                  // ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: const [
                          // HandListAsDataTableDisplayer(),
                        ],
                      ),
                    ),
                  ),
                  const Divider(color: Colors.red, thickness: 3),
                  Text(
                    'Total Score: ${gp.players[gp.activePlayer]!.totalScore}',
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
