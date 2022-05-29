import 'package:flutter/material.dart';
import 'package:mhing_score_card/v0/providers/temp_hand_provider.dart';
import 'package:mhing_score_card/v0/res/constants.dart';
import 'package:mhing_score_card/v0/res/strings.dart';
import 'package:mhing_score_card/v0/widgets/add_hand_form_eight_cred.dart';
import 'package:mhing_score_card/v0/widgets/mhing_button.dart';
import 'package:mhing_score_card/v0/widgets/new_hand_form_row.dart';
import 'package:provider/provider.dart';

class AddHandFormFiveCred extends StatefulWidget {
  const AddHandFormFiveCred({Key? key}) : super(key: key);

  @override
  State<AddHandFormFiveCred> createState() => _AddHandFormFiveCredState();
}

class _AddHandFormFiveCredState extends State<AddHandFormFiveCred> {
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
                  Text('Three Credit:', style: kNewHandFormSectonFont),
                  Divider(color: Colors.black, thickness: 2),
                  Text('Five Credit:', style: kNewHandFormSectonFont),
                  Divider(color: Colors.black, thickness: 2),
                  getBoolPicker([true, false], sCatagory[13],
                      newHand.getHighLow, newHand.setHighLow),
                  getBoolPicker([true, false], sCatagory[14],
                      newHand.getAllSuitsHon, newHand.setAllSuitsHon),
                  Text('Eight Credit:', style: kNewHandFormSectonFont),
                  Divider(color: Colors.black, thickness: 2),
                  MhingButton(
                    height: 50,
                    width: 175,
                    label: sNext,
                    onPressed: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => SingleChildScrollView(
                          child: AddHandFormEightCred(),
                        ),
                      );
                    },
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
