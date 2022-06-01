///this screen is for keeping track of a single player's score during a
///single game of Mhing.

import 'package:flutter/material.dart';
import 'package:mhing_score_card/v0/providers/hand_list_provider.dart';
import 'package:mhing_score_card/v0/screens/new_hand_form/add_hand_screen.dart';
import 'package:mhing_score_card/v0/widgets/hand_datatable_displayer.dart';
import 'package:provider/provider.dart';
import 'package:mhing_score_card/v0/res/constants.dart';
import 'package:mhing_score_card/v0/res/strings.dart';
import 'package:mhing_score_card/v0/widgets/app_border.dart';
import 'package:mhing_score_card/v0/widgets/mhing_button.dart';

class ScorecardScreen extends StatelessWidget {
  static String id = '/scorecard';
  @override
  Widget build(BuildContext context) {
    return Consumer<HandListProvider>(builder: (context, handList, child) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: kAppBarColor,
            title: Text(sScoreCardTitle),
          ),
          body: AppBorder(
            aBackgroundColor: Colors.white,
            borderRadius: 20,
            child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ///this button should bring you through 4 pop-ups to add a
                    ///new hand.  After which, all 4 should close and the new hand
                    /// should appear in a new column to the right.
                    ///
                    /// as each goes by the input is stored by the TempHandProvider.
                    /// at the end it is submitted to the HandListProvider.
                    MhingButton(
                      label: sScoreHandButtonText,
                      onPressed: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) =>
                              SingleChildScrollView(child: AddHandScreen()),
                        );
                      },
                      height: 50.0,
                      width: double.infinity,
                    ),

                    ///this widget should keep track of your score and update as you add hands to it
                    HandListToDataTableDisplayer(),
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
        ),
      );
    });
  }
}
