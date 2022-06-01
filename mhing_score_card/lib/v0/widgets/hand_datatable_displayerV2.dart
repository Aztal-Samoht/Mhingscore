import 'package:mhing_score_card/v0/providers/hand_v2_list_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class Hand2ListToDataTableDisplayer extends StatelessWidget {
  const Hand2ListToDataTableDisplayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Hand2ListProvider>(
      builder: (context, handList, child) {
        List<DataColumn> columns = [DataColumn(label: Text('Hand Number'))];
        //TODO:DELETE THIS PRINT STATEMENT BEFORE PUBLICATON
        print('contents of columns before for loop: $columns');
        for (int i = 1; i < handList.sortedHands[0].length; i++) {
          columns.add(DataColumn(label: Text(i.toString())));
          //TODO:DELETE THIS PRINT STATEMENT BEFORE PUBLICATON
          print('contents of columns after step $i: $columns');
        }

        List<DataRow> rows = [];
        handList.sortedHands.forEach((element) {
          rows.add(DataRow(cells: element));
        });
        //TODO:DELETE THIS PRINT STATEMENT BEFORE PUBLICATON
        print(
            'contents of rows[0].cells just before return statement: ${rows[0].cells}');

        return DataTable(columns: columns, rows: rows, columnSpacing: 5);
      },
    ); //Consumer
  }
}
