import 'package:flutter/material.dart';
import 'package:mhing_score_card/models/player.dart';
import 'package:mhing_score_card/res/constants.dart';
import 'package:mhing_score_card/screens/solo_scorecard_screen.dart';
import 'package:mhing_score_card/screens/tabed_scorecard_screen.dart';
import 'package:provider/provider.dart';
import 'package:mhing_score_card/providers/game_provider.dart';

const Text kTitle = Text(
  'New Game',
  textAlign: TextAlign.center,
  style: kNewGameModalTitleFont,
);

class NewGameModal extends StatelessWidget {
  static String id = 'new game modal';

  NewGameModal({Key? key}) : super(key: key);

  List<String> enteredPlayers = [];
  @override
  Widget build(BuildContext context) {
    print('entered NewGameModal.build()');
    return Consumer<GameProvider>(builder: (context, gp, child) {
      Widget thisContent = SizedBox(
        height: 100,
        child: Column(
          children: [
            Form(
              child: TextField(
                autofocus: true,
                onChanged: (value) {
                  gp.playerName = value;
                  print('value: $value');
                  print('gp.playerName: ${gp.playerName}');
                },
              ),
            ),
          ],
        ),
      );

      List<Widget> theseActions = [
        const CloseModalBtn(),
        AddPlayerBtn(),
        const StartGameBtn(),
      ];
      for (String element in gp.newPlayers.keys) {
        enteredPlayers.add(element);
      }
      print('enteredPlayers : ${enteredPlayers}');

      return AlertDialog(
        backgroundColor: Colors.red.shade900,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: kTitle,
        content: thisContent,
        actions: theseActions,
      );
    });
  }
}

class StartGameBtn extends StatelessWidget {
  const StartGameBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(builder: (context, gp, child) {
      return TextButton(
        child: const Text(
          'Start Game',
          style: kNewGameModalActionFont,
        ),
        onPressed: () {
          if (gp.newPlayers.length > 1) {
            gp.updatePlayerList();
            Navigator.pop(context);
            Navigator.pushNamed(context, TabedScorecardScreen.id);
          } else {
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Too few players!'),
                content: const Text(
                    'Proceeding with less than 2 players will result in a opening the solo-scorecard'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('dismiss'),
                  ),
                  TextButton(
                    onPressed: () {
                      gp.singlePlayerMode = true;
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pushNamed(context, SoloScorecardScreen.id);
                    },
                    child: const Text('proceed'),
                  ),
                ],
              ),
            );
          }
        },
      );
    });
  }
}

class AddPlayerBtn extends StatelessWidget {
  const AddPlayerBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(
      builder: (context, gp, child) {
        return TextButton(
          child: const Text(
            'add player',
            style: kNewGameModalActionFont,
          ),
          onPressed: () {
            gp.addPlayer(Player(gp.playerName));
            Navigator.pop(context);
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => NewGameModal(),
            );
          },
        );
      },
    );
  }
}

class CloseModalBtn extends StatelessWidget {
  const CloseModalBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: const Text(
        'cancel',
        style: kNewGameModalActionFont,
      ),
      onPressed: () {
        context.read<GameProvider>().clearNewPlayerList();
        Navigator.pop(context);
      },
    );
  }
}
