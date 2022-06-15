import 'package:flutter/material.dart';
import 'package:mhing_score_card/providers/game_provider.dart';
import 'package:mhing_score_card/res/constants.dart';
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
        print("created 'columns' obj");
        List<DataRow> rows = gp.getRows(context);

        ///populate the columns
        for (int i = 1; i < gp.getColumnCount(); i++) {
          print('adding column for hand number $i');
          print(
              '(gp.players[playerName]?.currentPageNumber)!: ${(gp.players[playerName]?.currentPageNumber)!}');
          columns.add(
            DataColumn(
              label: Text(
                  '${i + gp.handsPerPage * (gp.players[playerName]?.currentPageNumber)!}',
                  style: kCellStyle),
            ),
          );
        }

        return SingleChildScrollView(
          child: Column(
            children: [
              // Text((gp.players[playerName]?.name)!),
              // Text((gp.players[playerName]?.currentPageNumber)!.toString()),
              // Text(
              //     'number of hands $playerName has scored: ${gp.players[playerName]?.hands.length}'),
              // Text('number of rows: ${rows.length}'),
              // Text('number of cells in rows[0]: ${rows[0].cells.length}'),
              // Text('number of columns: ${columns.length}'),
              // Text(playerName!),
              Padding(
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
                      inside: BorderSide(color: Colors.black38)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
