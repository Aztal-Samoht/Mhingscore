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

List<DataRow> rows = [
  DataRow(
    cells: [
      DataCell(
        Container(),
      ),
    ],
  ),
];
main() {
  runApp(
    MaterialApp(
      // theme: getMytheme(context),
      title: 'Mhingscore Card!',
      initialRoute: DataTableDisplayer.id,
      routes: {
        DataTableScreen0.id: (context) => DataTableScreen0(),
        DataTableDisplayer.id: (context) => DataTableDisplayer(),
        // DataTableScreen1.id: (context) => HomeDataTableScreen1(),
        // DataTableScreen2.id: (context) => HomeDataTableScreen2(),
      },
    ),
  );
}

class DataTableDisplayer extends StatefulWidget {
  const DataTableDisplayer({Key? key}) : super(key: key);
  static const String id = 'DataTableDisplay';

  @override
  State<DataTableDisplayer> createState() => _DataTableDisplayerState();
}

class _DataTableDisplayerState extends State<DataTableDisplayer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green,
        body: Center(
          child: NavBtn(
            text: 'show first table',
            onPressed: () {
              Navigator.pushNamed(context, DataTableScreen0.id);
            },
          ),
        ),
      ),
    );
  }
}

class DataTableScreen0 extends StatelessWidget {
  DataTableScreen0({Key? key}) : super(key: key);

  static const String id = 'DataTableScreen0';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green,
        body: Column(
          children: [
            NavRow(),
            Center(
              child: DataTable(
                columns: columns,
                rows: rowList[currentScreen],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavBtn extends StatelessWidget {
  NavBtn({Key? key, required this.onPressed, required this.text})
      : super(key: key);
  final void Function() onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20),
      child: MaterialButton(
        child: Text(text),
        elevation: 50,
        onPressed: onPressed,
      ),
    );
  }
}

class NavRow extends StatelessWidget {
  const NavRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: NavBtn(
              text: 'Prev',
              onPressed: () {
                Navigator.pop(context);
                currentScreen--;
                Navigator.pushNamed(context, DataTableScreen0.id);
              }),
        ),
        Expanded(
          child: NavBtn(
              text: 'back',
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        Expanded(
          child: NextPageBtn(),
        ),
      ],
    );
  }
}

class NextPageBtn extends StatelessWidget {
  const NextPageBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: NavBtn(
          text: 'Next',
          onPressed: () {
            Navigator.pop(context);
if (            currentScreen != rowList.length-1) {
              currentScreen++;
              Navigator.pushNamed(context, DataTableScreen0.id);
            }
else{         Navigator.pushNamed(context, DataTableScreenN.id);
          }),
    );
  }
}
