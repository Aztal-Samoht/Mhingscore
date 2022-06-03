import 'package:flutter/material.dart';
import 'package:mhing_score_card/lab/lab01/constants.dart';

class DataProvider extends ChangeNotifier {
  List<List<List<DataCell>>> _dataPages = [];
  List<List<DataCell>> _data = [];
  int _currentScreen = 0;
  bool _restarted = true;

  List<List<DataCell>> get data => _data;

  int get currentScreen => _currentScreen;

  set currentScreen(int value) {
    _currentScreen = value;
  }

  void incScreen() {
    _currentScreen++;
    notifyListeners();
  }

  void decScreen() {
    _currentScreen--;
    notifyListeners();
  }

  void buildInitialData() {
    if (_restarted) {
      for (int i = 0; i < 6; i++) {
        _data.add([DataCell(Text('${sCatagory[i]}'))]);
      }
      _restarted = false;
    }
    notifyListeners();
  }

  void add() {
    _data.forEach((element) {
      element.add(DataCell(Text(':)')));
    });
    print(_data[0].length);
    int i = 0;
    int j = 0;
    _data.forEach((element) {
      j = 0;
      element.forEach((element) {
        print('i: $i  j: $j ${element.child}');
        j++;
      });
      i++;
    });
    notifyListeners();
  }
}
