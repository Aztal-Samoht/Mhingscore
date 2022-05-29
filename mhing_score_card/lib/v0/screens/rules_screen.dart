import 'package:flutter/material.dart';
import 'package:mhing_score_card/v0/res/constants.dart';
import 'package:mhing_score_card/v0/res/strings.dart';
import 'package:mhing_score_card/v0/widgets/app_border.dart';
import 'package:mhing_score_card/v0/widgets/new_game_buton.dart';

class RulesScreen extends StatelessWidget {
  static String id = '/rules';
  const RulesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        title: Text('Rules of Mhing'),
      ),
      backgroundColor: Colors.white,
      body: AppBorder(
        borderRadius: 50,
        aBackgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: const [
                Text(sRules0),
                Text(sRules1),
                Text(sRules2),
                Text(sRules3),
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(sRules4),
                ),
                Text(sRules5),
                Text(sRules6),
                Text(sRules7),
                Text(sRules8),
                Image(image: AssetImage('assets/examples.png')),
                Text(sRules9),
              ],
            ),
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
