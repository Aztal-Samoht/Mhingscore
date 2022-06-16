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
class HomeScreen extends StatelessWidget {
  static String id = '/';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBorder(
      borderRadius: kAppBorderRadius,
      child: Scaffold(
        backgroundColor: const Color(0x00ffffff),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Container()),
              const Expanded(
                child: sMainTitle,
              ),
              const SizedBox(height: 35),
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: kButtonPadding),
                  child: NewGameButton(),
                ),
              ),
              const SizedBox(height: 25),
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: kButtonPadding),
                  child: ResumeGameButton(),
                ),
              ),
              Expanded(child: Container()),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50.0, vertical: 10),
                  child: MhingButton(
                    'Rules',
                    onPressed: () {
                      Navigator.pushNamed(context, RulesScreen.id);
                    },
                    height: 20,
                    width: 40,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50.0, vertical: 10),
                  child: MhingButton(
                    'Options',
                    onPressed: () {
                      Navigator.pushNamed(context, OptionsScreen.id);
                    },
                    height: 20,
                    width: 40,
                  ),
                ),
              ),
              Expanded(child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}
/*
*
*
      * */
