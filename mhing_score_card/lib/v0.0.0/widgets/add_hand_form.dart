import 'package:flutter/material.dart';
import 'package:mhing_score_card/v0.0.0/providers/temp_hand_provider.dart';
import 'package:mhing_score_card/v0.0.0/res/constants.dart';
import 'package:mhing_score_card/v0.0.0/widgets/new_hand_form_row.dart';
import 'package:provider/provider.dart';

class AddHandForm extends StatefulWidget {
  const AddHandForm({Key? key}) : super(key: key);

  @override
  State<AddHandForm> createState() => _AddHandFormState();
}

class _AddHandFormState extends State<AddHandForm> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TempHandProvider>(builder: (context, newHand, child) {
      return Material(
        color: Colors.white,
        child: Form(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  Text('One Credit:', style: kNewHandFormSectonFont),
                  Divider(color: Colors.black, thickness: 2),
                  getBoolPicker([true, false], 'Sequence Only Hand',
                      newHand.getSeqOnly, newHand.setSeqOnly),
                  getNumberPicker([0, 1, 2, 3], 'Double Sequence',
                      newHand.getDblSeq, newHand.setDblSeq),
                  getNumberPicker([0, 1, 2, 3, 4, 5, 6], 'Double Triplet',
                      newHand.getDblTrip, newHand.setDblTrip),
                  Text('Three Credit:', style: kNewHandFormSectonFont),
                  Divider(color: Colors.black, thickness: 2),
                  Text('Five Credit:', style: kNewHandFormSectonFont),
                  Divider(color: Colors.black, thickness: 2),
                  Text('Eight Credit:', style: kNewHandFormSectonFont),
                  Divider(color: Colors.black, thickness: 2),
                  TextButton(
                    onPressed: () {
                      print(newHand.getDblSeq());
                    },
                    child: Text('print dblSeq'),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  NewHandFormRow getNumberPicker(List<int> nums, String aHint,
      int Function() getter, void Function(int) setter) {
    List<DropdownMenuItem<int>> menuItems = [];
    nums.forEach(
      (int a) {
        menuItems.add(
          DropdownMenuItem(
            child: Text(a.toString(), style: kNewHandFormFont),
            value: a,
          ),
        );
      },
    );

    return NewHandFormRow<int>(
      aHint: aHint,
      getter: getter,
      setter: setter,
      menuItems: menuItems,
    );
  }

  NewHandFormRow getBoolPicker(List<bool> bools, String aHint,
      bool Function() getter, void Function(bool) setter) {
    List<DropdownMenuItem<bool>> menuItems = [];
    bools.forEach(
      (bool a) {
        menuItems.add(
          DropdownMenuItem(
            child: Text(a.toString(), style: kNewHandFormFont),
            value: a,
          ),
        );
      },
    );
    return NewHandFormRow<bool>(
      aHint: aHint,
      getter: getter,
      setter: setter,
      menuItems: menuItems,
    );
  }
}
