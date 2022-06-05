import 'package:flutter/material.dart';
import 'package:mhing_score_card/v0/models/hand.dart';
import 'package:mhing_score_card/v0/providers/hand_list_provider.dart';
import 'package:mhing_score_card/v0/res/constants.dart';
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
    print('begining submission');
    context.read<HandListProvider>().ingest(Hand(_tempContents));
    print('tempContents submitted');
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
    print('tempContents set to: $_tempContents');
  }

  void toggleAt(int index) {
    _tempContents[index] = !_tempContents[index];
    print('tempContents set to: $_tempContents');
    notifyListeners();
  }
}
