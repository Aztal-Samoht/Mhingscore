import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mhing_score_card/res/ad_helper.dart';
import 'package:mhing_score_card/res/constants.dart';

class AppBorder extends StatefulWidget {
  AppBorder({
    Key? key,
    required this.child,
    Color? backgroundColor,
    required this.borderRadius,
    this.hPadding,
    this.vPadding,
  }) : super(key: key) {
    this.backgroundColor =
        backgroundColor == null ? kBackgroundColor : this.backgroundColor;
  }
  final double? hPadding;
  final double? vPadding;
  final Widget child;
  double borderRadius;
  Color? backgroundColor;

  @override
  State<AppBorder> createState() => _AppBorderState();
}

class _AppBorderState extends State<AppBorder> {
  late BannerAd _bannerAd;
  bool _isBannerAdReady = false;

  @override
  void initState() {
    super.initState();
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/card_back.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 15.0, right: 15.0, left: 15.0, bottom: 55),
                child: Material(
                  color: widget.backgroundColor,
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SafeArea(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: widget.hPadding ?? 0,
                          vertical: widget.vPadding ?? 0,
                        ),
                        child: widget.child,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (_isBannerAdReady)
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: _bannerAd.size.width.toDouble(),
                height: _bannerAd.size.height.toDouble(),
                child: AdWidget(ad: _bannerAd),
              ),
            ),
        ],
      ),
    );
  }
}
