import 'package:flutter/material.dart';
import 'package:mhing_score_card/v0.0.0/res/constants.dart';
import 'package:mhing_score_card/v0.0.0/res/strings.dart';
import 'package:mhing_score_card/v0.0.0/widgets/app_border.dart';
import 'package:mhing_score_card/v0.0.0/widgets/mhing_button.dart';

class HomeScreen extends StatelessWidget {
  static String id = '/';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBorder(
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
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: MhingButton(),
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
