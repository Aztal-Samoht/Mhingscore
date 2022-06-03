import 'package:flutter/material.dart';
import 'package:mhing_score_card/v0/models/hand.dart';
import 'package:mhing_score_card/v0/res/constants.dart';
import 'package:mhing_score_card/v0/res/strings.dart';

class HandListProvider with ChangeNotifier {
  ///memebers
  List<List<List<DataCell>>> _pagedHands = _addFirstPage();
  num _totalScore = 0;
  int _currentPage = 0;

  ///getters
  List<List<List<DataCell>>> get pagedHands => _pagedHands;
  num get totalScore => _totalScore;
  int get currentPage => _currentPage;

  ///setters

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
      toReturn.last.add([DataCell(Text(sCatagory[i], style: kCellStyle))]);
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
    if (_pagedHands.last[0].length > 3) {
      _addPage();
    }
    _totalScore += h.contents.last;
    for (int i = 0; i < h.contents.length; i++) {
      _pagedHands.last[i].add(DataCell(Hand.toDisplayWidget(h.contents[i])));
    }
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

  /// depricated
  // List<List<DataCell>> _sortedHands = buildInitialSortedHand();

  // List<List<DataCell>> get sortedHands => _sortedHands;

  // static List<List<DataCell>> buildInitialSortedHand() {
  //   List<List<DataCell>> toReturn = [];
  //   for (int i = 0; i < sCatagory.length; i++) {
  //     toReturn.add([DataCell(Text(sCatagory[i], style: kCellStyle))]);
  //   }
  //   return toReturn;
  // }

  // void add(Hand h) {
  //   _totalScore += h.contents.last;
  //   for (int i = 0; i < h.contents.length; i++) {
  //     _sortedHands[i].add(DataCell(Hand.toDisplayWidget(h.contents[i])));
  //   }
  //   notifyListeners();
  //   //TODO:DELETE THIS PRINT STATEMENT BEFORE PUBLICATON
  //   print('printed from the add function:\n$_sortedHands');
  // }

}
