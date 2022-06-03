import 'package:flutter/material.dart';
import 'package:mhing_score_card/lab/lab01/dataProvider.dart';
import 'package:provider/provider.dart';

class TempProvider with ChangeNotifier {
  List<int> _contents = [0, 0, 0, 0, 0, 0];

  void setAt(int value, int index) {
    _contents[index] = value;
  }

  void submit(BuildContext context) {
    context.read<DataProvider>().absorb(_contents);
    for (int i = 0; i < _contents.length; i++) {
      _contents[i] = 0;
    }
  }
}
