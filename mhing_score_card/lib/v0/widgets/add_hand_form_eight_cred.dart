import 'package:flutter/material.dart';
import 'package:mhing_score_card/v0/providers/hand_list_provider.dart';
import 'package:mhing_score_card/v0/providers/temp_hand_provider.dart';
import 'package:mhing_score_card/v0/res/constants.dart';
import 'package:mhing_score_card/v0/res/strings.dart';
import 'package:mhing_score_card/v0/widgets/mhing_button.dart';
import 'package:mhing_score_card/v0/widgets/new_hand_form_row.dart';
import 'package:provider/provider.dart';

class AddHandFormEightCred extends StatefulWidget {
  const AddHandFormEightCred({Key? key}) : super(key: key);

  @override
  State<AddHandFormEightCred> createState() => _AddHandFormEightCredState();
}

class _AddHandFormEightCredState extends State<AddHandFormEightCred> {
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
                  Text('Eight Credit:', style: kNewHandFormSectonFont),
                  Divider(color: Colors.black, thickness: 2),
                  getBoolPicker([true, false], sCatagory[15],
                      newHand.getSeqOnly, newHand.setSeqOnly),
                  getBoolPicker([true, false], sCatagory[16],
                      newHand.getSeqOnly, newHand.setSeqOnly),
                  getBoolPicker([true, false], sCatagory[17],
                      newHand.getSeqOnly, newHand.setSeqOnly),
                  MhingButton(
                    height: 50,
                    width: 175,
                    label: sNext,
                    onPressed: () {
                      newHand.submit(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
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
