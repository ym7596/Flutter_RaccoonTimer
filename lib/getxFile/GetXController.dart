import 'dart:async';

import 'package:get/get.dart';


class GetXController extends GetxController{
  static GetXController get to => Get.find();

  Timer? timer;
  int remainingSeconds =1;
  RxInt currentTime = 0.obs;

  RxInt raccoonNum = 0.obs;
  int pomoTime = 1500;

  int restTime = 300;

  RxBool isRunning = false.obs;

  bool isRestTime = false;


  @override
  void onReady(){
    currentTime.value = pomoTime;
    super.onReady();
  }

  @override
  void onClose(){
    super.onClose();
  }

  void settingTimer(int time){
    pomoTime = time;
    currentTime.value = pomoTime;
  }

  void decrease(){
    currentTime -= 1;
  }

  void stopTimer(){
    timer?.cancel();
    isRunning.value = false;
  }

  void resetTimer(){
    timer?.cancel();
    isRunning.value = false;
    currentTime.value = pomoTime;
  }
   void startTimer(){
    const duration = Duration(seconds:1);
    isRunning.value = true;
    timer = Timer.periodic(duration, (Timer timer) {
      if(currentTime.value == 0){
        if(isRestTime == false){
          raccoonNum += 1;
        }
        isRunning.value = false;
        currentTime.value = isRestTime == true ? pomoTime : restTime;
        isRestTime = !isRestTime;
        timer.cancel();
      }
      else{
        decrease();
      }
    });
  }
}