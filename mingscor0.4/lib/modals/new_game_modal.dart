import 'package:flutter/material.dart';
import 'package:mhing_score_card/models/player.dart';
import 'package:provider/provider.dart';
import 'package:mhing_score_card/providers/game_provider.dart';
import 'package:mhing_score_card/widgets/appearance/mhing_card.dart';

class NewGameModal extends StatelessWidget {
  NewGameModal({Key? key}) : super(key: key);
  static String id = 'NewGameModal';
  String playerName = '';
  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(builder: (context, GP, child) {
      List<Widget> enteredPlayers = [
        Text(
          'Players for this game:',
          textAlign: TextAlign.start,
        )
      ];
      GP.newPlayers.keys.forEach(
        (element) {
          enteredPlayers.add(
            Text('$element'),
          );
        },
      );
      enteredPlayers.add(
        Form(
          child: TextField(
            onChanged: (value) {
              playerName = value;
            },
          ),
        ),
      );
      return AlertDialog(
        backgroundColor: Color(0xffffffff),
        title: Text('alert'),
        content: Column(
          children: enteredPlayers,
        ),
        actions: [
          TextButton(
            child: Text('cancle'),
            onPressed: () {
              GP.clearNewPlayerList();
              Navigator.pop(context);
            },
          ),
          TextButton(
            child: const Text('add player'),
            onPressed: () {
              print('entered name: $playerName');
              context.read<GameProvider>().addPlayer(Player(playerName));
              Navigator.pop(context);
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => NewGameModal(),
              );
            },
          ),
        ],
      );
    });
  }
}
