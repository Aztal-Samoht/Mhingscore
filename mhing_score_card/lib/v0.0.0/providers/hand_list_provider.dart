import 'package:flutter/material.dart';

import '../models/hand.dart';

Hand hand0 = Hand(false, 0, 0, 0, 0, false, false, 0, false, 0, false, false,
    false, false, false, false, false, false);
Hand hand1 = Hand(true, 0, 0, 0, 0, false, false, 0, false, 0, false, false,
    false, false, false, false, false, false);
Hand hand2 = Hand(false, 0, 0, 0, 0, false, false, 8, false, 0, false, false,
    false, false, false, false, false, true);

class HandListProvider with ChangeNotifier {
  List<Hand> _hands = [hand0];
  bool firstScore = true;

  List<Hand> get hands => _hands;

  void add(Hand a) {
    if (firstScore) {
      _hands[0] = a;
      firstScore = false;
    } else {
      _hands.add(a);
    }
  }

  String getTotalScore() {
    num toReturn = 0;
    for (var hand in _hands) toReturn += hand.contents[19];
    return toReturn.toString();
  }
}
