import 'package:flutter/material.dart';
import 'package:mhing_score_card/v0/widgets/example_hand/hand_galary.dart';

class HandExampleLab extends StatelessWidget {
  static const String id = 'handExample';
  const HandExampleLab({Key? key}) : super(key: key);
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
