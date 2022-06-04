import 'package:flutter/material.dart';
import 'package:mhing_score_card/v0/providers/temp_hand_provider.dart';
import 'package:mhing_score_card/v0/res/constants.dart';
import 'package:mhing_score_card/v0/res/strings.dart';
import 'package:provider/provider.dart';

List<int> boolOptions = [0, 5, 6, 8, 10, 11, 12, 13, 14, 15, 16, 17, 18];

class MhingFormRow<T> extends StatefulWidget {
  const MhingFormRow({Key? key, required this.index, required this.options})
      : super(key: key);

  final List<T> options;
  final int index;
  @override
  State<MhingFormRow<T>> createState() => _MhingFormRowState();
}

class _MhingFormRowState<T> extends State<MhingFormRow<T>> {
  List<DropdownMenuItem<T>> getItemList() {
    List<DropdownMenuItem<T>> menuItems = [];
    widget.options.forEach(
      (element) {
        menuItems.add(
          DropdownMenuItem(
            child: Text(element.toString(), style: kNewHandFormFont),
            value: element,
          ),
        );
      },
    );
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
      child: DropdownButton<T>(
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
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Text(
              '${sCatagory[widget.index]}: ',
              style: kNewHandFormFont,
            ),
            getPicker(newHand),
          ],
        ),
      );
    });
  }
}
