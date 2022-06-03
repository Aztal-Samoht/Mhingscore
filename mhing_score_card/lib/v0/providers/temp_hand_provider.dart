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
    false,
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
    context.read<HandListProvider>().add(Hand(_tempContents));
    print('tempContents submitted');

    //TODO:DELETE THIS PRINT STATEMENT BEFORE PUBLICATON
    print('_tempContents after getting assigned kEmptyHand:');
    for (int i = 0; i < _tempContents.length; i++) {
      print('_tempContents[$i]: ${_tempContents[i]}');
    }
    ;
    notifyListeners();
    //TODO:DELETE THIS PRINT STATEMENT BEFORE PUBLICATON
  }

  void setAt(dynamic value, int index) {
    _tempContents[index] = value;
    print(_tempContents);
  }

  void toggleAt(int index) {
    _tempContents[index] = !_tempContents[index];
    notifyListeners();
  }
}
