import 'package:flutter/material.dart';
import 'package:mhing_score_card/providers/temp_hand_provider.dart';
import 'package:mhing_score_card/res/constants.dart';
import 'package:mhing_score_card/res/strings.dart';
import 'package:mhing_score_card/screens/rules_screen.dart';
import 'package:mhing_score_card/screens/tabed_scorecard_screen.dart';
import 'package:mhing_score_card/widgets/appearance/app_border.dart';
import 'package:mhing_score_card/widgets/appearance/mhing_button.dart';
import '../widgets/mhing_form_row.dart';
import 'package:provider/provider.dart';

class AddHandModal extends StatefulWidget {
  const AddHandModal({Key? key}) : super(key: key);

  @override
  State<AddHandModal> createState() => _AddHandModalState();
}

class _AddHandModalState extends State<AddHandModal> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TempHandProvider>(
      builder: (context, tempHand, child) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: kAppBarColor,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('addHand'),
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
              borderRadius: kAppBorderRadiusSm,
              backgroundColor: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text('One Credit:', style: kNewHandFormSectonFont),
                    Divider(color: Colors.black, thickness: 2),
                    MhingFormRow(index: 0, options: []),
                    MhingFormRow(index: 1, options: [0, 1, 2, 3]),
                    MhingFormRow(index: 2, options: [0, 1, 2, 3, 4, 5, 6]),
                    MhingFormRow(index: 3, options: [0, 1, 2, 3, 4]),
                    MhingFormRow(index: 4, options: [0, 1, 2]),
                    MhingFormRow(index: 5, options: []),
                    MhingFormRow(index: 6, options: [0, 1, 2, 3, 4, 5, 6, 7]),
                    MhingFormRow(
                        index: 7, options: [0, 1, 2, 3, 4, 5, 6, 7, 8]),
                    Text('Three Credit:', style: kNewHandFormSectonFont),
                    Divider(color: Colors.black, thickness: 2),
                    MhingFormRow(index: 8, options: []),
                    MhingFormRow(index: 9, options: [0, 1, 2, 3, 4, 5, 6]),
                    MhingFormRow(index: 10, options: []),
                    MhingFormRow(index: 11, options: []),
                    MhingFormRow(index: 12, options: []),
                    Text('Five Credit:', style: kNewHandFormSectonFont),
                    Divider(color: Colors.black, thickness: 2),
                    MhingFormRow(index: 13, options: []),
                    MhingFormRow(index: 14, options: []),
                    MhingFormRow(index: 15, options: []),
                    Text('Eight Credit:', style: kNewHandFormSectonFont),
                    Divider(color: Colors.black, thickness: 2),
                    MhingFormRow(index: 16, options: []),
                    MhingFormRow(index: 17, options: []),
                    MhingFormRow(index: 18, options: []),
                    Divider(color: Colors.black, thickness: 2),
                    SizedBox(
                      height: 20,
                    ),
                    MhingButton(
                      height: 50,
                      width: 175,
                      label: sSubmit,
                      onPressed: () {
                        tempHand.submit(context);
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.pushNamed(context, TabedScorecardScreen.id);
                      },
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}