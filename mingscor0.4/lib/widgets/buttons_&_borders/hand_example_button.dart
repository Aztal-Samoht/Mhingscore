import 'package:flutter/material.dart';
import 'package:mhing_score_card/providers/game_provider.dart';
import 'package:mhing_score_card/res/strings.dart';
import 'package:mhing_score_card/screens/hand_example.dart';
import 'package:provider/provider.dart';

class HandExampleButton extends StatelessWidget {
  const HandExampleButton(this.i, {Key? key}) : super(key: key);

  final int i;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.read<GameProvider>().currentExample = i;

        Navigator.pushNamed(context, HandExample.id);
      },
      child: Text(sCatagory[i]),
    );
  }
}
