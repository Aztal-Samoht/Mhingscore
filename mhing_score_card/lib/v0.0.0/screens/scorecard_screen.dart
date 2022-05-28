///this screen is for keeping track of a single player's score during a
///single game of Mhing.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mhing_score_card/v0.0.0/providers/hand_list_provider.dart';
import 'package:mhing_score_card/v0.0.0/res/constants.dart';
import 'package:mhing_score_card/v0.0.0/res/strings.dart';
import 'package:mhing_score_card/v0.0.0/widgets/add_hand_form_one_cred.dart';
import 'package:mhing_score_card/v0.0.0/widgets/app_border.dart';
import 'package:mhing_score_card/v0.0.0/widgets/hand_datatable_displayer.dart';
import 'package:mhing_score_card/v0.0.0/widgets/mhing_button.dart';

class ScorecardScreen extends StatefulWidget {
  static String id = '/scorecard';
  const ScorecardScreen({Key? key}) : super(key: key);

  @override
  State<ScorecardScreen> createState() => _ScorecardScreenState();
}

class _ScorecardScreenState extends State<ScorecardScreen> {
  @override
  Widget build(BuildContext context) {
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
                            SingleChildScrollView(child: AddHandFormOneCred()),
                      );
                    },
                    height: 50.0,
                    width: double.infinity,
                  ),

                  ///this widget should keep track of your score and update as you add hands to it
                  HandListToDataTableDisplayer(),
                  Text(
                      'Total Score: ${context.read<HandListProvider>().getTotalScore()}'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
