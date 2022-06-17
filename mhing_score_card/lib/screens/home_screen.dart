import 'package:flutter/material.dart';
import 'package:mhing_score_card/res/constants.dart';
import 'package:mhing_score_card/res/strings.dart';
import 'package:mhing_score_card/screens/options_screen.dart';
import 'package:mhing_score_card/screens/rules_screen.dart';
import 'package:mhing_score_card/widgets/buttons_&_borders/app_border.dart';
import 'package:mhing_score_card/widgets/buttons_&_borders/mhing_button.dart';
import 'package:mhing_score_card/widgets/buttons_&_borders/new_game_buton.dart';
import 'package:mhing_score_card/widgets/buttons_&_borders/resume_game_buton.dart';

//TODO: store the scores online
//TODO: create game sessions online
//TODO: deactivate resume btn if no game started
//TODO: add warning to new solo game of erasing current game
//TODO: add storage for previously used names
//TODO:
class HomeScreen extends StatelessWidget {
  static String id = '/';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBorder(
      vPadding: 40,
      hPadding: 20,
      borderRadius: kAppBorderRadius,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          sMainTitle,
          MyHomePageSpacer(1, 45),
          NewGameBtn(),
          MyHomePageSpacer(1, 25),
          ResumeGameBtn(),
          MyHomePageSpacer(1, 40),
          RulesBtn(),
          MyHomePageSpacer(1, 20),
          OptionsBtn(),
        ],
      ),
    );
  }
}

class OptionsBtn extends StatelessWidget {
  const OptionsBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.0),
          child: MhingButton(
            'Options',
            onPressed: () {
              Navigator.pushNamed(context, OptionsScreen.id);
            },
            height: 50,
            width: 100,
          ),
        ));
  }
}

class RulesBtn extends StatelessWidget {
  const RulesBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.0),
          child: MhingButton(
            'Rules',
            onPressed: () => Navigator.pushNamed(context, RulesScreen.id),
            height: 50,
            width: 100,
          ),
        ));
  }
}

class MyHomePageSpacer extends StatelessWidget {
  const MyHomePageSpacer(
    this.flex,
    this.height, {
    Key? key,
  }) : super(key: key);
  final int flex;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Expanded(flex: flex, child: SizedBox(height: height));
  }
}

/*
*
*
      * */
