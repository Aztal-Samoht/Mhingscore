import 'package:mhing_score_card/v0/models/hand.dart';
import 'package:mhing_score_card/v0/providers/hand_list_provider.dart';
import 'package:mhing_score_card/v0/providers/hand_v2_list_provider.dart';
import 'package:mhing_score_card/v0/res/strings.dart';
import 'package:mhing_score_card/v0/widgets/my_data_table.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class Hand2ListToDataTableDisplayer extends StatelessWidget {
  const Hand2ListToDataTableDisplayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Hand2ListProvider>(
      builder: (context, handList, child) {
        List<DataRow> rows = [];
        handList.sortedHands.forEach((element) {
          rows.add(DataRow(cells: element));
        });
        return DataTable(
            columns: [DataColumn(label: Text('catagory'))], rows: rows);
      },
    ); //Consumer
  }
}
