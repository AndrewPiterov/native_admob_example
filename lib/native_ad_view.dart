import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'constants.dart';

class NativeAdView extends StatefulWidget {
  const NativeAdView({Key? key}) : super(key: key);

  @override
  State<NativeAdView> createState() => _NativeAdViewState();
}

class _NativeAdViewState extends State<NativeAdView> {
  late NativeAd _ad;

  bool _isAdLoaded = false;

  @override
  void initState() {
    super.initState();

    // Create a NativeAd instance
    _ad = NativeAd(
      adUnitId: AppConstants.nativeAdUnitId,
      factoryId: AppConstants.factoryId,
      request: const AdRequest(),
      listener: NativeAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          // Releases an ad resource when it fails to load
          ad.dispose();
          print('Ad load failed (code=${error.code} message=${error.message})');
        },
      ),
    );

    _ad.load();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.pink,
      ),
      height: 300,
      alignment: Alignment.center,
      child: _isAdLoaded ? AdWidget(ad: _ad) : const SizedBox.shrink(),
    );
  }

  @override
  void dispose() {
    // Dispose a NativeAd object
    _ad.dispose();
    super.dispose();
  }
}
