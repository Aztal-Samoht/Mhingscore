import 'package:flutter/material.dart';
import 'package:mhing_score_card/v0.0.0/providers/temp_hand_provider.dart';
import 'package:mhing_score_card/v0.0.0/res/constants.dart';
import 'package:mhing_score_card/v0.0.0/res/strings.dart';
import 'package:mhing_score_card/v0.0.0/widgets/add_hand_form_five_cred.dart';
import 'package:mhing_score_card/v0.0.0/widgets/mhing_button.dart';
import 'package:mhing_score_card/v0.0.0/widgets/new_hand_form_row.dart';
import 'package:provider/provider.dart';

class AddHandFormThreeCred extends StatefulWidget {
  const AddHandFormThreeCred({Key? key}) : super(key: key);

  @override
  State<AddHandFormThreeCred> createState() => _AddHandFormThreeCredState();
}

class _AddHandFormThreeCredState extends State<AddHandFormThreeCred> {
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
                  getBoolPicker([true, false], sCatagory[8],
                      newHand.getTripOnly, newHand.setTripOnly),
                  getNumberPicker([0, 1, 2, 3, 4, 6], sCatagory[9],
                      newHand.getIdentDblSeq, newHand.setIdenDblSeq),
                  getBoolPicker([true, false], sCatagory[10], newHand.getRoyRun,
                      newHand.setRoyRun),
                  getBoolPicker([true, false], sCatagory[11],
                      newHand.getOneSuitHon, newHand.setOneSuitHon),
                  getBoolPicker([true, false], sCatagory[12],
                      newHand.getNoConnect, newHand.setNoConnect),
                  Text('Five Credit:', style: kNewHandFormSectonFont),
                  Divider(color: Colors.black, thickness: 2),
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
                          child: AddHandFormFiveCred(),
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
