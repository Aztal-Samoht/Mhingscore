import 'package:flutter/material.dart';
import 'package:mhing_score_card/models/player.dart';
import 'package:mhing_score_card/res/constants.dart';
import 'package:mhing_score_card/screens/scorecard_screen.dart';
import 'package:provider/provider.dart';
import 'package:mhing_score_card/providers/game_provider.dart';

class NewGameModal extends StatelessWidget {
  NewGameModal({Key? key}) : super(key: key);
  static String id = 'NewGameModal';
  String playerName = '';
  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(builder: (context, GP, child) {
      List<Widget> enteredPlayers = [
        Form(
          child: TextField(
            onChanged: (value) {
              playerName = value;
            },
          ),
        ),
        Text(
          '\n\nPlayers for this game:',
          textAlign: TextAlign.start,
          style: kTitleFont,
        )
      ];
      GP.newPlayers.keys.forEach(
        (element) {
          enteredPlayers.add(
            Text(
              '*$element',
              style: kSubtitleFont,
            ),
          );
        },
      );
      return AlertDialog(
        backgroundColor: Colors.red.shade900,
        title: Text(
          'New Game',
          textAlign: TextAlign.center,
          style: kTitleFont,
        ),
        content: SafeArea(
          child: Column(
            children: enteredPlayers,
          ),
        ),
        actions: [
          TextButton(
            child: Text(
              'cancel',
              style: kTitleFont,
            ),
            onPressed: () {
              GP.clearNewPlayerList();
              Navigator.pop(context);
            },
          ),
          TextButton(
            child: const Text(
              'add player',
              style: kTitleFont,
            ),
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
          TextButton(
            child: Text(
              'Start Game',
              style: kTitleFont,
            ),
            onPressed: () {
              if (GP.newPlayers.isNotEmpty) {
                GP.updatePlayerList();
                Navigator.pop(context);
                Navigator.pushNamed(context, ScorecardScreen.id);
              } else {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: Text('Too few players!'),
                    content: Text('please enter at least one player name'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('close'))
                    ],
                  ),
                );
              }
            },
          ),
        ],
      );
    });
  }
}
