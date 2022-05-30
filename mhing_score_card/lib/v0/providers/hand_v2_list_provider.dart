import 'package:flutter/material.dart';
import 'package:mhing_score_card/v0/models/handV2.dart';
import 'package:mhing_score_card/v0/res/strings.dart';

class Hand2ListProvider with ChangeNotifier {
  List<List<DataCell>> _sortedHands = buildInitialSortedHand();
  num _totalScore = 0;

  num get totalScore => _totalScore;
  List<List<DataCell>> get sortedHands => _sortedHands;

  static List<List<DataCell>> buildInitialSortedHand() {
    List<List<DataCell>> toReturn = [];
    for (int i = 0; i < sCatagory.length; i++) {
      toReturn.add([DataCell(Text(sCatagory[i]))]);
    }
    return toReturn;
  }

  void add(Hand2 h) {
    _totalScore += h.contents[19];
    for (int i = 0; i < h.contents.length; i++) {
      _sortedHands.add([DataCell(Hand2.toDisplayWidget(h.contents[i]))]);
    }
  }

  void reset() {
    _sortedHands = buildInitialSortedHand();
  }
}
