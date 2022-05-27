import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class HandDatatableDisplayer extends StatelessWidget {
  const HandDatatableDisplayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, handList, child) {
      List<DataColumn> columns = [DataColumn(label: Text('Hand Type'))];
      List<DataRow> rows = [];

      return DataTable(columns: columns, rows: rows);
    }); //Consumer
  }
}
