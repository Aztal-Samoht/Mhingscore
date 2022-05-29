import 'package:flutter/material.dart';
import 'package:mhing_score_card/v0/res/constants.dart';
import 'package:mhing_score_card/v0/res/strings.dart';
import 'package:mhing_score_card/v0/screens/rules_screen.dart';
import 'package:mhing_score_card/v0/widgets/app_border.dart';
import 'package:mhing_score_card/v0/widgets/mhing_button.dart';
import 'package:mhing_score_card/v0/widgets/new_game_buton.dart';
import 'package:mhing_score_card/v0/widgets/resume_game_buton.dart';

class HomeScreen extends StatelessWidget {
  static String id = '/';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBorder(
      borderRadius: 50,
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Container()),
              Expanded(
                child: sMainTitle,
              ),
              Expanded(child: Container()),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: buttonPadding),
                  child: NewGameButton(),
                ),
              ),
              SizedBox(height: 25),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: buttonPadding),
                  child: ResumeGameButton(),
                ),
              ),
              Expanded(child: Container()),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50.0, vertical: 20),
                  child: MhingButton(
                    label: 'Rules',
                    onPressed: () {
                      Navigator.pushNamed(context, RulesScreen.id);
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
