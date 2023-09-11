import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'package:pomodoro/screen/pomo_screen.dart';
import 'package:pomodoro/screen/setting_screen.dart';

final routes = [
  GetPage(name: '/', page: ()=>PomoScreen()),
  GetPage(name: '/setting', page: ()=>SettingScreen())
 // '/': (BuildContext context) => PomoScreen(),
  //'/setting':(BuildContext context) => SettingScreen()
];