import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomodoro/getxFile/GetXController.dart';
import 'package:pomodoro/screen/AdmobController.dart';
import 'package:pomodoro/screen/setting_screen.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class PomoScreen extends StatelessWidget {
  PomoScreen({super.key});

  void onStartPressed() {
    GetXController.to.startTimer();
  }

  void onPausePressed() {
    GetXController.to.stopTimer();
  }

  void onResetPressed() {
    GetXController.to.resetTimer();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(GetXController());
    final adControl = Get.put(AdmobController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () => Get.toNamed('/setting'),
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
              ))
        ],
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('asset/img/bg_raccooonnn.png'),
                fit: BoxFit.cover
              )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AdShow(adControl),
                //AdCall(),
                MainTimer,
                PlayPauseBtn(context),
                const SizedBox(
                  height: 30,
                ),
                ResetBtn(context),
                StateText()
               ,
                BottomRaccoonInfo(context)
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget MainTimer = Obx(() => Stack(
    children: <Widget>[
      Text(
      GetXController.to.format(),
        style: TextStyle(
          fontSize: 80,
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 6
            ..color = Colors.black!,
        ),
    ),
      Text(
        GetXController.to.format(),
        style: TextStyle(
          fontSize: 80,
          color: Colors.white,
        ),
      ),
    ]
  ));

  Widget PlayPauseBtn(BuildContext context) {
    return Obx(() => IconButton(
          icon: Icon(GetXController.to.isRunning.value
              ? Icons.pause_circle_outline
              : Icons.play_circle_outlined),
          iconSize: 120,
          color: Theme.of(context).cardColor,
          onPressed: GetXController.to.isRunning.value
              ? onPausePressed
              : onStartPressed,
        ));
  }

  Widget ResetBtn(BuildContext context) => IconButton(
        onPressed: onResetPressed,
        icon: const Icon(Icons.refresh_outlined),
        color: Theme.of(context).cardColor,
        iconSize: 50,
      );

  Widget StateText() => Obx(
        () => Text(
          GetXController.to.isRestTime.value == true ? "휴식!" : "너구리시간",
          style: TextStyle(
              fontSize: 30,
              color: GetXController.to.isRestTime.value == true
                  ? Colors.green
                  : Colors.white),
        ),
      );

  Widget AdShow(AdmobController controller) {
    return Obx(() => Container(
      height: 50,
        decoration: BoxDecoration(color: Colors.white),
        child: (controller.isAdLoaded)
            ?
            // Show the loaded ad widget if it's loaded successfully.
            AdWidget(ad: controller.ad!)
            :
            // Show a placeholder or loading indicator while the ad is being loaded.
            CircularProgressIndicator()
    )
    );
  }

  Widget BottomRaccoonInfo(BuildContext context) =>      Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[
      Container(
        decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight:  Radius.circular(16)
            ),
            color: Colors.white
        ),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Text(
              '돌아온 너구리',
              style: TextStyle(
                  fontSize: 23,
                  color: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .color,
                  fontWeight: FontWeight.w600),
            ),
            Obx(() {
              return Text(
                '${GetXController.to.raccoonNum} 너구리',
                style: TextStyle(
                    fontSize: 58,
                    color: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .color,
                    fontWeight: FontWeight.w600),
              );
            }),
            SizedBox(height: 20,)
          ],
        ),
      )

    ],
  );

}
