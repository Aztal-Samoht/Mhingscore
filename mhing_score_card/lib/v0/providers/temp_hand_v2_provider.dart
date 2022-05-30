import 'package:flutter/material.dart';
import 'package:mhing_score_card/v0/models/hand.dart';
import 'package:mhing_score_card/v0/models/handV2.dart';
import 'package:mhing_score_card/v0/providers/hand_list_provider.dart';
import 'package:mhing_score_card/v0/providers/hand_v2_list_provider.dart';
import 'package:provider/provider.dart';

class TempHand2Provider with ChangeNotifier {
  List<dynamic> _tempContents = [];

  List<dynamic> get tempContents => _tempContents;

  void submit(BuildContext context) {
    context.read<Hand2ListProvider>().add(Hand2(_tempContents));
    _tempContents = [];
  }
}
