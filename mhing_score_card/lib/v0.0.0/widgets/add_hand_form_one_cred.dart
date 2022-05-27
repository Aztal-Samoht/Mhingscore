import 'package:flutter/material.dart';
import 'package:mhing_score_card/v0.0.0/providers/temp_hand_provider.dart';
import 'package:mhing_score_card/v0.0.0/res/constants.dart';
import 'package:mhing_score_card/v0.0.0/res/strings.dart';
import 'package:mhing_score_card/v0.0.0/widgets/add_hand_form_three_cred.dart';
import 'package:mhing_score_card/v0.0.0/widgets/mhing_button.dart';
import 'package:mhing_score_card/v0.0.0/widgets/new_hand_form_row.dart';
import 'package:provider/provider.dart';

class AddHandFormOneCred extends StatefulWidget {
  const AddHandFormOneCred({Key? key}) : super(key: key);

  @override
  State<AddHandFormOneCred> createState() => _AddHandFormOneCredState();
}

class _AddHandFormOneCredState extends State<AddHandFormOneCred> {
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
                  getBoolPicker([true, false], sHand0, newHand.getSeqOnly,
                      newHand.setSeqOnly),
                  getNumberPicker([0, 1, 2, 3], sHand1, newHand.getDblSeq,
                      newHand.setDblSeq),
                  getNumberPicker([0, 1, 2, 3, 4, 5, 6], sHand2,
                      newHand.getDblTrip, newHand.setDblTrip),
                  getNumberPicker([0, 1, 2, 3, 4], sHand3, newHand.getHonTrip,
                      newHand.setHonTrip),
                  getNumberPicker([0, 1, 2], sHand4, newHand.getBrkRoyRun,
                      newHand.setBrkRoyRun),
                  getBoolPicker([true, false], sHand5, newHand.getTwoSuit,
                      newHand.setTwoSuit),
                  getBoolPicker([true, false], sHand6, newHand.getPair258,
                      newHand.setPair258),
                  getNumberPicker([0, 1, 2, 3, 4, 5, 6, 7, 8], sHand7,
                      newHand.getFlowers, newHand.setFlowers),
                  Text('Three Credit:', style: kNewHandFormSectonFont),
                  Divider(color: Colors.black, thickness: 2),
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
                          child: AddHandFormThreeCred(),
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
