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
                  const Text('addHand'),
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
                    const Text('One Credit:', style: kNewHandFormSectonFont),
                    const Divider(color: Colors.black, thickness: 2),
                    const MhingFormRow(index: 0, options: []),
                    const MhingFormRow(index: 1, options: [0, 1, 2, 3]),
                    const MhingFormRow(
                        index: 2, options: [0, 1, 2, 3, 4, 5, 6]),
                    const MhingFormRow(index: 3, options: [0, 1, 2, 3, 4]),
                    const MhingFormRow(index: 4, options: [0, 1, 2]),
                    const MhingFormRow(index: 5, options: []),
                    const MhingFormRow(
                        index: 6, options: [0, 1, 2, 3, 4, 5, 6, 7]),
                    const MhingFormRow(
                        index: 7, options: [0, 1, 2, 3, 4, 5, 6, 7, 8]),
                    const Text('Three Credit:', style: kNewHandFormSectonFont),
                    const Divider(color: Colors.black, thickness: 2),
                    const MhingFormRow(index: 8, options: []),
                    const MhingFormRow(
                        index: 9, options: [0, 1, 2, 3, 4, 5, 6]),
                    const MhingFormRow(index: 10, options: []),
                    const MhingFormRow(index: 11, options: []),
                    const MhingFormRow(index: 12, options: []),
                    const Text('Five Credit:', style: kNewHandFormSectonFont),
                    const Divider(color: Colors.black, thickness: 2),
                    const MhingFormRow(index: 13, options: []),
                    const MhingFormRow(index: 14, options: []),
                    const MhingFormRow(index: 15, options: []),
                    const Text('Eight Credit:', style: kNewHandFormSectonFont),
                    const Divider(color: Colors.black, thickness: 2),
                    const MhingFormRow(index: 16, options: []),
                    const MhingFormRow(index: 17, options: []),
                    const MhingFormRow(index: 18, options: []),
                    const Divider(color: Colors.black, thickness: 2),
                    const SizedBox(
                      height: 20,
                    ),
                    MhingButton(
                      height: 50,
                      width: 175,
                      label: sSubmit,
                      onPressed: () {
                        tempHand.submit(context);
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(
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
