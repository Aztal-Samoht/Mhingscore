///this screen is just a landing screen for opening the app for now.
///you can follow the links to either score a game (you currently have to
///restart/hot-restart the app to reset the scorecard) or read the rules of the
///card game

import 'package:flutter/material.dart';
import 'package:mhing_score_card/v0/providers/hand_list_provider.dart';
import 'package:mhing_score_card/v0/providers/temp_hand_provider.dart';
import 'package:mhing_score_card/v0/res/theme_data.dart';
import 'package:mhing_score_card/v0/screens/hand_examples/hand_example.dart';
import 'package:mhing_score_card/v0/screens/hand_examples/hand_example_lab.dart';
import 'package:mhing_score_card/v0/screens/home_screen.dart';
import 'package:mhing_score_card/v0/screens/options_screen.dart';
import 'package:mhing_score_card/v0/screens/rules_screen.dart';
import 'package:mhing_score_card/v0/screens/scorecard/scorecard_screen.dart';
import 'package:provider/provider.dart';

class MyAppV0 extends StatelessWidget {
  const MyAppV0({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TempHandProvider()),
        ChangeNotifierProvider(create: (_) => HandListProvider()),
      ],
      child: MaterialApp(
        // theme: getMytheme(context),
        title: 'Mhingscore Card!',
        initialRoute: HomeScreen.id,
        routes: {
          HandExampleLab.id: (context) => HandExampleLab(),
          HandExample.id: (context) => HandExample(),
          // HandExample1.id: (context) => HandExample1(),
          // HandExample2.id: (context) => HandExample2(),
          // HandExample3.id: (context) => HandExample3(),
          // HandExample4.id: (context) => HandExample4(),
          // HandExample5.id: (context) => HandExample5(),
          // HandExample6.id: (context) => HandExample6(),
          // HandExample7.id: (context) => HandExample7(),
          // HandExample8.id: (context) => HandExample8(),
          // HandExample9.id: (context) => HandExample9(),
          // HandExample10.id: (context) => HandExample10(),
          // HandExample11.id: (context) => HandExample11(),
          // HandExample12.id: (context) => HandExample12(),
          // HandExample13.id: (context) => HandExample13(),
          // HandExample14.id: (context) => HandExample14(),
          // HandExample15.id: (context) => HandExample15(),
          // HandExample16.id: (context) => HandExample16(),
          // HandExample17.id: (context) => HandExample17(),
          // HandExample18.id: (context) => HandExample18(),
          OptionsScreen.id: (context) => OptionsScreen(),
          HomeScreen.id: (context) => HomeScreen(),
          ScorecardScreen.id: (context) => ScorecardScreen(),
          RulesScreen.id: (context) => RulesScreen(),
        },
      ),
    );
  }
}
