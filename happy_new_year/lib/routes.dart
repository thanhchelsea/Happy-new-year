import 'package:flutter/material.dart';
import 'package:happy_new_year/ui/screen/home_screen.dart';
import 'package:happy_new_year/ui/screen/screen.dart';
class Routes{
  Routes._();
  static const String splashScreen="/splash_screen";
  static const String home = "/homeScreen";
  static const String lixi = "/li_xi";


  static String initScreen() => home;

  static final routes = <String, WidgetBuilder>{
//    splashScreen:(context)=>SplashScreen(),
    home: (context) => HomeScreen(),//Home(),
    lixi: (context) => LiXiScreen(),//Home(),
  };
}