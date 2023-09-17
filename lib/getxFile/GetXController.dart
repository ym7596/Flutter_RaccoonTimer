import 'dart:async';

import 'package:get/get.dart';
import 'package:vibration/vibration.dart';


class GetXController extends GetxController{
  static GetXController get to => Get.find();

  Timer? timer;
  int remainingSeconds =1;
  RxInt currentTime = 0.obs;

  RxInt raccoonNum = 0.obs;
  int pomoTime = 1500;

  int restTime = 300;

  RxBool isRunning = false.obs;

  RxBool isRestTime = false.obs;


  @override
  void onReady(){
    currentTime.value = pomoTime;
    super.onReady();
  }

  @override
  void onClose(){
    super.onClose();
  }

  String format() {
    var duration = Duration(seconds: currentTime.value);

    var m = duration.inMinutes;
    if (duration.inHours > 0){
      m = 60;
    }

    var mstring = m.toString();
    if(mstring.length < 2)
      {
        mstring = "0"+mstring;
      }
    String s = (duration.inSeconds - (m*60)).toString();
    if(s.length < 2){

      s = "0"+s ;
    }

    //String result = duration.toString().split('.').first.substring(2);
    String result  = mstring + ":" + s.toString();
    return result;
  }

  void onVibration(){
        Vibration.vibrate(duration: 1000);
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
    isRestTime.value = false;
    isRunning.value = false;
    currentTime.value = pomoTime;
  }
   void startTimer(){
    const duration = Duration(seconds:1);
    isRunning.value = true;
    timer = Timer.periodic(duration, (Timer timer) {
      if(currentTime.value == 0){
        onVibration();
        if(isRestTime.value == false){
          raccoonNum += 1;
        }
        isRunning.value = false;
        currentTime.value = isRestTime.value == true ? pomoTime : restTime;
        isRestTime.value = !isRestTime.value;
        print(isRestTime);
        timer.cancel();
      }
      else{
        decrease();
      }
    });
  }
}