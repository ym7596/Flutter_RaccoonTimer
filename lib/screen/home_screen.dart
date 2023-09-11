import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var pomoTime = 1500;

  var restTime = 5;

  var racoonNum = 0;

  var numberViewer = 10;

  bool isRunning = false;

  bool isRestTime = false;
  late Timer timer;
  void onTick(Timer timer) {
    if (numberViewer == 0) {
      if(isRestTime == false){
        racoonNum += 1;
      }

      setState(() {
        isRunning = false;
        numberViewer = isRestTime == true ? pomoTime : restTime;
        isRestTime = !isRestTime;
      });
      timer.cancel();
    } else {
      setState(() {
        numberViewer -= 1;
      });
    }
  }

  void onStartPressed() {
    timer = Timer.periodic(
      Duration(seconds: 1),
      onTick,
    );

    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();

    setState(() {
      isRunning = false;
    });
  }

  void onRestPressed() {
    timer.cancel();

    setState(() {
      isRunning = false;
      numberViewer = pomoTime;
    });
  }

  void openSetting(BuildContext context) {
    Navigator.pushNamed(context, '/setting');
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    String result = duration.toString().split('.').first.substring(2);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(onPressed: () { openSetting(context);}, icon: Icon(Icons.settings))
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
                  child: Text(
                    format(numberViewer),
                    style: TextStyle(
                        color: Color(0xFFF4EDDB),
                        fontSize: 89,
                        fontWeight: FontWeight.w600),
                  ),
                )),
            Flexible(
                flex: 3,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(isRunning
                            ? Icons.pause_circle_outline
                            : Icons.play_circle_outlined),
                        iconSize: 120,
                        color: Theme.of(context).cardColor,
                        onPressed: isRunning ? onPausePressed : onStartPressed,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      IconButton(
                        onPressed: onRestPressed,
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
                            Text(
                              '$racoonNum 너굴',
                              style: TextStyle(
                                  fontSize: 58,
                                  color: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .color,
                                  fontWeight: FontWeight.w600),
                            ),
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
