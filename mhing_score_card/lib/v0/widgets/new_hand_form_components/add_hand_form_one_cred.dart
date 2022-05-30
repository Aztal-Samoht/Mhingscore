import 'package:flutter/material.dart';
import 'package:mhing_score_card/v0/providers/temp_hand_provider.dart';
import 'package:mhing_score_card/v0/providers/temp_hand_v2_provider.dart';
import 'package:mhing_score_card/v0/res/constants.dart';
import 'package:mhing_score_card/v0/res/strings.dart';
import 'package:mhing_score_card/v0/widgets/new_hand_form_components/add_hand_form_three_cred.dart';
import 'package:mhing_score_card/v0/widgets/mhing_button.dart';
import 'package:mhing_score_card/v0/widgets/new_hand_form_components/new_hand_form_row.dart';
import 'package:provider/provider.dart';

class AddHandFormOneCred extends StatefulWidget {
  const AddHandFormOneCred({Key? key}) : super(key: key);

  @override
  State<AddHandFormOneCred> createState() => _AddHandFormOneCredState();
}

class _AddHandFormOneCredState extends State<AddHandFormOneCred> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TempHand2Provider>(builder: (context, newHand, child) {
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
                  // getBoolPicker([true, false], sCatagory[0], newHand.getSeqOnly,
                  //     newHand.setSeqOnly),
                  // getNumberPicker([0, 1, 2, 3], sCatagory[1], newHand.getDblSeq,
                  //     newHand.setDblSeq),
                  // getNumberPicker([0, 1, 2, 3, 4, 5, 6], sCatagory[2],
                  //     newHand.getDblTrip, newHand.setDblTrip),
                  // getNumberPicker([0, 1, 2, 3, 4], sCatagory[3],
                  //     newHand.getHonTrip, newHand.setHonTrip),
                  // getNumberPicker([0, 1, 2], sCatagory[4], newHand.getBrkRoyRun,
                  //     newHand.setBrkRoyRun),
                  // getBoolPicker([true, false], sCatagory[5], newHand.getTwoSuit,
                  //     newHand.setTwoSuit),
                  // getBoolPicker([true, false], sCatagory[6], newHand.getPair258,
                  //     newHand.setPair258),
                  // getNumberPicker([0, 1, 2, 3, 4, 5, 6, 7, 8], sCatagory[7],
                  //     newHand.getFlowers, newHand.setFlowers),
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
