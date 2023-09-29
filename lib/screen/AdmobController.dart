import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:pomodoro/getxFile/GetXController.dart';

import 'ADManager.dart';

class AdmobController extends GetXController{

   late BannerAd _bannerAd;
   RxBool _isAdLoaded = false.obs;
  //
   BannerAd? get ad => _bannerAd;
   bool get isAdLoaded => _isAdLoaded.value;

  @override
  void onInit() {
    super.onInit();
    loadBanner();
  }

  @override
  void onClose() {
    super.onClose();
    _bannerAd?.dispose();
  }

  Future<void> loadBanner() async {
   BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: AdRequest(),
      size: AdSize.banner,
      listener:
      BannerAdListener(
          onAdFailedToLoad: (Ad ad,LoadAdError error){},
          onAdLoaded: (ad){
            _isAdLoaded.value = true;
            _bannerAd = ad as BannerAd;
            print("Ok");
            update();
          }
      ),
    ).load();
  }
}