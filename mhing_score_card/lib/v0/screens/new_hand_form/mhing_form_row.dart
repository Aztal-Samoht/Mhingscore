import 'package:flutter/material.dart';
import 'package:mhing_score_card/v0/providers/temp_hand_provider.dart';
import 'package:mhing_score_card/v0/res/constants.dart';
import 'package:mhing_score_card/v0/res/strings.dart';
import 'package:provider/provider.dart';

class MhingFormRow<T> extends StatefulWidget {
  const MhingFormRow({Key? key, required this.index, required this.options})
      : super(key: key);

  final List<T> options;
  final int index;
  @override
  State<MhingFormRow<T>> createState() => _MhingFormRowState();
}

class _MhingFormRowState<T> extends State<MhingFormRow<T>> {
  @override
  Widget build(BuildContext context) {
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
    return Consumer<TempHandProvider>(builder: (context, newHand, child) {
      return Row(
        children: [
          Text(
            '${sCatagory[widget.index]}: ',
            style: kNewHandFormFont,
          ),
          Expanded(
            child: DropdownButton<T>(
              value: newHand.tempContents[widget.index],
              items: menuItems,
              onChanged: (value) {
                setState(() {
                  newHand.setAt(value, widget.index);
                });
              },
            ),
          ),
        ],
      );
    });
  }
}
