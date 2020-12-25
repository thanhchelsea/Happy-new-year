import 'package:flutter/material.dart';
import 'package:happy_new_year/ui/screen/home_screen.dart';
class Routes{
  Routes._();
  static const String splashScreen="/splash_screen";
  static const String home = "/homeScreen";


  static String initScreen() => home;

  static final routes = <String, WidgetBuilder>{
//    splashScreen:(context)=>SplashScreen(),
    home: (context) => HomeScreen(),//Home(),
  };
}