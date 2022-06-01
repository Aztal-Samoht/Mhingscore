import 'package:flutter/material.dart';
import 'package:mhing_score_card/v0/providers/temp_hand_v2_provider.dart';
import 'package:mhing_score_card/v0/res/constants.dart';
import 'package:mhing_score_card/v0/res/strings.dart';
import 'package:mhing_score_card/v0/screens/new_hand_form_v2/mhing_form_row.dart';
import 'package:provider/provider.dart';

import '../../widgets/mhing_button.dart';

///todo:make this new form pop up and go down and submit a new hand
///
class AddHandScreen extends StatefulWidget {
  const AddHandScreen({Key? key}) : super(key: key);

  @override
  State<AddHandScreen> createState() => _AddHandScreenState();
}

class _AddHandScreenState extends State<AddHandScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TempHand2Provider>(
      builder: (context, tempHand, child) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Text('One Credit:', style: kNewHandFormSectonFont),
              Divider(color: Colors.black, thickness: 2),
              MhingFormRow<bool>(index: 0, options: [true, false]),
              MhingFormRow<int>(index: 1, options: [0, 1, 2, 3]),
              MhingFormRow<int>(index: 2, options: [0, 1, 2, 3, 4, 5, 6]),
              MhingFormRow<int>(index: 3, options: [0, 1, 2, 3, 4]),
              MhingFormRow<int>(index: 4, options: [0, 1, 2]),
              MhingFormRow<bool>(index: 5, options: [true, false]),
              MhingFormRow<bool>(index: 6, options: [true, false]),
              MhingFormRow<int>(index: 7, options: [0, 1, 2, 3, 4, 5, 6, 7, 8]),
              Text('Three Credit:', style: kNewHandFormSectonFont),
              Divider(color: Colors.black, thickness: 2),
              MhingFormRow<bool>(index: 8, options: [true, false]),
              MhingFormRow<int>(index: 2, options: [0, 1, 2, 3, 4, 5, 6]),
              MhingFormRow<bool>(index: 10, options: [true, false]),
              MhingFormRow<bool>(index: 11, options: [true, false]),
              MhingFormRow<bool>(index: 12, options: [true, false]),
              Text('Five Credit:', style: kNewHandFormSectonFont),
              Divider(color: Colors.black, thickness: 2),
              MhingFormRow<bool>(index: 13, options: [true, false]),
              MhingFormRow<bool>(index: 14, options: [true, false]),
              MhingFormRow<bool>(index: 15, options: [true, false]),
              Text('Eight Credit:', style: kNewHandFormSectonFont),
              Divider(color: Colors.black, thickness: 2),
              MhingFormRow<bool>(index: 16, options: [true, false]),
              MhingFormRow<bool>(index: 17, options: [true, false]),
              MhingFormRow<bool>(index: 18, options: [true, false]),
              MhingButton(
                height: 50,
                width: 175,
                label: sSubmit,
                onPressed: () {
                  tempHand.submit(context);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
