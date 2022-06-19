import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mhing_score_card/res/constants.dart';
import 'package:mhing_score_card/res/strings.dart';
import 'package:mhing_score_card/screens/options_screen.dart';
import 'package:mhing_score_card/screens/rules_screen.dart';
import 'package:mhing_score_card/screens/ad_test_screen.dart';
import 'package:mhing_score_card/widgets/buttons_&_borders/app_border.dart';
import 'package:mhing_score_card/widgets/buttons_&_borders/mhing_button.dart';
import 'package:mhing_score_card/widgets/buttons_&_borders/new_game_buton.dart';
import 'package:mhing_score_card/widgets/buttons_&_borders/resume_game_buton.dart';

class HomeScreen extends StatefulWidget {
  static String id = '/';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    int standardFlex = 2;
    return AppBorder(
      vPadding: 40,
      hPadding: 20,
      borderRadius: kAppBorderRadius,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyHomePageSpacer(1, 10),
          sMainTitle,
          MyHomePageSpacer(1, 20),
          NewGameBtn(standardFlex),
          MyHomePageSpacer(1, 10),
          ResumeGameBtn(standardFlex),
          MyHomePageSpacer(2, 40),
          RulesBtn(1),
          MyHomePageSpacer(1, 20),
          OptionsBtn(1),
          Text('v0.5.0', style: TextStyle(color: Colors.red, fontSize: 10)),
        ],
      ),
    );
  }

  Future<InitializationStatus> _initGoogleMobileAds() {
    return MobileAds.instance.initialize();
  }
}

class OptionsBtn extends StatelessWidget {
  const OptionsBtn(
    this.flex, {
    Key? key,
  }) : super(key: key);
  final int flex;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: flex,
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
  const RulesBtn(
    this.flex, {
    Key? key,
  }) : super(key: key);
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: flex,
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
