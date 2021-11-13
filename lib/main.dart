import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:super_meat/utils/constants.dart';
import 'package:super_meat/view/homePage.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Super Meat',
      theme: ThemeData(
        primaryColor: Colors.white,
        primarySwatch: Colors.green,
        colorScheme: ColorScheme.fromSwatch(accentColor: Colors.transparent),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: AppFont.poppins,
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 19,
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            color: Colors.red,
          ),
          bodyText2: TextStyle(
            color: Colors.black,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const HomePage(),
    );
  }
}
