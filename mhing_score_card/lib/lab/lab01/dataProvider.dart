import 'package:flutter/material.dart';
import 'package:mhing_score_card/lab/lab01/constants.dart';

class DataProvider extends ChangeNotifier {
  ///members
  /*
  * dataPages[
  *   page0 [
  *     row0 [0,0,0, cell, cell],
  *     row1 [0,1,0, cell, cell],
  *     row2 [Cell, cell, 0,2,2],
  *   ],
  *   page1 [
  *     row0 [Cell, cell, cell],
  *     row1 [Cell, cell, cell],
  *     row2 [Cell, cell, cell],
  *   ],
  *   page2 [
  *     row0 [Cell, cell, cell],
  *     row1 [Cell, cell, cell],
  *     row2 [Cell, cell, cell],
  *   ],
  * ]
  */
  List<List<List<DataCell>>> _dataPages = [];
  List<List<DataCell>> _data = [];
  int _currentPage = 0;
  bool _restarted = true;

  ///getters
  List<List<List<DataCell>>> get dataPages => _dataPages;
  List<List<DataCell>> get data => _data;
  int get currentPage => _currentPage;

  ///setters
  set currentPage(int value) {
    _currentPage = value;
  }

  ///other functions
  void incScreen() {
    _currentPage++;
    notifyListeners();
  }

  void decScreen() {
    _currentPage--;
    notifyListeners();
  }

  void checkContents() {
    if (_restarted) {
      buildInitialData();
      _restarted = false;
    }
  }

  void buildInitialData() {
    _dataPages.add([]);
    for (int i = 0; i < 6; i++) {
      _dataPages[_currentPage].add([DataCell(Text('${sCatagory[i]}'))]);
    }
    printState();
    notifyListeners();
  }

  void add() {
    if (_dataPages[_currentPage][0].length == 4) {
      _currentPage++;
      buildInitialData();
    }

    _dataPages[_currentPage].forEach((element) {
      element.add(DataCell(Text(':)')));
    });

    printState();
    notifyListeners();
  }

  void printState() {
    for (int page = 0; page < _dataPages.length; page++) {
      for (int row = 0; row < _dataPages[page].length; row++) {
        for (int cell = 0; cell < _dataPages[page][row].length; cell++) {
          print(
              'page: $page|row: $row|cell: $cell| ${_dataPages[page][row][cell].child}');
        }
      }
    }
  }

  String bottomText() {
    String toReturn = '';
    for (int page = 0; page < _dataPages.length; page++) {
      for (int cell = 1; cell < _dataPages[page].last.length; cell++) {
        toReturn += '${_dataPages[page].last[cell].child}, ';
      }
    }
    return toReturn;
  }
}
