import 'package:flutter/material.dart';
import 'package:mhing_score_card/modals/add_hand_modal.dart';
import 'package:mhing_score_card/providers/game_provider.dart';
import 'package:mhing_score_card/providers/hand_list_provider.dart';
import 'package:mhing_score_card/res/constants.dart';
import 'package:mhing_score_card/res/strings.dart';
import 'package:mhing_score_card/screens/rules_screen.dart';
import 'package:mhing_score_card/widgets/AppBarRow.dart';
import 'package:mhing_score_card/widgets/buttons_&_borders/app_border.dart';
import 'package:mhing_score_card/widgets/buttons_&_borders/mhing_button.dart';
import 'package:mhing_score_card/widgets/buttons_&_borders/nav_row/nav_row.dart';
import 'package:mhing_score_card/widgets/buttons_&_borders/score_hand_btn.dart';
import 'package:mhing_score_card/widgets/hand_list_as_data_table_displayer.dart';
import 'package:provider/provider.dart';

class SoloScorecardScreen extends StatelessWidget {
  static String id = '/soloScorecard';

  const SoloScorecardScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<HandListProvider>(builder: (context, hl, child) {
      return SafeArea(
        child: Scaffold(
          // appBar: MyAppBar(sScoreCardTitle),
          appBar: AppBar(
            backgroundColor: kAppBarColor,
            title: AppBarRow(sScoreCardTitle),
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
                  ScoreHandBtn(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: const [
                          HandListAsDataTableDisplayer(),
                        ],
                      ),
                    ),
                  ),
                  const Divider(color: Colors.red, thickness: 3),
                  Text(
                    'Total Score: ${hl.totalScore}',
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
