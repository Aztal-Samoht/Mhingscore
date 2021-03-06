import 'package:flutter/material.dart';
import 'package:mhing_score_card/modals/new_game_modal.dart';
import 'package:mhing_score_card/providers/ad_provider.dart';
import 'package:mhing_score_card/providers/game_provider.dart';
import 'package:mhing_score_card/providers/hand_list_provider.dart';
import 'package:mhing_score_card/providers/temp_hand_provider.dart';
import 'package:mhing_score_card/screens/hand_example.dart';
import 'package:mhing_score_card/screens/home_screen.dart';
import 'package:mhing_score_card/screens/options_screen.dart';
import 'package:mhing_score_card/screens/rules_screen.dart';
import 'package:mhing_score_card/screens/solo_scorecard_screen.dart';
import 'package:mhing_score_card/screens/tabed_scorecard_screen.dart';
import 'package:provider/provider.dart';

//TODO: store the scores online
//TODO: create game sessions online
//TODO: add storage for previously used names
//TODO: make hands removeable
//TODO: rework the border widget to use a Stack widget
//TODO: rework the border widget to use the SVG file
//TODO: add corner dropdown quick access menu
//TODO:
void main() {
  runApp(const MyAppVersionZeroPointFour());
}

class MyAppVersionZeroPointFour extends StatelessWidget {
  const MyAppVersionZeroPointFour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GameProvider()),
        ChangeNotifierProvider(create: (_) => TempHandProvider()),
        ChangeNotifierProvider(create: (_) => HandListProvider()),
        ChangeNotifierProvider(create: (_) => AdProvider()),
      ],
      child: MaterialApp(
        // theme: getMytheme(context),
        title: 'Mhingscore Card!',
        initialRoute: HomeScreen.id,
        routes: {
          // HandExampleLab.id: (context) => HandExampleLab(),
          HandExample.id: (context) => HandExample(),
          OptionsScreen.id: (context) => OptionsScreen(),
          HomeScreen.id: (context) => const HomeScreen(),
          NewGameModal.id: (context) => NewGameModal(),
          TabedScorecardScreen.id: (context) => const TabedScorecardScreen(),
          SoloScorecardScreen.id: (context) => const SoloScorecardScreen(),
          RulesScreen.id: (context) => const RulesScreen(),
        },
      ),
    );
  }
}
