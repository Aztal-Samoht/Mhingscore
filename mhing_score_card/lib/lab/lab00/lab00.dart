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

main() {
  runApp(
    MaterialApp(
      // theme: getMytheme(context),
      title: 'Mhingscore Card!',
      initialRoute: DataTableDisplayer.id,
      routes: {
        DataTableScreen0.id: (context) => DataTableScreen0(),
        DataTableScreenN.id: (context) => DataTableScreenN(),
        DataTableScreenI.id: (context) => DataTableScreenI(),
        DataTableDisplayer.id: (context) => DataTableDisplayer(),
        // DataTableScreen1.id: (context) => HomeDataTableScreen1(),
        // DataTableScreen2.id: (context) => HomeDataTableScreen2(),
      },
    ),
  );
}

///Pages
class DataTableDisplayer extends StatelessWidget {
  static const String id = 'DataTableDisplayer';
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
            Text('DataTableScreen0'),
            Text('$currentScreen'),
            Text('${rowList.length - 1}'),
            NavRow(btn0: DummyBtn(text: 'Prev'), btn2: NextPageBtn()),
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

class DataTableScreenI extends StatelessWidget {
  DataTableScreenI({Key? key}) : super(key: key);

  static const String id = 'DataTableScreenI';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green,
        body: Column(
          children: [
            Text('DataTableScreenI'),
            Text('$currentScreen'),
            Text('${rowList.length - 1}'),
            NavRow(btn0: PrevPageBtn(), btn2: NextPageBtn()),
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

class DataTableScreenN extends StatelessWidget {
  DataTableScreenN({Key? key}) : super(key: key);

  static const String id = 'DataTableScreenN';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green,
        body: Column(
          children: [
            Text('DataTableScreenN'),
            Text('$currentScreen'),
            Text('${rowList.length - 1}'),
            NavRow(btn0: PrevPageBtn(), btn2: DummyBtn(text: 'Next')),
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

///Widgets
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
  const NavRow({Key? key, required this.btn0, required this.btn2})
      : super(key: key);
  final Widget btn0;
  final Widget btn2;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        btn0,
        Expanded(
          child: NavBtn(
              text: 'back',
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        btn2,
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
          if (currentScreen == rowList.length - 2) {
            currentScreen++;
            Navigator.pushNamed(context, DataTableScreenN.id);
          } else {
            currentScreen++;
            Navigator.pushNamed(context, DataTableScreenI.id);
          }
        },
      ),
    );
  }
}

class PrevPageBtn extends StatelessWidget {
  const PrevPageBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: NavBtn(
          text: 'Prev',
          onPressed: () {
            Navigator.pop(context);
            if (currentScreen == 1) {
              currentScreen--;
              Navigator.pushNamed(context, DataTableScreen0.id);
            } else {
              currentScreen--;
              Navigator.pushNamed(context, DataTableScreenI.id);
            }
          }),
    );
  }
}

class DummyBtn extends StatelessWidget {
  const DummyBtn({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        borderRadius: BorderRadius.circular(20),
        child: MaterialButton(
          child: Text(
            text,
            style: TextStyle(color: Colors.grey),
          ),
          elevation: 50,
          onPressed: () {},
        ),
      ),
    );
  }
}
