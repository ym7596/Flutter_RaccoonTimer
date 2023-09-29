import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:pomodoro/getxFile/GetXController.dart';
class SettingScreen extends StatefulWidget {
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  int raccoontime = 1;
  int refreshtime = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Setting'),
          backgroundColor: const Color(0xFFA52A2A),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Text(
                  "너구리 타임",
                  style: const TextStyle(
                      color: Colors.brown,
                      fontSize: 30,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "너구리 타임",
                      style: TextStyle(fontSize: 20),
                    ),
                    Container(
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.brown, width: 5)),
                      child: NumberPicker(
                        value: raccoontime,
                        minValue: 0,
                        maxValue: 60,
                        step: 10,
                        haptics: true,
                        onChanged: (value) => setState(() => raccoontime = value),
                        itemHeight: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.black26),
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: 30,
                  color: Colors.brown,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "쉬는시간",
                      style: TextStyle(fontSize: 20),
                    ),
                    Container(
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.brown, width: 5)),
                      child: NumberPicker(
                        value: refreshtime,
                        minValue: 0,
                        maxValue: 30,
                        step: 1,
                        haptics: true,
                        onChanged: (value) => setState(() => refreshtime = value),
                        itemHeight: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.black26),
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: 30,
                  color: Colors.brown,
                ),
                SizedBox(height: 30,),
                TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(alertSnackBar());
                      setState(() {
                        int minuteToPomo = raccoontime * 60;

                        GetXController.to.settingTimer(minuteToPomo);
                        GetXController.to.restTime = refreshtime * 60;
                        GetXController.to.resetTimer();
                      });

                    },

                    child: Text("적용하기",style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,

                    ),),
                  style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.brown),
                    ))
              ],
            ),
          ),
        ));
  }

  SnackBar alertSnackBar(){
    print("test");
    return SnackBar(
        content: Text("저장이 완료되었너굴너굴"),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.brown,
      action: SnackBarAction(
        label: "너굴!",
        textColor: Colors.blueAccent,
        onPressed: (){},
      ),
    );
  }
}
