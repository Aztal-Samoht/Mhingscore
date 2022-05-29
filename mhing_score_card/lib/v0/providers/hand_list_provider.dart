import 'package:flutter/material.dart';

import '../models/hand.dart';

Hand hand0 = Hand(false, 0, 0, 0, 0, false, false, 0, false, 0, false, false,
    false, false, false, false, false, false);

class HandListProvider with ChangeNotifier {
  List<Hand> _hands = [hand0];
  bool firstScore = true;
  String _totalScore = '0';

  String get totalScore => _totalScore;
  List<Hand> get hands => _hands;

  void add(Hand a) {
    if (firstScore) {
      _hands[0] = a;
      firstScore = false;
    } else {
      _hands.add(a);
    }
    calcTotalScore();
    notifyListeners();
  }

  void calcTotalScore() {
    num newTotal = 0;
    for (var hand in _hands) newTotal += hand.contents[19];
    _totalScore = newTotal.toString();
    print('total score: $_totalScore');
    notifyListeners();
  }

  String getTotalScore() {
    num toReturn = 0;
    for (var hand in _hands) toReturn += hand.contents[19];
    return toReturn.toString();
  }

  void reset() {
    _hands = [hand0];
    firstScore = true;
    notifyListeners();
  }
}
