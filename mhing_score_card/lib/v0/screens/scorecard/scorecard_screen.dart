///this screen is for keeping track of a single player's score during a
///single game of Mhing.

import 'package:flutter/material.dart';
import 'package:mhing_score_card/v0/providers/hand_list_provider.dart';
import 'package:mhing_score_card/v0/screens/rules_screen.dart';
import 'package:mhing_score_card/v0/screens/scorecard/new_hand_form/add_hand_screen.dart';
import 'package:mhing_score_card/v0/screens/scorecard/hand_datatable_displayer.dart';
import 'package:mhing_score_card/v0/widgets/nav_row/nav_row.dart';
import 'package:provider/provider.dart';
import 'package:mhing_score_card/v0/res/constants.dart';
import 'package:mhing_score_card/v0/res/strings.dart';
import 'package:mhing_score_card/v0/widgets/appearance/app_border.dart';
import 'package:mhing_score_card/v0/widgets/appearance/mhing_button.dart';

class ScorecardScreen extends StatelessWidget {
  static String id = '/scorecard';
  @override
  Widget build(BuildContext context) {
    return Consumer<HandListProvider>(builder: (context, handList, child) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: kAppBarColor,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(sScoreCardTitle),
                TextButton(
                  child: Text(
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
                  NavRow(),
                  SizedBox(height: 15),
                  MhingButton(
                    label: sScoreHandButtonText,
                    onPressed: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => AddHandScreen(),
                      );
                    },
                    height: 50.0,
                    width: double.infinity,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ///this widget should keep track of your score and update as you add hands to it
                          HandListAsDataTableDisplayer(),
                        ],
                      ),
                    ),
                  ),
                  Divider(color: Colors.red, thickness: 3),
                  Text(
                    'Total Score: ${handList.totalScore}',
                    style: TextStyle(
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
