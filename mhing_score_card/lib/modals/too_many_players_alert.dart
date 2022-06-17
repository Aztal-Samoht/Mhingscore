import 'package:flutter/material.dart';
import 'package:mhing_score_card/modals/new_game_modal.dart';
import 'package:mhing_score_card/models/player.dart';
import 'package:mhing_score_card/providers/game_provider.dart';
import 'package:provider/provider.dart';

class TooManyPlayersAlert extends StatelessWidget {
  const TooManyPlayersAlert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(builder: (context, gp, child) {
      return AlertDialog(
        title: Text('Too Many Players'),
        content: Text(
            "Mhing is intended to be played by 2 to 6 players. Select 'Continue' below to add the 7th player, or 'Start Game' to play with 6 players"),
        actions: [
          TextButton(
            onPressed: () {
              gp.addPlayer(Player(gp.playerName));
              Navigator.pop(context);
              Navigator.pop(context);
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => NewGameModal(),
              );
            },
            child: Text('Continue'),
          ),
          StartGameBtn(),
        ],
      );
    });
  }
}
