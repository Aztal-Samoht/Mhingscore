import 'package:flutter/material.dart';
import 'package:mhing_score_card/v0/res/strings.dart';

List<DataCell> creditValues = [
  const DataCell(Text('1')),
  const DataCell(Text('1')),
  const DataCell(Text('1')),
  const DataCell(Text('1')),
  const DataCell(Text('1')),
  const DataCell(Text('1')),
  const DataCell(Text('1')),
  const DataCell(Text('1')),
  const DataCell(Text('3')),
  const DataCell(Text('3')),
  const DataCell(Text('3')),
  const DataCell(Text('3')),
  const DataCell(Text('3')),
  const DataCell(Text('5')),
  const DataCell(Text('5')),
  const DataCell(Text('5')),
  const DataCell(Text('8')),
  const DataCell(Text('8')),
  const DataCell(Text('8')),
];
//TODO: switch to emojis for the tiles
List<DataCell> handDescriptions = [
  const DataCell(Text(
      '1, 2 & 3 of Bamboo; 5, 6 & 7 of Dots; 2, 3 & 4 of Dots; 6, 7 & 8 of Characters; 6 & 6 of Characters.')),
  const DataCell(Text('4, 5 & 6 of Dots; 4, 5 & 6 of Characters.')),
  const DataCell(Text('3, 3 & 3 of Bamboo; 3, 3 & 3 of Characters.')),
  const DataCell(Text('West Wind, West Wind, West Wind.')),
  const DataCell(Text('1, 2 & 3 of Dots; 7, 8 & 9 of Dots.')),
  const DataCell(Text(
      '2, 3 & 4 of Bamboo; 5, 6 & 7 of Bamboo; 1, 1 & 1 of Characters; 4, 5 & 6 of Characters; 4 & 4 of Characters.')),
  const DataCell(Text('2 & 2 of Dots.')),
  const DataCell(Text('Sum of flowers.')),
  const DataCell(Text(
      '1, 1 & 1 of Bamboo; 5, 5 & 5 of Dots; West Wind, West Wind, West Wind, 8, 8 & 8 of Bamboo; 6 & 6 of Characters.')),
  const DataCell(Text('4, 5 & 6 of Dots; 4, 5 & 6 of Dots.')),
  const DataCell(
      Text('1, 2 & 3 of Bamboo; 4, 5 & 6 of Bamboo; 7, 8 & 9 of Bamboo.')),
  const DataCell(Text(
      '1, 2 & 3 of Dots; 4, 4 & 4 of Dots; 6, 7 & 8 of Dots; West Wind, West Wind, West Wind, 9 & 9 of Dots.')),
  const DataCell(Text(
      'West Wind, North Wind, East Wind, 1, 5 & 8 of Bamboo; 2, 5 & 9 of Dots; 369 of Characters; Green Dragon, Red Dragon.')),
  const DataCell(Text('All cards are 1 to 5 XOR 5 to 9.')),
  const DataCell(Text(
      '6, 7 & 8 of Bamboo; 8, 8 & 8 of Characters; 2, 3 & 4 of Dots; North Wind, North Wind, North Wind, Red Dragon, Red Dragon.')),
  const DataCell(Text(
      '1 & 1 of Characters; 9 & 9 of Bamboo; West Wind, West Wind, Red Dragon, Red Dragon, 4 & 4 of Dots; East Wind, East Wind, 5 & 5 of Bamboo.')),
  const DataCell(Text(
      'Red Dragon, Red Dragon, Red Dragon, Green Dragon, Green Dragon, Green Dragon, White Dragon, White Dragon, White Dragon.')),
  const DataCell(Text(
      '1, 2 & 3 of Bamboo; 6, 6 & 6 of Bamboo; 4, 5 & 6 of Bamboo; 8, 8 & 8 of Bamboo; 9 & 9 of Bamboo.')),
  const DataCell(Text(
      'Red Dragon, White Dragon, Green Dragon; North Wind, East Wind, West Wind, South Wind; 1, 5 & 9 of Bamboo; 3 & 6 of Dots; 4 & 7 of Characters.')),
];

class ExampleTable extends StatelessWidget {
  const ExampleTable({Key? key}) : super(key: key);

  final Color oddColor = const Color(0xfffce1D6);

  @override
  Widget build(BuildContext context) {
    List<DataRow> rows = [];
    for (int i = 0; i < creditValues.length; i++) {
      rows.add(
        DataRow(
          color: i % 2 == 0
              ? MaterialStateProperty.all(oddColor)
              : MaterialStateProperty.all(const Color(0x00fce1D6)),
          // oddColor: Color(0x00fce1D6)
          cells: [
            creditValues[i],
            DataCell(Text(sCatagory[i])),
            handDescriptions[i],
          ],
        ),
      );
    }

    return Column(
      children: [
        const Text('\nScoring Element Descriptons',
            style: TextStyle(fontSize: 20)),
        const Divider(
          color: Colors.black,
          thickness: 2,
        ),
        DataTable(
          columnSpacing: 5,
          border: const TableBorder(
            horizontalInside: BorderSide(color: Colors.black),
            verticalInside: BorderSide(color: Colors.black),
          ),
          columns: const [
            DataColumn(
              label: Text('Credits'),
            ),
            DataColumn(label: Text('Scoring \nElement')),
            DataColumn(label: Text('example'))
          ],
          rows: rows,
        ),
      ],
    );
  }
}
