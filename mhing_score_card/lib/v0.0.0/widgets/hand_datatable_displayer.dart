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
      ///the following code is the logic to the data in a Hand object to
      ///usable format for the DataTable widget

      ///first a column is created with a label telling the user the order
      ///the hands were entered
      List<DataColumn> columns = [DataColumn(label: Text('Hand Number'))];
      for (int i = 0; i < handList.hands.length; i++) {
        columns.add(DataColumn(label: Text('${i + 1}')));
      }

      ///tempArray holds the raw data extracted from the Hand obj.
      ///this first for loop kept me from having to staticly declare a
      ///array of 18 empty arrays
      List<List<dynamic>> tempArray = [];
      for (int i = 0; i < handList.hands[0].contents.length; i++) {
        tempArray.add([]);
      }

      ///this pair of loops populates the inner arrays with the contents of
      ///each hand, now sorted by what the rules call a 'scoring element'(i.e.
      ///tempArray[0] holds a List<bool> that represents the 'sequence only
      ///hand' section for all hands that have been entered)
      for (int i = 0; i < handList.hands.length; i++) {
        for (int j = 0; j < handList.hands[i].contents.length; j++) {
          tempArray[j].add(handList.hands[i].contents[j]);
        }
      }

      ///this print statement was used to prove to myself that the contents
      ///of the hands had been converted in a way that I wanted them to be
      // print('tempArray: $tempArray');
      ///this pair of for loops convert the dynamic elements above into
      ///DataCell widgets that can be used in the DataTable widget
      ///I have not found a way to grow the list of DataCells held onto by a
      ///DataRow w/o making a new provider for them. I may do that in the future
      ///TODO: look into what is mentioned above
      List<List<DataCell>> tempCells = [];
      for (int i = 0; i < tempArray.length; i++) {
        tempCells.add([DataCell(Text(sCatagory[i]))]);
        for (int j = 0; j < tempArray[i].length; j++) {
          tempCells[i].add(DataCell(Hand.toDisplay(tempArray[i][j])));
        }
      }

      ///this loop constructs the final 'rows' obj to be passed to the
      ///DataTable Widget
      List<DataRow> rows = [];
      print(tempArray);
      for (var x in tempCells) {
        rows.add(DataRow(cells: x));
      }

      ///this print statement was used to prove to myself that the contents
      ///of the 'rows' object was what I was expecting.
      print('\ntempCells: $tempCells');

      ///I separated this into a custom widget in the hopes that when the
      ///contents of 'rows' that is being passed changed the DataTable within
      ///would be redrawn, but that was for nowt and I have not removed it yet.
      return MyDataTable(
        columns: columns,
        rows: rows,
      );
    }); //Consumer
  }
}
