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
