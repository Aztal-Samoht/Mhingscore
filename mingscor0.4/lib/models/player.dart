import 'package:flutter/material.dart';
import 'package:mhing_score_card/models/hand.dart';
import 'package:mhing_score_card/providers/game_provider.dart';
import 'package:mhing_score_card/res/strings.dart';
import 'package:mhing_score_card/screens/hand_example.dart';
import 'package:provider/provider.dart';

class Player {
  Player(this._name);

  final String _name;
  List<Hand> _hands = [];
  List<List<DataRow>> _sortedHands = [];
  int _currentPageNumber = 0;
  int _totalScore = 0;

  int get totalScore => _totalScore;
  String get name => _name;
  List<Hand> get hands => _hands;
  int get currentPageNumber => _currentPageNumber;

  set hands(List<Hand> value) {
    _hands = value;
  }

  int getLastPgNum() {
    return _sortedHands.length;
  }

  void sortNewHand(BuildContext context, Hand h) {
    buildInitialPage(context);
    if (_sortedHands.last[0].cells.length > 3) {
      print('entered if-statement of player.sortNewHand()');
      List<DataRow> newPage = [];
      for (int i = 0; i < sCatagory.length; i++) {
        newPage.add(DataRow(
          cells: [
            DataCell(
              Text(
                sCatagory[i],
              ),
            ),
          ],
        ));
      }
      _sortedHands.add(newPage);
      incPage();
    }
    print('after if-statement of player.sortNewHand()');
    for (int i = 0; i < sCatagory.length; i++) {
      _sortedHands.last[i].cells
          .add(DataCell(Hand.toDisplayWidget(h.contents[sCatagory[i]])));
    }
    ;
  }

  void buildInitialPage(BuildContext context) {
    if (_sortedHands.isEmpty) {
      print('entered if statment of Hand.getCurrentPage()');
      List<DataRow> newPage = [];
      for (int i = 0; i < sCatagory.length; i++) {
        newPage.add(DataRow(
          cells: [
            DataCell(
              TextButton(
                onPressed: () {
                  context.read<GameProvider>().currentExample = i;

                  Navigator.pushNamed(context, HandExample.id);
                },
                child: Text(sCatagory[i]),
              ),
            ),
          ],
        ));
      }
      _sortedHands.add(newPage);
    }
  }

  List<DataRow> getCurrentPage(BuildContext context) {
    buildInitialPage(context);
    return _sortedHands[currentPageNumber];
  }

  int getColumnCount() {
    print(
        'within getColumnCount: \n_sortedHands[currentPageNumber]${_sortedHands[currentPageNumber]}');
    _sortedHands[currentPageNumber].forEach((element) {
      print('contents of instance of dataRow: ${element.cells}');
    });
    return _sortedHands[currentPageNumber][0].cells.length;
  }

  void incPage() {
    _currentPageNumber++;
  }

  void decPage() {
    _currentPageNumber--;
  }

  void addHand(BuildContext context, Hand h) {
    print('player.addHand()');
    _hands.add(h);
    sortNewHand(context, h);
    _totalScore += int.parse(h.contents['Hand Score'].toString());
  }

  void removeHand(int index) {
    _hands.removeAt(index);
  }

  @override
  String toString() {
    String handsAsString = '';
    for (int i = 0; i < _hands.length; i++) {
      handsAsString += 'hand $i:\n';
      _hands[i].contents.forEach((key, value) {
        handsAsString += '  $key: $value\n';
      });
    }
    return 'Player{_name: $_name, _currentPage: $_currentPageNumber, hands: $handsAsString}';
  }

  void printState() {
    for (int page = 0; page < _sortedHands.length; page++) {
      for (int row = 0; row < _sortedHands[page].length; row++) {
        for (int cell = 0;
            cell < _sortedHands[page][row].cells.length;
            cell++) {
          print(
            'page: $page|row: $row|cell: $cell| ${_sortedHands[page][row].cells[cell].child}',
          );
        }
      }
    }
  }
}
