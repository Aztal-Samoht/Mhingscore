import 'package:flutter/material.dart';
import 'package:mhing_score_card/providers/game_provider.dart';
import 'package:mhing_score_card/res/hands.dart';
import 'package:mhing_score_card/res/strings.dart';
import 'package:mhing_score_card/widgets/example_hand/hand_galary.dart';
import 'package:provider/provider.dart';

class HandExample extends StatelessWidget {
  static String id = 'handExample';
  const HandExample({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(builder: (context, gp, child) {
      List<String> cards = kHandExamples[gp.currentExample];
      return AlertDialog(
        title: Text(sCatagory[gp.currentExample]),
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
