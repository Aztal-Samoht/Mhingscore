import 'package:flutter/material.dart';
import 'package:mhing_score_card/v0.0.0/providers/hand_list_provider.dart';
import 'package:mhing_score_card/v0.0.0/providers/temp_hand_provider.dart';
import 'package:mhing_score_card/v0.0.0/screens/home_screen.dart';
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
        },
      ),
    );
  }
}
