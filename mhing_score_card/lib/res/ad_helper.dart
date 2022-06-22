import 'dart:io';

/*
* Ad format	Sample ad unit ID
App Open	ca-app-pub-3940256099942544/3419835294
Banner	ca-app-pub-3940256099942544/6300978111
Interstitial	ca-app-pub-3940256099942544/1033173712
Interstitial Video	ca-app-pub-3940256099942544/8691691433
Rewarded	ca-app-pub-3940256099942544/5224354917
Rewarded Interstitial	ca-app-pub-3940256099942544/5354046379
Native Advanced	ca-app-pub-3940256099942544/2247696110
Native Advanced Video	ca-app-pub-3940256099942544/1044960115
* */

class AdHelper {
  static bool testing = false;
  static String get bannerAdUnitId {
    if (testing) {
      if (Platform.isAndroid) {
        return 'ca-app-pub-3940256099942544/6300978111';
      } else if (Platform.isIOS) {
        return 'ca-app-pub-3940256099942544/2934735716';
      } else {
        throw new UnsupportedError('Unsupported platform');
      }
    } else {
      if (Platform.isAndroid) {
        return 'ca-app-pub-5934630788997149/3737802903';
      } else if (Platform.isIOS) {
        //test ios ads
        return 'ca-app-pub-3940256099942544/2934735716';
      } else {
        throw new UnsupportedError('Unsupported platform');
      }
    }
  }

  static String get interstitialAdUnitId {
    if (testing) {
      if (Platform.isAndroid) {
        return "ca-app-pub-3940256099942544/1033173712";
      } else if (Platform.isIOS) {
        return "ca-app-pub-3940256099942544/4411468910";
      } else {
        throw new UnsupportedError("Unsupported platform");
      }
    } else {
      if (Platform.isAndroid) {
        return "ca-app-pub-5934630788997149/6253313276";
      } else if (Platform.isIOS) {
        //test unit id
        return "ca-app-pub-3940256099942544/4411468910";
      } else {
        throw new UnsupportedError("Unsupported platform");
      }
    }
  }

  static String get rewardedInterstitialAdUnitId {
    if (testing) {
      if (Platform.isAndroid) {
        return "ca-app-pub-3940256099942544/1033173712";
      } else if (Platform.isIOS) {
        return "ca-app-pub-3940256099942544/4411468910";
      } else {
        throw new UnsupportedError("Unsupported platform");
      }
    } else {
      if (Platform.isAndroid) {
        return "ca-app-pub-5934630788997149/5678598205";
      } else if (Platform.isIOS) {
        //test unit id
        return "ca-app-pub-3940256099942544/4411468910";
      } else {
        throw new UnsupportedError("Unsupported platform");
      }
    }
  }
}
