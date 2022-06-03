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
                      DP.checkContents();
                      Navigator.pushNamed(context, DataTableScreenX.id);
                      print('dp.DataPages: ${DP.dataPages}');
                    },
                  ),
                  SizedBox(height: 20),
                  NavBtn(
                    text: 'add column',
                    onPressed: () {
                      DP.add();
                    },
                  ),
                  SizedBox(height: 20),
                  NavBtn(
                    text: 'build Initial',
                    onPressed: () {
                      DP.checkContents();
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
      for (int i = 1; i < DP.dataPages[DP.currentPage][0].length; i++) {
        columns.add(DataColumn(label: Text('$i')));
      }
      print('number of columns: ${columns.length}');
      List<DataRow> rows = [];
      for (int i = 0; i < 6; i++) {
        rows.add(DataRow(cells: [DataCell(Text(sCatagory[i]))]));
      }
      for (int i = 0; i < DP.dataPages[DP.currentPage].length; i++) {
        for (int j = 1; j < DP.dataPages[DP.currentPage][i].length; j++) {
          rows[i].cells.add(DP.dataPages[DP.currentPage][i][j]);
        }
      }
      print('number of rows: ${rows.length}');
      DP.printState();
      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.green,
          body: Column(
            children: [
              Text('DataTableScreenX'),
              Text('page ${DP.currentPage + 1}/${DP.dataPages.length}'),
              NavRow(),
              DataTable(columns: columns, rows: rows),
              SizedBox(height: 20),
              Text(DP.bottomText()),
            ],
          ),
        ),
      );
    });
  }
}
