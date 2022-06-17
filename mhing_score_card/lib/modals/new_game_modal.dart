import 'package:flutter/material.dart';
import 'package:mhing_score_card/models/player.dart';
import 'package:mhing_score_card/res/constants.dart';
import 'package:mhing_score_card/screens/solo_scorecard_screen.dart';
import 'package:mhing_score_card/screens/tabed_scorecard_screen.dart';
import 'package:provider/provider.dart';
import 'package:mhing_score_card/providers/game_provider.dart';

class NewGameModal extends StatelessWidget {
  static String id = 'new game modal';

  const NewGameModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(builder: (context, gp, child) {
      String playerName = '';
      List<String> enteredPlayers = [];
      for (String element in gp.newPlayers.keys) {
        enteredPlayers.add(element);
      }
      return Padding(
        padding: const EdgeInsets.only(top: 16.0, bottom: 16),
        child: AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: Colors.red.shade900,
          title: const Text(
            'New Game',
            textAlign: TextAlign.center,
            style: kNewGameModalTitleFont,
          ),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Form(
                child: TextField(
                  style: kSubtitleFont,
                  decoration: newPlayerFieldDeco,
                  cursorColor: Color(0xffffa000),
                  autofocus: true,
                  onChanged: (value) {
                    playerName = value;
                  },
                ),
              ),
              Text(
                'Players for this game:',
                textAlign: TextAlign.start,
                style: kNewGameModalTitleFont,
              ),
              SizedBox(
                width: 200,
                height: MediaQuery.of(context).viewInsets.bottom == 0
                    ? (30 * enteredPlayers.length).toDouble()
                    : 90,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return PlayerNameListTile(
                      enteredPlayers[index],
                      () {
                        enteredPlayers.remove(index);
                      },
                    );
                  },
                  itemCount: enteredPlayers.length,
                ),
              ),
            ],
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
                  builder: (BuildContext context) => NewGameModal(),
                );
              },
            ),
            TextButton(
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
                          'Starting a game with less than 2 players will load the solo-scorecard'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('back'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                            gp.singlePlayerMode = true;
                            Navigator.pushNamed(
                                context, SoloScorecardScreen.id);
                          },
                          child: const Text('continue'),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ],
        ),
      );
    });
  }
}

class PlayerNameListTile extends StatelessWidget {
  const PlayerNameListTile(this.name, this.onPressed, {Key? key})
      : super(key: key);
  final String name;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextButton(
        style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size(50, 30),
            maximumSize: Size(50, 30),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            alignment: Alignment.centerLeft),
        child: Text(
          name,
          style: kNewGameModalActionFont,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
