import 'package:mhing_score_card/v0.0.0/models/hand.dart';
import 'package:mhing_score_card/v0.0.0/providers/hand_list_provider.dart';
import 'package:mhing_score_card/v0.0.0/res/strings.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class HandDatatableDisplayer extends StatelessWidget {
  const HandDatatableDisplayer({Key? key}) : super(key: key);

  static const List<String> someStrings = ['row1', 'row2'];
  static const List<String> otherStrings = ['column1', 'column2'];
  static const List<List<String>> moreStrings = [
    ['cell1', 'cell2'],
    ['cell3', 'cell4']
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<HandListProvider>(builder: (context, handList, child) {
      List<DataColumn> columns = [];
      otherStrings.forEach((element) {
        columns.add(DataColumn(label: Text(element)));
      });
      List<DataRow> rows = [];
      moreStrings.forEach((rowOfCells) {
        List<DataCell> thisRow = [];
        rowOfCells.forEach((element) {
          thisRow.add(DataCell(Text(element)));
        });
        rows.add(DataRow(cells: thisRow));
      });
      print('number of columns: ${columns.length}');
      print('number of cells in row1: ${rows[0].cells.length}');
      print('number of cells in row2: ${rows[1].cells.length}');
      // someStrings.forEach((element) {
      //   rows.add(DataRow(cells: [
      //     DataCell(Text(moreStrings[0])),
      //     DataCell(Text(moreStrings[1])),
      //   ]));
      // });
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
