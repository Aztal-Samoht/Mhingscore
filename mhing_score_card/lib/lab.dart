//TODO: add iOS functionality
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: SafeArea(
          child: DataTableTest(),
        ),
      ),
    ),
  );
}

class DataTableTest extends StatelessWidget {
  const DataTableTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(columns: [
      DataColumn(label: Text('c1')),
      DataColumn(label: Text('c1'))
    ], rows: [
      DataRow(
        cells: [
          DataCell(Text('test')),
          DataCell(Text('test')),
          DataCell(Text('test')),
        ],
      )
    ]);
  }
}
