import 'package:flutter/material.dart';

class MyDataTable extends StatelessWidget {
  const MyDataTable({Key? key, required this.columns, required this.rows})
      : super(key: key);

  final List<DataRow> rows;
  final List<DataColumn> columns;

  @override
  Widget build(BuildContext context) {
    return DataTable(columns: columns, rows: rows, columnSpacing: 5);
  }
}
