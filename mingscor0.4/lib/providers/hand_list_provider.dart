import 'package:flutter/material.dart';
import 'package:mhing_score_card/models/hand.dart';
import 'package:mhing_score_card/res/constants.dart';
import 'package:mhing_score_card/res/strings.dart';

class HandListProvider with ChangeNotifier {
  ///memebers
  int currentExample = 0;
  List<List<List<DataCell>>> _pagedHands = _addFirstPage();
  num _totalScore = 0;
  int _currentPage = 0;
  int _handsPerPage = 3;

  ///getters
  List<List<List<DataCell>>> get pagedHands => _pagedHands;
  num get totalScore => _totalScore;
  int get currentPage => _currentPage;
  int get handsPerPage => _handsPerPage;

  ///setters
  set handsPerPage(int value) {
    _handsPerPage = value;
    notifyListeners();
  }

  ///functions
  void incScreen() {
    _currentPage++;
    notifyListeners();
  }

  void decScreen() {
    _currentPage--;
    notifyListeners();
  }

  static List<List<List<DataCell>>> _addFirstPage() {
    List<List<List<DataCell>>> toReturn = [[]];
    for (int i = 0; i < sCatagory.length; i++) {
      toReturn.last.add([DataCell(Text(sCatagory[i]))]);
    }
    return toReturn;
  }

  void _addPage() {
    _pagedHands.add([]);
    _fillFirstColumn();
  }

  void _fillFirstColumn() {
    for (int i = 0; i < sCatagory.length; i++) {
      _pagedHands.last.add([DataCell(Text(sCatagory[i], style: kCellStyle))]);
    }
  }

  void ingest(Hand h) {
    print('pagedHands content before injestion:');
    printState();
    if (_pagedHands.last.last.length > _handsPerPage) {
      _addPage();
    }
    _totalScore += h.contents[sCatagory[20]];
    for (int i = 0; i < h.contents.length; i++) {
      _pagedHands.last[i].add(DataCell(Hand.toDisplayWidget(h.contents[i])));
    }
    print('pagedHands content after injestion:');
    printState();
    notifyListeners();
  }

  void reset() {
    _pagedHands = _addFirstPage();
    _totalScore = 0;
  }

  void printState() {
    for (int page = 0; page < _pagedHands.length; page++) {
      for (int row = 0; row < _pagedHands[page].length; row++) {
        for (int cell = 0; cell < _pagedHands[page][row].length; cell++) {
          print(
            'page: $page|row: $row|cell: $cell| ${_pagedHands[page][row][cell].child}',
          );
        }
      }
    }
  }
}
