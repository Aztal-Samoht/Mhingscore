import 'package:flutter/material.dart';
import 'package:mhing_score_card/models/player.dart';
import 'package:mhing_score_card/providers/ad_provider.dart';
import 'package:mhing_score_card/providers/hand_list_provider.dart';
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
  @override
  Widget build(BuildContext context) {
    print('entered NewGameModal.build()');
    return Consumer<GameProvider>(builder: (context, gp, child) {
      return AlertDialog(
        backgroundColor: Colors.red.shade900,
        title: kTitle,
        content: ContentWidget(),
        actions: [CloseModalBtn(), AddPlayerBtn(), StartGameBtn()],
      );
    });
  }
}

class ContentWidget extends StatelessWidget {
  const ContentWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(builder: (context, gp, child) {
      return SizedBox(
        height: 140,
        child: Column(
          children: [
            Form(
              child: TextField(
                autofocus: true,
                style: kNewGameModalTableFont,
                decoration: newPlayerFieldDeco,
                onChanged: (value) {
                  gp.playerName = value;
                },
              ),
            ),
            Text(
              'Players for this game: ${gp.newPlayers.keys.length}',
              style: kNewGameModalTableFont,
            ),
            TableFromEnteredPlayers()
          ],
        ),
      );
    });
  }
}

class TableFromEnteredPlayers extends StatelessWidget {
  const TableFromEnteredPlayers({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(
      builder: (context, gp, child) {
        List<TableRow> rows = [];
        for (int i = 0; i < gp.newPlayers.keys.length; i++) {
          if (i % 2 == 0) {
            rows.add(TableRow(children: [Container(), Container()]));
            rows.last.children?[0] = MyTableEntery(i: i);
          } else {
            rows.last.children?[1] = MyTableEntery(i: i);
          }
        }
        return Table(
          children: rows,
        );
      },
    );
  }
}

class MyTableEntery extends StatelessWidget {
  const MyTableEntery({
    Key? key,
    required this.i,
  }) : super(key: key);

  final int i;

  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(builder: (context, gp, child) {
      return TextButton(
        child: Text(
          '${i + 1}: ${gp.newPlayers.keys.toList()[i]}',
          style: kNewGameModalTableFont,
        ),
        style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size(50, 30),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            alignment: Alignment.centerLeft),
        onPressed: () {},
        onLongPress: () {
          gp.removePlayer(gp.newPlayers.keys.toString()[i]);
        },
      );
    });
  }
}

class StartGameBtn extends StatelessWidget {
  const StartGameBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer3<GameProvider, HandListProvider, AdProvider>(
        builder: (context, gp, hl, ap, child) {
      return TextButton(
        child: const Text(
          'Start Game',
          style: kNewGameModalActionFont,
        ),
        onPressed: () {
          if (gp.newPlayers.length > 1) {
            gp.updatePlayerList();
            print(
                'ap.isRewardedInterstitialReady: ${ap.isRewardedInterstitialReady}');
            if (ap.isRewardedInterstitialReady) {
              ap.dispalayRewardedInterstitialAd(context);
            } else {
              Navigator.pushNamed(context, TabedScorecardScreen.id);
            }
          } else {
            gp.startSoloGame();
            hl.reset();
            Navigator.pop(context);
            if (ap.isInterstitialAdReady) {
              ap.dispalayInterstitialAd();
            } else {
              Navigator.pushNamed(context, SoloScorecardScreen.id);
            }
          }
        },
      );
    });
  }
}

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
            if (gp.newPlayers.keys.length == 6) {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => TooManyPlayersAlert(),
              );
            } else {
              gp.addPlayer(Player(gp.playerName));
              Navigator.pop(context);
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => NewGameModal(),
              );
            }
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
