import 'package:flutter/material.dart';
import 'package:mhing_score_card/res/constants.dart';
import 'package:mhing_score_card/res/strings.dart';
import 'package:mhing_score_card/widgets/buttons_&_borders/app_border.dart';
import 'package:mhing_score_card/widgets/hand_descriptions.dart';

class RulesScreen extends StatelessWidget {
  static String id = '/rules';
  const RulesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        title: const Text('Rules of Mhing'),
      ),
      backgroundColor: Colors.white,
      body: AppBorder(
        borderRadius: 50,
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(sRules0, style: kRulesTitle),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(sRules1t, style: kRulesSubtitle),
                    Text(sRules1, style: kRulesText),
                    Text(sRules2t, style: kRulesSubtitle),
                    Text(sRules2, style: kRulesText),
                    Text(sRules3t, style: kRulesSubtitle),
                    Text(sRules3, style: kRulesText),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(sRules4, style: kRulesText),
                    ),
                    Text(sRules5, style: kRulesText),
                    Text(sRules6t, style: kRulesSubtitle),
                    Text(sRules6, style: kRulesText),
                    Text(sRules7t, style: kRulesSubtitle),
                    Text(sRules7, style: kRulesText),
                    Text(sRules8t, style: kRulesSubtitle),
                    Text(sRules8, style: kRulesText),

                    ///TODO:make this image zoomable
                    ExampleTable(),
                    Image(image: AssetImage('assets/examples.png')),
                    Text(sRules9),
                  ],
                ),
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
