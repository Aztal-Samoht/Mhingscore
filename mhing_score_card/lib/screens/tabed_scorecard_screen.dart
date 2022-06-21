import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mhing_score_card/models/ad_helper.dart';
import 'package:mhing_score_card/providers/game_provider.dart';
import 'package:mhing_score_card/res/constants.dart';
import 'package:mhing_score_card/res/strings.dart';
import 'package:mhing_score_card/screens/rules_screen.dart';
import 'package:mhing_score_card/widgets/scorecard_tab_displayer.dart';
import 'package:provider/provider.dart';

class TabedScorecardScreen extends StatefulWidget {
  static String id = '/scorecard';

  const TabedScorecardScreen({Key? key}) : super(key: key);

  @override
  State<TabedScorecardScreen> createState() => _TabedScorecardScreenState();
}

class _TabedScorecardScreenState extends State<TabedScorecardScreen> {
  late BannerAd _bannerAd;
  bool _isBannerAdReady = false;

  @override
  void initState() {
    super.initState();

    // TODO 07: Initialize _bannerAd
    _bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load banner ad: ${err.message}');
          _isBannerAdReady = false;
          ad.dispose();
        },
      ),
    );
    _bannerAd.load();
    // TODO: Initialize _rewardedAd
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(builder: (context, gp, child) {
      Map<Tab, Widget> tabs = {};
      for (String element in gp.players.keys) {
        tabs.addAll({Tab(text: element): ScorecardTabDisplayer(element)});
      }

      return SafeArea(
        child: DefaultTabController(
          length: gp.players.length,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: kAppBarColor,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(sScoreCardTitle),
                  TextButton(
                    child: const Text(
                      'view rules',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, RulesScreen.id);
                    },
                  ),
                ],
              ),
              bottom: TabBar(
                tabs: tabs.keys.toList(),
              ),
            ),
            body: TabBarView(children: tabs.values.toList()),
          ),
        ),
      );
    });
  }
}
