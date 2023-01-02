import 'package:flutter/material.dart';
import 'package:soccervio/reservation/constant.dart';
import 'package:flutter/services.dart';
import 'package:soccervio/booking.dart';
import 'package:soccervio/datepicker.dart';
import 'package:soccervio/pages/home/carousel_slider/carousel_slider.dart';
import 'package:soccervio/pages/welcome_screen.dart';
import 'package:soccervio/reservation/main.dart';
import 'package:soccervio/reservation/widgets/bottom_bar.dart';
import 'package:soccervio/util/theme.dart';

void main() {
  // SystemChrome.setSystemUIOverlayStyle(
  //     SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  // runApp(const MyApp());
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(const MyApp());

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SoccerVio',
      theme: ThemeData(
        fontFamily: 'NunitoSans',
        scaffoldBackgroundColor: kPrimaryColor,
      ),
      // theme: lightThemeData(context),
      // darkTheme: darkThemeData(context),
      home: BottomBar(),
    );
  }
}
