import 'package:flutter/material.dart';
import 'package:mhing_score_card/modals/new_game_modal.dart';
import 'package:mhing_score_card/providers/game_provider.dart';
import 'package:mhing_score_card/providers/hand_list_provider.dart';
import 'package:mhing_score_card/res/constants.dart';
import 'package:mhing_score_card/res/strings.dart';
import 'package:mhing_score_card/screens/solo_scorecard_screen.dart';
import 'package:mhing_score_card/widgets/buttons_&_borders/mhing_button.dart';
import 'package:provider/provider.dart';

class GameModeModal extends StatelessWidget {
  const GameModeModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<GameProvider, HandListProvider>(
        builder: (context, gp, hl, child) {
      return AlertDialog(
        title: Text('Pick Game Mode'),
        content: Text(
            'this will clear out any ongoing game you are currently scoring.'),
        actions: [
          MhingButton(
            sGameModeModalSoloButton,
            onPressed: () {
              gp.singlePlayerMode = true;
              hl.reset();
              Navigator.pop(context);
              showDialog<String>(
                  context: context,
                  builder: (BuildContext context) =>
                      const SoloScorecardScreen());
            },
            height: 100,
            width: double.infinity,
            style: kGameModeModalButtonFont,
          ),
          MhingButton(
            sGameModeModalMultiButton,
            onPressed: () {
              gp.singlePlayerMode = false;
              Navigator.pop(context);
              showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => const NewGameModal());
            },
            height: 100,
            width: double.infinity,
            style: kGameModeModalButtonFont,
          ),
        ],
      );
    });
  }
}
