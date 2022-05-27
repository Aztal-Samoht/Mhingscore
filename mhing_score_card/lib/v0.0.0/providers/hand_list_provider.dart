import 'package:flutter/material.dart';

import '../models/hand.dart';

Hand hand0 = Hand(false, 0, 0, 0, 0, false, false, 0, false, 0, false, false,
    false, false, false, false, false, false);
Hand hand1 = Hand(true, 0, 0, 0, 0, false, false, 0, false, 0, false, false,
    false, false, false, false, false, false);
Hand hand2 = Hand(true, 0, 0, 0, 0, false, false, 0, false, 0, false, false,
    false, false, false, false, false, false);

class HandListProvider with ChangeNotifier {
  List<Hand> _hands = [hand0, hand1];

  List<Hand> get hands => _hands;

  void add(Hand a) => _hands.add(a);
}
