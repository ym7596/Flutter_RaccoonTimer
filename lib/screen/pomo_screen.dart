import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomodoro/getxFile/GetXController.dart';
import 'package:pomodoro/screen/setting_screen.dart';

class PomoScreen extends StatelessWidget {
  PomoScreen({super.key});


  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    String result = duration.toString().split('.').first.substring(2);
    return result;
  }

  void onStartPressed(){
    GetXController.to.startTimer();
  }

  void onPausePressed(){
    GetXController.to.stopTimer();
  }

  void onResetPressed(){
    GetXController.to.resetTimer();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(GetXController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(onPressed: ()=>Get.toNamed('/setting'),
              icon: const Icon(Icons.settings, color: Colors.white,)
          )
        ],
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
                flex: 1,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Obx(() {
                   return Text(
                      format(GetXController.to.currentTime.value),
                      style:const TextStyle(
                          color: Color(0xFFF4EDDB),
                          fontSize: 89,
                          fontWeight: FontWeight.w600),
                    );
                  })
                )),
            Flexible(
                flex: 3,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(() {
                        return IconButton(
                          icon: Icon(GetXController.to.isRunning.value
                              ? Icons.pause_circle_outline
                              : Icons.play_circle_outlined),
                          iconSize: 120,
                          color: Theme.of(context).cardColor,
                          onPressed: GetXController.to.isRunning.value ? onPausePressed : onStartPressed,
                        );
                      }),
                      SizedBox(
                        height: 50,
                      ),
                      IconButton(
                        onPressed: onResetPressed,
                        icon: Icon(Icons.refresh_outlined),
                        color: Theme.of(context).cardColor,
                        iconSize: 50,
                      )
                    ],
                  ),
                )),
            Flexible(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(50),
                                topLeft: Radius.circular(
                                    50)) //BorderRadius.circular(15)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
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
                             return  Text(
                               '${GetXController.to.raccoonNum} 너구리',

                               style: TextStyle(
                                   fontSize: 58,
                                   color: Theme.of(context)
                                       .textTheme
                                       .displayLarge!
                                       .color,
                                   fontWeight: FontWeight.w600),
                             );
                           })
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
