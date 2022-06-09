import 'package:flutter/material.dart';

main() {
  runApp(
    MaterialApp(
      // theme: getMytheme(context),
      title: 'Mhingscore Card!',
      initialRoute: HandExample.id,
      routes: {
        HandExample.id: (context) => HandExample(),
        // DataTableScreenN.id: (context) => DataTableScreenN(),
        // DataTableScreenI.id: (context) => DataTableScreenI(),
        // DataTableDisplayer.id: (context) => DataTableDisplayer(),
        // DataTableScreen1.id: (context) => HomeDataTableScreen1(),
        // DataTableScreen2.id: (context) => HomeDataTableScreen2(),
      },
    ),
  );
}

class HandExample extends StatelessWidget {
  static const String id = 'handExample';
  const HandExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('hand example'),
      content: HandGalary('bam1', 'bam2', 'bam3', 'bam4', 'bam5', 'bam6',
          'bam7', 'bam8', 'bam9', 'bam1', 'bam1', 'bam1', 'bam1', 'bam1', 75),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('close')),
      ],
    );
  }
}

class HandSet extends StatelessWidget {
  const HandSet(String? this.card1, String? this.card2, String? this.card3,
      double? this.size,
      {Key? key})
      : super(key: key);

  final String? card1;
  final String? card2;
  final String? card3;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset('assets/cards/$card1.png', height: size),
        Image.asset('assets/cards/$card2.png', height: size),
        Image.asset('assets/cards/$card3.png', height: size),
      ],
    );
  }
}

class HandPair extends StatelessWidget {
  const HandPair(String? this.card1, String? this.card2, double? this.size,
      {Key? key})
      : super(key: key);

  final String? card1;
  final String? card2;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset('assets/cards/$card1.png', height: size),
        Image.asset('assets/cards/$card2.png', height: size),
      ],
    );
  }
}

class HandGalary extends StatelessWidget {
  const HandGalary(
      String this.card1,
      String this.card2,
      String this.card3,
      String this.card4,
      String this.card5,
      String this.card6,
      String this.card7,
      String this.card8,
      String this.card9,
      String this.card10,
      String this.card11,
      String this.card12,
      String this.card13,
      String this.card14,
      double this.size,
      {Key? key})
      : super(key: key);
  final String? card1;
  final String? card2;
  final String? card3;
  final String? card4;
  final String? card5;
  final String? card6;
  final String? card7;
  final String? card8;
  final String? card9;
  final String? card10;
  final String? card11;
  final String? card12;
  final String? card13;
  final String? card14;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        HandSet(card1, card2, card3, size),
        HandSet(card4, card5, card6, size),
        HandSet(card7, card8, card9, size),
        HandSet(card10, card11, card12, size),
        HandPair(card13, card14, size)
      ],
    );
  }
}

const List<String> sCatagory = [
  'Sequence Only Hand',
  'Double Sequence',
  'Double Triplet',
  'Honor Triplet',
  'Broken Royal Run',
  'Two Suits Only',
  'Pair of 2s, 5s or 8s',
  'Flowers',
  'Triplets Only Hand',
  'Identical Double Sequence',
  'Royal Run',
  'One Suit w/Honors',
  'Nothing Connects',
  'High/Low',
  'All Suits and Honors',
  'Seven Pairs',
  'All Dragon Triplets',
  'One Suit Only',
  'Nothing Connects w/All Honors',
  'Total Credits',
  'Hand Score'
];
