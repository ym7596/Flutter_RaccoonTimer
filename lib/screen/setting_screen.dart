import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';

class SettingScreen extends StatefulWidget {
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  int minutes = 1;
  int seconds = 0;
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
              crossAxisAlignment: CrossAxisAlignment.center,
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
                  children: [
                    Text(
                      "분",
                      style: TextStyle(fontSize: 50),
                    ),
                    Container(
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.brown, width: 5)),
                      child: NumberPicker(
                        value: minutes,
                        minValue: 0,
                        maxValue: 60,
                        step: 10,
                        haptics: true,
                        onChanged: (value) => setState(() => minutes = value),
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
                      "초",
                      style: TextStyle(fontSize: 50),
                    ),
                    Container(
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.brown, width: 5)),
                      child: NumberPicker(
                        value: seconds,
                        minValue: 0,
                        maxValue: 60,
                        step: 10,
                        haptics: true,
                        onChanged: (value) => setState(() => seconds = value),
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
                TextButton(
                    onPressed: () {},

                    child: Text("적용하기",style: TextStyle(
                      fontSize: 50,
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
}
