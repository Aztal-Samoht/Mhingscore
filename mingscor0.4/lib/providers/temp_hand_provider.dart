import 'package:flutter/material.dart';
import 'package:mhing_score_card/models/hand.dart';
import 'package:mhing_score_card/providers/game_provider.dart';
import 'package:mhing_score_card/res/constants.dart';
import 'package:provider/provider.dart';

class TempHandProvider with ChangeNotifier {
  List<dynamic> _tempContents = [
    false,
    0,
    0,
    0,
    0,
    false,
    0,
    0,
    false,
    0,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    0,
    0,
  ];

  List<dynamic> get tempContents => _tempContents;

  void submit(BuildContext context) {
    context.read<GameProvider>().ingestHand(context,Hand(_tempContents));
    // context.read<GameProvider>().printState();
    clearTemp();
    notifyListeners();
  }

  void clearTemp() {
    for (int i = 0; i < _tempContents.length; i++) {
      _tempContents[i] = kEmptyHand[i];
    }
  }

  void setAt(dynamic value, int index) {
    _tempContents[index] = value;
  }

  void toggleAt(int index) {
    _tempContents[index] = !_tempContents[index];
    notifyListeners();
  }
}
