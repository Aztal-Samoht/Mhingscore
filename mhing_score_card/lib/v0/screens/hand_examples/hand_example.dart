import 'package:flutter/material.dart';
import 'package:mhing_score_card/v0/res/strings.dart';
import 'package:mhing_score_card/v0/widgets/example_hand/hand_galary.dart';

class HandExample extends StatelessWidget {
  static String id = sCatagory[0];
  const HandExample({Key? key, required this.hand}) : super(key: key);
  final List<String> hand;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(sCatagory[0]),
      content: HandGalary(
          hand[0],
          hand[1],
          hand[2],
          hand[3],
          hand[4],
          hand[5],
          hand[6],
          hand[7],
          hand[8],
          hand[9],
          hand[10],
          hand[11],
          hand[12],
          hand[13],
          75),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('close')),
      ],
    );
  }
}
