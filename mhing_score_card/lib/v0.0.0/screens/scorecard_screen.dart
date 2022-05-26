import 'package:flutter/material.dart';
import 'package:mhing_score_card/v0.0.0/res/constants.dart';
import 'package:mhing_score_card/v0.0.0/res/strings.dart';
import 'package:mhing_score_card/v0.0.0/widgets/add_hand_form.dart';
import 'package:mhing_score_card/v0.0.0/widgets/app_border.dart';
import 'package:mhing_score_card/v0.0.0/widgets/mhing_button.dart';

class ScorecardScreen extends StatelessWidget {
  static String id = '/scorecard';
  const ScorecardScreen({Key? key}) : super(key: key);

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
            child: Column(
              children: [
                MhingButton(
                    label: sScoreHandButtonText,
                    onPressed: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) =>
                            SingleChildScrollView(child: AddHandForm()),
                      );
                    },
                    height: 50.0,
                    width: double.infinity),
                Row(
                  children: [
                    DataTable(
                      columns: [
                        DataColumn(label: Text('Hand Type')),
                      ],
                      rows: [],
                    ),
                    DataTable(
                      columns: [
                        DataColumn(label: Text('Hand 1')),
                      ],
                      rows: [],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
