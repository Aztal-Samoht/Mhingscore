// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// int currentScreen = 0;
// List<DataColumn> columns = [];
// List<DataRow> rows0 = [
//   DataRow(
//       cells: [DataCell(Text('1')), DataCell(Text('2')), DataCell(Text('3'))]),
//   DataRow(
//       cells: [DataCell(Text('4')), DataCell(Text('5')), DataCell(Text('6'))]),
//   DataRow(
//       cells: [DataCell(Text('7')), DataCell(Text('8')), DataCell(Text('9'))]),
// ];
// List<DataRow> rows1 = [
//   DataRow(
//       cells: [DataCell(Text('a')), DataCell(Text('b')), DataCell(Text('c'))]),
//   DataRow(
//       cells: [DataCell(Text('d')), DataCell(Text('e')), DataCell(Text('f'))]),
//   DataRow(
//       cells: [DataCell(Text('h')), DataCell(Text('i')), DataCell(Text('j'))]),
// ];
// List<DataRow> rows2 = [
//   DataRow(
//       cells: [DataCell(Text('A')), DataCell(Text('B')), DataCell(Text('C'))]),
//   DataRow(
//       cells: [DataCell(Text('D')), DataCell(Text('E')), DataCell(Text('F'))]),
//   DataRow(
//       cells: [DataCell(Text('H')), DataCell(Text('I')), DataCell(Text('J'))]),
// ];
//
// List<DataRow> rows = [
//   DataRow(
//     cells: [
//       DataCell(
//         Container(),
//       ),
//     ],
//   ),
// ];
// main() {
//   runApp(
//     MaterialApp(
//       // theme: getMytheme(context),
//       title: 'Mhingscore Card!',
//       initialRoute: DataTableDisplay.id,
//       routes: {
//         DataTableScreen0.id: (context) => DataTableScreen0(),
//         DataTableDisplay.id: (context) => DataTableDisplay(),
//         // DataTableScreen1.id: (context) => HomeDataTableScreen1(),
//         // DataTableScreen2.id: (context) => HomeDataTableScreen2(),
//       },
//     ),
//   );
// }
//
// class DataTableDisplay extends StatefulWidget {
//   DataTableDisplay({Key? key}) : super(key: key);
//   static const String id = 'DataTableDisplay';
//
//   @override
//   State<DataTableDisplay> createState() => _DataTableDisplayState();
// }
// class _DataTableDisplayState extends State<DataTableDisplay> {
//   void aFunc() {
//     setState(() {});
//   }
//   Widget whatToShow = Center(
//     child: NavBtn(
//       onPressed:aFunc();
//   );
//
//   void loadTable() {
//     whatToShow = DataTableScreen0();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.green,
//         body: whatToShow,
//       ),
//     );
//     ;
//   }
// }
//
// class DataTableScreen0 extends StatelessWidget {
//   const DataTableScreen0({Key? key}) : super(key: key);
//
//   static const String id = 'DataTableScreen0';
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.green,
//         body: Column(
//           children: [
//             Row(
//               children: [
//                 NavBtn(
//                   onPressed: () {},
//                 ),
//                 NavBtn(
//                   onPressed: () {},
//                 ),
//                 NavBtn(
//                   onPressed: () {},
//                 ),
//               ],
//             ),
//             DataTable(columns: [
//               DataColumn(label: Text('c1')),
//               DataColumn(label: Text('c2'))
//             ], rows: [
//               DataRow(cells: [
//                 DataCell(Text('test')),
//                 DataCell(Text('test')),
//               ]),
//             ]),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class NavBtn extends StatelessWidget {
//   const NavBtn({Key? key, required this.onPressed}) : super(key: key);
//   final void Function() onPressed;
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Material(
//         borderRadius: BorderRadius.circular(20),
//         child: MaterialButton(
//           child: Text('test'),
//           elevation: 50,
//           onPressed: onPressed,
//         ),
//       ),
//     );
//   }
// }
