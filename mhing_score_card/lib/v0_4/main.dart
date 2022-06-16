import 'package:flutter/material.dart';
import 'package:mhing_score_card/lab/lab00/lab00.dart';
import 'package:mhing_score_card/v0_4/providers/hand_list_provider.dart';
import 'package:mhing_score_card/v0_4/providers/temp_hand_provider.dart';
import 'package:mhing_score_card/v0_4/screens/home_screen.dart';
import 'package:mhing_score_card/v0_4/screens/options_screen.dart';
import 'package:mhing_score_card/v0_4/screens/rules_screen.dart';
import 'package:mhing_score_card/v0_4/modals/new_game_modal.dart';
import 'package:mhing_score_card/v0_4/providers/game_provider.dart';
import 'package:mhing_score_card/v0_4/screens/solo_scorecard_screen.dart';
import 'package:mhing_score_card/v0_4/screens/tabed_scorecard_screen.dart';
import 'package:provider/provider.dart';

void mainV0_4() {
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
          NewGameModal.id: (context) => const NewGameModal(),
          TabedScorecardScreen.id: (context) => const TabedScorecardScreen(),
          SoloScorecardScreen.id: (context) => const SoloScorecardScreen(),
          RulesScreen.id: (context) => const RulesScreen(),
        },
      ),
    );
  }
}
