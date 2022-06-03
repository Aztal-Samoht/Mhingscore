import 'package:mhing_score_card/lab/lab01/constants.dart';
import 'package:mhing_score_card/v0/providers/hand_list_provider.dart';
import 'package:mhing_score_card/v0/res/constants.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

//TODO:add hand example modals
class HandListToDataTableDisplayer extends StatelessWidget {
  const HandListToDataTableDisplayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HandListProvider>(
      builder: (context, HL, child) {
        List<DataColumn> columns = [
          const DataColumn(label: Text('Hand Number', style: kCellStyle)),
        ];
        //TODO:DELETE THIS PRINT STATEMENT BEFORE PUBLICATON
        print('contents of columns before for loop: $columns');
        for (int i = 1; i < HL.pagedHands[HL.currentPage][0].length; i++) {
          columns.add(DataColumn(label: Text('$i', style: kCellStyle)));
        }
        List<DataRow> rows = [];
        // for(int i = 0;i < sCatagory.l)
        HL.pagedHands[HL.currentPage].forEach((element) {
          rows.add(DataRow(cells: element));
        });
        for (int i = 0; i < HL.pagedHands[HL.currentPage].length; i++) {
          for (int j = 1; j < HL.pagedHands[HL.currentPage][i].length; j++) {
            rows[i].cells.add(HL.pagedHands[HL.currentPage][i][j]);
          }
        }
        //TODO:DELETE THIS PRINT STATEMENT BEFORE PUBLICATON
        print(
            'contents of rows[0].cells just before return statement: ${rows[0].cells}');
        HL.printState();
        return Padding(
          padding: const EdgeInsets.only(
            left: 8.0,
            right: 8.0,
            top: 8.0,
          ),
          child: DataTable(
            columns: columns,
            rows: rows,
            columnSpacing: 5,
            border: TableBorder.symmetric(
                inside: BorderSide(color: Colors.black38)),
          ),
        );
      },
    ); //Consumer
  }
}
