import 'package:flutter/material.dart';
import 'package:mhing_score_card/v0/providers/hand_list_provider.dart';
import 'package:mhing_score_card/v0/res/hands.dart';
import 'package:mhing_score_card/v0/res/strings.dart';
import 'package:mhing_score_card/v0/widgets/example_hand/hand_galary.dart';
import 'package:provider/provider.dart';

class HandExample extends StatelessWidget {
  static String id = 'handExample';
  HandExample({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<HandListProvider>(builder: (context, HL, child) {
      List<String> cards = kHandExamples[HL.currentExample];
      return AlertDialog(
        title: Text(sCatagory[HL.currentExample]),
        content: HandGalary(
            cards[0],
            cards[1],
            cards[2],
            cards[3],
            cards[4],
            cards[5],
            cards[6],
            cards[7],
            cards[8],
            cards[9],
            cards[10],
            cards[11],
            cards[12],
            cards[13],
            75),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('close')),
        ],
      );
    });
  }
}
