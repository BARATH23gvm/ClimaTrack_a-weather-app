import 'package:flutter/material.dart';
import 'package:weather_api_project_practice/splash_screen.dart';
void main() {
  runApp(MyWeatherApp());
}

class MyWeatherApp extends StatelessWidget {
  const MyWeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MySplash()
    );
  }
}
