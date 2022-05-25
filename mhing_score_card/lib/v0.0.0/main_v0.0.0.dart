import 'package:flutter/material.dart';
import 'package:mhing_score_card/v0.0.0/screens/home_screen.dart';

class MyAppV0_0_0 extends StatelessWidget {
  const MyAppV0_0_0({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mhingscore Card!',
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
      },
    );
  }
}
