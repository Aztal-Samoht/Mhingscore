import 'package:flutter/material.dart';
import 'package:mhing_score_card/modals/add_hand_modal.dart';
import 'package:mhing_score_card/providers/game_provider.dart';
import 'package:mhing_score_card/res/strings.dart';
import 'package:mhing_score_card/widgets/buttons_&_borders/mhing_button.dart';
import 'package:provider/provider.dart';

class ScoreHandBtn extends StatelessWidget {
  const ScoreHandBtn({
    this.playerName,
    Key? key,
  }) : super(key: key);
  final String? playerName;
  @override
  Widget build(BuildContext context) {
    return MhingButton(
      sScoreHandButtonText + (playerName != null ? ' for $playerName' : ''),
      onPressed: () {
        context.read<GameProvider>().activePlayer = playerName ?? '';

        showDialog<String>(
          context: context,
          builder: (context) => AddHandModal(),
        );
      },
      height: 50.0,
      width: double.infinity,
    );
  }
}
