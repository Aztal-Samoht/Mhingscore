import 'package:flutter/material.dart';

import '../models/hand.dart';

class HandListProvider with ChangeNotifier {
  List<Hand> _hands = [];

  List<Hand> get hands => _hands;
}
