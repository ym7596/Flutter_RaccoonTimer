import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'Router.dart';

void main() {
  runApp(const MyApp());
}
//admob id : ca-app-pub-5889873360425830~3115211013
//admob sdk 통합 : ca-app-pub-5889873360425830/7627217389
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Color(0xFF6E260E),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Color(0xFF232B55),
          )
        ),
        cardColor: const Color(0xFFF4EDDB)
      ),
      getPages: routes,
    );
  }
}
