import 'package:mhing_score_card/v0.0.0/models/hand.dart';
import 'package:mhing_score_card/v0.0.0/providers/hand_list_provider.dart';
import 'package:mhing_score_card/v0.0.0/res/strings.dart';
import 'package:mhing_score_card/v0.0.0/widgets/my_data_table.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class HandListToDataTableDisplayer extends StatelessWidget {
  const HandListToDataTableDisplayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HandListProvider>(builder: (context, handList, child) {
      List<DataColumn> columns = [DataColumn(label: Text('Hand Number'))];
      for (int i = 0; i < handList.hands.length; i++) {
        columns.add(DataColumn(label: Text('${i + 1}')));
      }
      List<List<dynamic>> tempArray = [];
      for (int i = 0; i < handList.hands[0].contents.length; i++) {
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

      return MyDataTable(
        columns: columns,
        rows: rows,
      );
    }); //Consumer
  }
}
