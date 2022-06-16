import 'package:flutter/material.dart';
import 'package:mhing_score_card/models/player.dart';
import 'package:mhing_score_card/res/constants.dart';
import 'package:mhing_score_card/screens/tabed_scorecard_screen.dart';
import 'package:provider/provider.dart';
import 'package:mhing_score_card/providers/game_provider.dart';

class NewGameModal extends StatefulWidget {
  const NewGameModal({Key? key}) : super(key: key);
  static String id = 'NewGameModal';

  @override
  State<NewGameModal> createState() => _NewGameModalState();
}

class _NewGameModalState extends State<NewGameModal> {
  String playerName = '';

  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(builder: (context, gp, child) {
      List<Widget> enteredPlayers = [
        Expanded(
          child: Form(
            child: TextField(
              autofocus: true,
              onChanged: (value) {
                playerName = value;
              },
            ),
          ),
        ),
        Expanded(
          child: Text(
            'Players for this game:',
            textAlign: TextAlign.start,
            style: kNewGameModalTitleFont,
          ),
        )
      ];
      for (String element in gp.newPlayers.keys) {
        enteredPlayers.add(
          ///TODO: replace this set of textbuttons with a ListView widget
          Expanded(
            child: TextButton(
              child: Text(
                '*$element',
                style: kSubtitleFont,
              ),
              onLongPress: () {
                gp.removePlayer(element);
                Navigator.pop(context);
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => const NewGameModal(),
                );
              },
              onPressed: () {},
            ),
          ),
        );
      }
      return AlertDialog(
        backgroundColor: Colors.red.shade900,
        title: const Text(
          'New Game',
          textAlign: TextAlign.center,
          style: kNewGameModalTitleFont,
        ),
        content: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: enteredPlayers,
          ),
        ),
        actions: [
          TextButton(
            child: const Text(
              'cancel',
              style: kNewGameModalActionFont,
            ),
            onPressed: () {
              gp.clearNewPlayerList();
              Navigator.pop(context);
            },
          ),
          TextButton(
            child: const Text(
              'add player',
              style: kNewGameModalActionFont,
            ),
            onPressed: () {
              context.read<GameProvider>().addPlayer(Player(playerName));
              Navigator.pop(context);
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => const NewGameModal(),
              );
            },
          ),
          TextButton(
            child: const Text(
              'Start Game',
              style: kNewGameModalActionFont,
            ),
            onPressed: () {
              if (gp.newPlayers.isNotEmpty) {
                gp.updatePlayerList();
                Navigator.pop(context);
                Navigator.pushNamed(context, TabedScorecardScreen.id);
              } else {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Too few players!'),
                    content:
                        const Text('please enter at least one player name'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('close'))
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
