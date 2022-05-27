import 'package:mhing_score_card/v0.0.0/providers/hand_list_provider.dart';
import 'package:mhing_score_card/v0.0.0/res/strings.dart';
import 'package:mhing_score_card/v0.0.1/res/strings.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class HandListToDataTableDisplayer extends StatelessWidget {
  const HandListToDataTableDisplayer({Key? key}) : super(key: key);

  static const List<String> someStrings = ['row1', 'row2'];
  static const List<String> otherStrings = ['column1', 'column2'];
  static const List<List<String>> moreStrings = [
    ['cell1', 'cell2'],
    ['cell3', 'cell4']
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
      int index = 0;
      List<DataRow> rows = [];
      for (var rowOfCells in moreStrings) {
        List<DataCell> thisRow = [DataCell(Text(sCatagory[index]))];
        for (var element in rowOfCells) {
          thisRow.add(DataCell(Text(element)));
        }
        rows.add(DataRow(cells: thisRow));
        index++;
      }
      print('size of handList: ${handList.hands.length}');
      print('handList: ${handList.hands}');
      print('number of columns: ${columns.length}');
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
