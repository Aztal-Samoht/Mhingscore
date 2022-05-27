import 'package:mhing_score_card/v0.0.0/models/hand.dart';
import 'package:mhing_score_card/v0.0.0/providers/hand_list_provider.dart';
import 'package:mhing_score_card/v0.0.0/res/strings.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class HandListToDataTableDisplayer extends StatelessWidget {
  const HandListToDataTableDisplayer({Key? key}) : super(key: key);

  static const List<String> someStrings = ['row1', 'row2'];
  static const List<String> otherStrings = ['column1', 'column2'];
  static const List<List<dynamic>> moreStrings = [
    ['cell1', 'cell2'],
    ['cell3', 'cell4'],
    ['cell5', 'cell6']
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<HandListProvider>(builder: (context, handList, child) {
      List<DataColumn> columns = [DataColumn(label: Text('element'))];
      int handNum = 0;
      for (var element in handList.hands) {
        handNum++;
        columns.add(DataColumn(label: Text('$handNum')));
      }
      List<List<dynamic>> tempArray = [];
      for (dynamic x in handList.hands[0].contents) {
        tempArray.add([]);
      }
      for (int i = 0; i < handList.hands.length; i++) {
        for (int j = 0; j < handList.hands[i].contents.length; j++) {
          tempArray[j].add(handList.hands[i].contents[j]);
        }
      }

      print('tempArray: $tempArray');
      List<List<DataCell>> tempCells = [];
      for (int i = 0; i < tempArray.length; i++) {
        tempCells.add([DataCell(Text(sCatagory[i]))]);
        for (int j = 0; j < tempArray[i].length; j++) {
          tempCells[i].add(DataCell(Hand.toDisplay(tempArray[i][j])));
        }
      }

      List<DataRow> rows = [];
      print(tempArray);
      for (var x in tempCells) {
        rows.add(DataRow(cells: x));
      }
      print('\ntempCells: $tempCells');

      // print('number of cells in row1: ${rows[0].cells.length}');
      // print('number of cells in row2: ${rows[1].cells.length}');
      return Column(
        children: [
          DataTable(
            columns: columns, //[DataColumn(label: Text('element'))],
            rows: rows, //[DataRow(cells: [DataCell(Text('Test'))])],
          ),
        ],
      );
    }); //Consumer
  }
}
