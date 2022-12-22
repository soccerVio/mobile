import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soccervio/pages/home/carousel_slider/carousel_slider.dart';
import 'package:soccervio/pages/welcome_screen.dart';
import 'package:soccervio/util/theme.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SoccerVio',
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      home: WelcomeScreen(),
    );
  }
}
