import 'package:mhing_score_card/v0/providers/hand_list_provider.dart';
import 'package:mhing_score_card/v0/res/constants.dart';
import 'package:mhing_score_card/v0/res/strings.dart';
import 'package:mhing_score_card/v0/screens/hand_examples/hand_example.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

//TODO:add hand example modals
class HandListAsDataTableDisplayer extends StatelessWidget {
  const HandListAsDataTableDisplayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HandListProvider>(
      builder: (context, HL, child) {
        List<DataColumn> columns = [
          DataColumn(label: Text('Hand Number', style: kCellStyle))
        ];

        for (int i = 1; i < HL.pagedHands[HL.currentPage][0].length; i++) {
          columns.add(DataColumn(
              label: Text('${i + HL.handsPerPage * HL.currentPage}',
                  style: kCellStyle)));
        }

        List<DataRow> rows = [];
        for (int i = 0; i < sCatagory.length; i++) {
          rows.add(DataRow(cells: [
            DataCell(TextButton(
              onPressed: () {
                //TODO: make a provider that tells the program which hand to load and set it here, then
                // make the HandExample consume that provider
                Navigator.pushNamed(context, HandExample.id);
              },
              child: Text(sCatagory[i]),
            ))
          ]));
        }
        for (int i = 0; i < HL.pagedHands[HL.currentPage].length; i++) {
          for (int j = 1; j < HL.pagedHands[HL.currentPage][i].length; j++) {
            print('adding: ${HL.pagedHands[HL.currentPage][i][j]}');
            rows[i].cells.add(HL.pagedHands[HL.currentPage][i][j]);
          }
        }
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
