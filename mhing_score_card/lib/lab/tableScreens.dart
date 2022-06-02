import 'package:flutter/material.dart';

int currentScreen = 0;
List<DataColumn> columns = [
  DataColumn(label: Text('label')),
  DataColumn(label: Text('label')),
  DataColumn(label: Text('label')),
];
List<List<DataRow>> rowList = [rows0, rows1, rows2, rows3];
List<DataRow> rows0 = [
  const DataRow(cells: [
    DataCell(Text('1')),
    const DataCell(const Text('2')),
    const DataCell(Text('3'))
  ]),
  const DataRow(
      cells: [DataCell(Text('4')), DataCell(Text('5')), DataCell(Text('6'))]),
  const DataRow(
      cells: [DataCell(Text('7')), DataCell(Text('8')), DataCell(Text('9'))]),
];
List<DataRow> rows1 = [
  const DataRow(
      cells: [DataCell(Text('a')), DataCell(Text('b')), DataCell(Text('c'))]),
  const DataRow(
      cells: [DataCell(Text('d')), DataCell(Text('e')), DataCell(Text('f'))]),
  const DataRow(
      cells: [DataCell(Text('h')), DataCell(Text('i')), DataCell(Text('j'))]),
];
List<DataRow> rows2 = [
  const DataRow(
      cells: [DataCell(Text('A')), DataCell(Text('B')), DataCell(Text('C'))]),
  const DataRow(
      cells: [DataCell(Text('D')), DataCell(Text('E')), DataCell(Text('F'))]),
  const DataRow(cells: [
    DataCell(Text('H')),
    const DataCell(Text('I')),
    const DataCell(Text('J'))
  ])
];
List<DataRow> rows3 = [
  const DataRow(cells: [
    DataCell(Text('I')),
    DataCell(Text('II')),
    DataCell(Text('III'))
  ]),
  const DataRow(
      cells: [DataCell(Text('IV')), DataCell(Text('V')), DataCell(Text('VI'))]),
  const DataRow(cells: [
    DataCell(Text('VII')),
    DataCell(Text('VIII')),
    DataCell(Text('IX'))
  ]),
];
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
//             NavRow(),
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
//             NavRow(),
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
//             NavRow(),
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
