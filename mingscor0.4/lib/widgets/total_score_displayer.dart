import 'package:flutter/material.dart';
import 'package:mhing_score_card/providers/game_provider.dart';
import 'package:provider/provider.dart';

class TotalScoreDisplayer extends StatelessWidget {
  const TotalScoreDisplayer(this.playerName, {Key? key}) : super(key: key);

  final String playerName;

  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(builder: (context, gp, child) {
      return Text(
        'Total Score: ${gp.players[playerName]?.totalScore}',
        style: const TextStyle(
            fontSize: 20, color: Colors.red, fontWeight: FontWeight.w600),
      );
    });
  }
}
