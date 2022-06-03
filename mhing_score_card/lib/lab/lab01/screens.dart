import 'package:flutter/material.dart';
import 'package:mhing_score_card/lab/lab01/constants.dart';
import 'package:mhing_score_card/lab/lab01/dataProvider.dart';
import 'package:mhing_score_card/lab/lab01/widgets.dart';
import 'package:provider/provider.dart';

class LabHomeScreen extends StatelessWidget {
  static const String id = 'DataTableDisplayer';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green,
        body: Consumer<DataProvider>(
          builder: (context, DP, child) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  NavBtn(
                    text: 'go to tables',
                    onPressed: () {
                      DP.buildInitialData();
                      Navigator.pushNamed(context, DataTableScreenX.id);
                      print(DP.data);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  NavBtn(
                    text: 'add column',
                    onPressed: () {
                      DP.add();
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  NavBtn(
                    text: 'build Initial',
                    onPressed: () {
                      DP.buildInitialData();
                    },
                  ),
                  Text('lab01'),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class DataTableScreenX extends StatelessWidget {
  DataTableScreenX({Key? key}) : super(key: key);

  static const String id = 'DataTableScreenX';
  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(builder: (context, DP, child) {
      List<DataColumn> columns = [DataColumn(label: Text('Hand Number'))];
      for (int i = 1; i < DP.data[0].length; i++) {
        columns.add(DataColumn(label: Text('$i')));
      }
      print('number of columns: ${columns.length}');
      List<DataRow> rows = [];
      for (int i = 0; i < 6; i++) {
        rows.add(DataRow(cells: [DataCell(Text(sCatagory[i]))]));
      }
      for (int i = 0; i < DP.data.length; i++) {
        for (int j = 1; j < DP.data[i].length; j++) {
          rows[i].cells.add(DP.data[i][j]);
        }
      }

      print('number of rows: ${rows.length}');
      print('cells in row 0: ${rows[5].cells.length}');
      print('cells in row 1: ${rows[1].cells.length}');
      print('cells in row 2: ${rows[2].cells.length}');
      print('cells in row 3: ${rows[3].cells.length}');
      print('cells in row 4: ${rows[4].cells.length}');
      print('cells in row 5: ${rows[5].cells.length}');
      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.green,
          body: Column(
            children: [
              Text('DataTableScreenX'),
              Text('${DP.currentScreen}'),
              Text('${DP.data[0].length}'),
              NavRow(),
              DataTable(columns: columns, rows: rows)

              // Center(
              //   child: DataTable(
              //     columns: columns,
              //     rows: rowList[currentScreen],
              //   ),
              // ),
            ],
          ),
        ),
      );
    });
  }
}
//
// class DataTableScreen0 extends StatelessWidget {
//   DataTableScreen0({Key? key}) : super(key: key);
//
//   static const String id = 'DataTableScreen0';
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.green,
//         body: Column(
//           children: [
//             Text('DataTableScreen0'),
//             Text('$currentScreen'),
//             Text('${rowList.length}'),
//             NavRow(btn0: DummyBtn(text: 'Prev'), btn2: NextPageBtn()),
//             Center(
//               child: DataTable(
//                 columns: columns,
//                 rows: rowList[currentScreen],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class DataTableScreenI extends StatelessWidget {
//   DataTableScreenI({Key? key}) : super(key: key);
//
//   static const String id = 'DataTableScreenI';
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.green,
//         body: Column(
//           children: [
//             Text('DataTableScreenI'),
//             Text('$currentScreen'),
//             Text('${rowList.length}'),
//             NavRow(btn0: PrevPageBtn(), btn2: NextPageBtn()),
//             Center(
//               child: DataTable(
//                 columns: columns,
//                 rows: rowList[currentScreen],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class DataTableScreenN extends StatelessWidget {
//   DataTableScreenN({Key? key}) : super(key: key);
//
//   static const String id = 'DataTableScreenN';
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.green,
//         body: Column(
//           children: [
//             Text('DataTableScreenN'),
//             Text('$currentScreen'),
//             Text('${rowList.length}'),
//             NavRow(btn0: PrevPageBtn(), btn2: DummyBtn(text: 'Next')),
//             Center(
//               child: DataTable(
//                 columns: columns,
//                 rows: rowList[currentScreen],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
