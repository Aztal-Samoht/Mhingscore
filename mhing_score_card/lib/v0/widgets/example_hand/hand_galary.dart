import 'package:flutter/material.dart';
import 'package:mhing_score_card/v0/widgets/example_hand/hand_pair.dart';
import 'package:mhing_score_card/v0/widgets/example_hand/hand_set.dart';

class HandGalary extends StatelessWidget {
  const HandGalary(
      String this.card1,
      String this.card2,
      String this.card3,
      String this.card4,
      String this.card5,
      String this.card6,
      String this.card7,
      String this.card8,
      String this.card9,
      String this.card10,
      String this.card11,
      String this.card12,
      String this.card13,
      String this.card14,
      double this.size,
      {Key? key})
      : super(key: key);
  final String? card1;
  final String? card2;
  final String? card3;
  final String? card4;
  final String? card5;
  final String? card6;
  final String? card7;
  final String? card8;
  final String? card9;
  final String? card10;
  final String? card11;
  final String? card12;
  final String? card13;
  final String? card14;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        HandSet(card1, card2, card3, size),
        HandSet(card4, card5, card6, size),
        HandSet(card7, card8, card9, size),
        HandSet(card10, card11, card12, size),
        HandPair(card13, card14, size)
      ],
    );
  }
}
