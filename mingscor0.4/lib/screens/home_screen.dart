import 'package:flutter/material.dart';
import 'package:mhing_score_card/providers/game_provider.dart';
import 'package:mhing_score_card/res/constants.dart';
import 'package:mhing_score_card/res/strings.dart';
import 'package:mhing_score_card/widgets/appearance/app_border.dart';
import 'package:mhing_score_card/widgets/appearance/mhing_button.dart';
import 'package:mhing_score_card/widgets/appearance/new_game_buton.dart';
import 'package:mhing_score_card/widgets/appearance/resume_game_buton.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static String id = '/';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBorder(
      borderRadius: kAppBorderRadius,
      child: Scaffold(
        backgroundColor: Color(0x00ffffff),
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
              SizedBox(height: 35),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kButtonPadding),
                  child: NewGameButton(),
                ),
              ),
              SizedBox(height: 25),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kButtonPadding),
                  child: ResumeGameButton(),
                ),
              ),
              Expanded(child: Container()),
              //todo: make this button work
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50.0, vertical: 10),
                  child: MhingButton(
                    label: 'Rules',
                    onPressed: () {
                      // Navigator.pushNamed(context, RulesScreen.id);
                    },
                    height: 20,
                    width: 40,
                  ),
                ),
              ),
              //todo: make this button work
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50.0, vertical: 10),
                  child: MhingButton(
                    label: 'Options',
                    onPressed: () {
                      context.read<GameProvider>().printPlayers();
                      // Navigator.pushNamed(context, OptionsScreen.id);
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
