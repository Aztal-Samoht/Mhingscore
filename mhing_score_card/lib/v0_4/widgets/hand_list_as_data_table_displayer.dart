import 'package:flutter/material.dart';
import 'package:mhing_score_card/v0/providers/hand_list_provider.dart';
import 'package:mhing_score_card/v0/res/constants.dart';
import 'package:mhing_score_card/v0_4/models/player.dart';
import 'package:provider/provider.dart';

class HandListAsDataTableDisplayer extends StatelessWidget {
  const HandListAsDataTableDisplayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HandListProvider>(
      builder: (context, hl, child) {
        List<DataColumn> columns = [
          const DataColumn(label: Text('Hand Number', style: kCellStyle))
        ];

        for (int i = 1; i < hl.pagedHands[hl.currentPage][0].length; i++) {
          columns.add(DataColumn(
              label: Text('${i + hl.handsPerPage * hl.currentPage}',
                  style: kCellStyle)));
        }

        List<DataRow> rows = Player.constructInitialRows();
        for (int i = 0; i < hl.pagedHands[hl.currentPage].length; i++) {
          for (int j = 1; j < hl.pagedHands[hl.currentPage][i].length; j++) {
            rows[i].cells.add(hl.pagedHands[hl.currentPage][i][j]);
          }
        }
        hl.printState();
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
                inside: const BorderSide(color: Colors.black38)),
          ),
        );
      },
    ); //Consumer
  }
}
