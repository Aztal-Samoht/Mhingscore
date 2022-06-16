import 'package:flutter/material.dart';
import 'package:mhing_score_card/v0/res/constants.dart';
import 'package:mhing_score_card/v0_4/providers/game_provider.dart';
import 'package:provider/provider.dart';

class DataDisplayer extends StatelessWidget {
  const DataDisplayer(this.playerName, {Key? key}) : super(key: key);
  final String? playerName;

  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(
      builder: (context, gp, child) {
        List<DataColumn> columns = [
          const DataColumn(label: Text('Hand Number', style: kCellStyle))
        ];
        List<DataRow> rows = gp.getRows(context);

        ///populate the columns
        for (int i = 1; i < gp.getColumnCount(); i++) {
          columns.add(
            DataColumn(
              label: Text(
                  '${i + gp.handsPerPage * (gp.players[playerName]?.currentPageNumber)!}',
                  style: kCellStyle),
            ),
          );
        }

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
              top: 8.0,
            ),
            // child: Container(),
            child: DataTable(
              columns: columns,
              rows: rows,
              columnSpacing: 5,
              border: TableBorder.symmetric(
                  inside: const BorderSide(color: Colors.black38)),
            ),
          ),
        );
      },
    );
  }
}
