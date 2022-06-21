import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mhing_score_card/modals/new_game_modal.dart';
import 'package:mhing_score_card/res/ad_helper.dart';
import 'package:mhing_score_card/providers/ad_provider.dart';
import 'package:mhing_score_card/providers/game_provider.dart';
import 'package:mhing_score_card/providers/hand_list_provider.dart';
import 'package:mhing_score_card/res/constants.dart';
import 'package:mhing_score_card/res/strings.dart';
import 'package:mhing_score_card/screens/solo_scorecard_screen.dart';
import 'package:mhing_score_card/widgets/buttons_&_borders/mhing_button.dart';
import 'package:provider/provider.dart';

class GameModeModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer3<GameProvider, HandListProvider, AdProvider>(
        builder: (context, gp, hl, ap, child) {
      return AlertDialog(
        title: Text('Pick Game Mode'),
        content: Text(
            'this will clear out any ongoing game you are currently scoring.'),
        actions: [
          ///solo button
          MhingButton(
            sGameModeModalSoloButton,
            onPressed: () {
              gp.startSoloGame();
              hl.reset();
              Navigator.pop(context);
              if (ap.isInterstitialAdReady) {
                ap.dispalayInterstitialAd();
              } else {
                Navigator.pushNamed(context, SoloScorecardScreen.id);
              }
            },
            height: 100,
            width: double.infinity,
            style: kGameModeModalButtonFont,
          ),

          ///table button
          MhingButton(
            sGameModeModalMultiButton,
            onPressed: () {
              gp.startMultiGame();
              // gp.playerName = '';
              // gp.enteredPlayers = [];
              Navigator.pop(context);
              showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => NewGameModal());
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
