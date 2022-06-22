import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mhing_score_card/res/ad_helper.dart';
import 'package:mhing_score_card/screens/solo_scorecard_screen.dart';
import 'package:mhing_score_card/screens/tabed_scorecard_screen.dart';

class AdProvider with ChangeNotifier {
  ///interstitial ad
  InterstitialAd? _interstitialAd;
  bool _isInterstitialAdReady = false;

  InterstitialAd? get interstitialAd => _interstitialAd;
  bool get isInterstitialAdReady => _isInterstitialAdReady;

  set interstitialAd(InterstitialAd? value) {
    _interstitialAd = value;
  }

  set isInterstitialAdReady(bool value) {
    _isInterstitialAdReady = value;
  }

  void dispalayInterstitialAd() {
    _interstitialAd!.show();
    _isInterstitialAdReady = false;
  }

  void loadInterstitialAd(BuildContext context, String destination) {
    InterstitialAd.load(
      adUnitId: AdHelper.testInterstitialAdUnitId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          this._interstitialAd = ad;
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              Navigator.pushNamed(context, destination);
            },
          );
          _isInterstitialAdReady = true;
        },
        onAdFailedToLoad: (err) {
          print(
              'Failed to load an interstitial ad: 421 I am a potato ${err.message}');
          _isInterstitialAdReady = false;
        },
      ),
    );
  }

  ///rewarded ad
  late RewardedInterstitialAd? _rewardedInterstitialAd;
  bool _isRewardedInterstitialReady = false;

  RewardedInterstitialAd? get rewardedInterstitialAd => _rewardedInterstitialAd;
  bool get isRewardedInterstitialReady => _isRewardedInterstitialReady;

  set rewardedInterstitialAd(RewardedInterstitialAd? value) {
    _rewardedInterstitialAd = value;
  }

  set isRewardedInterstitialReady(bool value) {
    _isRewardedInterstitialReady = value;
  }

  void dispalayRewardedInterstitialAd(BuildContext context) {
    _rewardedInterstitialAd!.show(
      onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
        print('reward achived');
        Navigator.pushNamed(context, TabedScorecardScreen.id);
      },
    );
    _isRewardedInterstitialReady = false;
  }

  void loadRewardedInterstitialAd(BuildContext context) {
    RewardedInterstitialAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/5354046379',
      request: AdRequest(),
      rewardedInterstitialAdLoadCallback: RewardedInterstitialAdLoadCallback(
        onAdLoaded: (RewardedInterstitialAd ad) {
          print('onAdLoaded entered');
          print('$ad loaded.');
          // Keep a reference to the ad so you can show it later.
          this._rewardedInterstitialAd = ad;
          _isRewardedInterstitialReady = true;
          print(
              'ap.isRewardedInterstitialReady within load function: $isRewardedInterstitialReady');
        },
        onAdFailedToLoad: (LoadAdError error) {
          print('onAdFailedToLoad entered');
          print('RewardedInterstitialAd failed to load: $error');

          _isRewardedInterstitialReady = false;
        },
      ),
    );
  }
}
