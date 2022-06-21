import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mhing_score_card/res/ad_helper.dart';
import 'package:mhing_score_card/screens/solo_scorecard_screen.dart';

class AdProvider with ChangeNotifier {
  InterstitialAd? _interstitialAd;
  bool _isInterstitialAdReady = false;

  InterstitialAd? get interstitialAd => _interstitialAd;

  set interstitialAd(InterstitialAd? value) {
    _interstitialAd = value;
  }

  bool get isInterstitialAdReady => _isInterstitialAdReady;

  set isInterstitialAdReady(bool value) {
    _isInterstitialAdReady = value;
  }

  void dispalayInterstitialAd() {
    _interstitialAd!.show();
    _isInterstitialAdReady = false;
  }

  void loadInterstitialAdForBefore(BuildContext context, String destination) {
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
}
