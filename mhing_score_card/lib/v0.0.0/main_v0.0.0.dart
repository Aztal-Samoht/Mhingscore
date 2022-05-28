///this screen is just a landing screen for opening the app for now.
///you can follow the links to either score a game (you currently have to
///restart/hot-restart the app to reset the scorecard) or read the rules of the
///card game

import 'package:flutter/material.dart';
import 'package:mhing_score_card/v0.0.0/providers/hand_list_provider.dart';
import 'package:mhing_score_card/v0.0.0/providers/temp_hand_provider.dart';
import 'package:mhing_score_card/v0.0.0/screens/home_screen.dart';
import 'package:mhing_score_card/v0.0.0/screens/rules_screen.dart';
import 'package:mhing_score_card/v0.0.0/screens/scorecard_screen.dart';
import 'package:provider/provider.dart';

class MyAppV0_0_0 extends StatelessWidget {
  const MyAppV0_0_0({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TempHandProvider()),
        ChangeNotifierProvider(create: (_) => HandListProvider()),
      ],
      child: MaterialApp(
        title: 'Mhingscore Card!',
        initialRoute: HomeScreen.id,
        routes: {
          HomeScreen.id: (context) => HomeScreen(),
          ScorecardScreen.id: (context) => ScorecardScreen(),
          RulesScreen.id: (context) => RulesScreen(),
        },
      ),
    );
  }
}
