import 'package:flutter/material.dart';
import 'package:happy_new_year/ui/screen/home_screen.dart';
import 'package:happy_new_year/ui/screen/screen.dart';
class Routes{
  Routes._();
  static const String splashScreen = "/splash_screen";
  static const String home = "/homeScreen";
  static const String lixi = "/li_xi";
  static const String taothiep = "./tao_thiep_screen";
  static const String loichuc = "/tao_loi_chuc_sceen";
  static const String loi_chuc_detail = "/loi_chuc_detail_screen";
  static const String cam_nang = '/cam_nang_screen';
  static const String cam_nang_detail = '/cam_nang_detail_screen';
  static const String sms = '/sms_screen';
  static const String van_khan_screen = '/van_khan_screen';
  static const String van_khan_detail ='/van_khan_detail_screen';

  static String initScreen() => home;

  static final routes = <String, WidgetBuilder>{
//    splashScreen:(context)=>SplashScreen(),
    home: (context) => HomeScreen(),//Home(),
    lixi: (context) => LiXiScreen(),//Home(),
    taothiep: (context) => TaoThiepScreen(),
    loichuc: (context) => LoiChucScreen(),
    cam_nang: (context) => CamNangScreen(),
    sms: (context) => SMSScreen(),
    van_khan_screen: (context) => VanKhanScreen(),
  };
}