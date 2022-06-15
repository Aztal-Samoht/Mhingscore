import 'package:flutter/material.dart';
import 'package:mhing_score_card/providers/hand_list_provider.dart';
import 'package:mhing_score_card/providers/temp_hand_provider.dart';
import 'package:mhing_score_card/res/constants.dart';
import 'package:mhing_score_card/res/strings.dart';
import 'package:mhing_score_card/screens/hand_example.dart';
import 'package:provider/provider.dart';

List<int> boolOptions = [0, 5, 8, 10, 11, 12, 13, 14, 15, 16, 17, 18];

class MhingFormRow extends StatefulWidget {
  const MhingFormRow({Key? key, required this.index, required this.options})
      : super(key: key);

  final List<int> options;
  final int index;
  @override
  State<MhingFormRow> createState() => _MhingFormRowState();
}

class _MhingFormRowState extends State<MhingFormRow> {
  List<DropdownMenuItem<int>> getItemList() {
    List<DropdownMenuItem<int>> menuItems = [];
    for (int element in widget.options) {
      menuItems.add(
        DropdownMenuItem(
          child: Text(element.toString(), style: kNewHandFormFont),
          value: element,
        ),
      );
    }
    return menuItems;
  }

  Widget getPicker(TempHandProvider tempHand) {
    if (boolOptions.contains(widget.index)) {
      return Checkbox(
        checkColor: Colors.black,
        activeColor: Colors.red,
        value: tempHand.tempContents[widget.index],
        onChanged: (value) {
          tempHand.toggleAt(widget.index);
        },
      );
    }
    return Expanded(
      child: DropdownButton<int>(
        value: tempHand.tempContents[widget.index],
        items: getItemList(),
        onChanged: (value) {
          setState(
            () {
              tempHand.setAt(value, widget.index);
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TempHandProvider>(builder: (context, newHand, child) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            TextButton(
              onPressed: () {
                context.read<HandListProvider>().currentExample = widget.index;

                Navigator.pushNamed(context, HandExample.id);
              },
              child: Text(
                sCatagory[widget.index],
                style: kNewHandFormFont,
              ),
            ),
            getPicker(newHand),
          ],
        ),
      );
    });
  }
}
