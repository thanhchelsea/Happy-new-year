import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

import '../../res/colors.dart';
import '../../res/resources.dart';
import '../../utils/utils.dart';
import 'package:flutter_polygon/flutter_polygon.dart';

class Countdown extends StatefulWidget {
  @override
  _CountdownState createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {
  CountdownTimerController controller;
  final DateTime lunarNewYear = DateTime(2022, 2, 1);

  double width, height;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DateTime now = DateTime.now();
    Duration duration = lunarNewYear.difference(now);
    print(duration.inDays);
    int endTime =
        DateTime.now().millisecondsSinceEpoch + duration.inMilliseconds;
    controller = CountdownTimerController(
      endTime: endTime,
    );
  }
//4 8 9 10
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget itemTimer(String time, String timeUnit, String image) {
    return Container(
      width: width * 0.24,
      height: width * 0.24,
      decoration: ShapeDecoration(
        shadows: [
          BoxShadow(
            offset: const Offset(3.0, 3.0),
            blurRadius: 3.0,
            spreadRadius: 1.0,
          ),
        ],
        color: AppTheme.red,
        shape: PolygonBorder(
          sides: 4,
          borderRadius: 8.0,
          // border: BorderSide(color: AppTheme.nealyRed, width: 3),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            time,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.18,
              color: AppTheme.nearlyYellow,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            timeUnit,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.18,
              color: AppTheme.nearlyYellow,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    width = DeviceUtil.getDeviceWidth(context);
    height = DeviceUtil.getDeviceHeight(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CountdownTimer(
            controller: controller,
            widgetBuilder: (_, CurrentRemainingTime time) {
              if (time == null) {
                String day="";
                if( DateTime.now().day == 1) {
                  day = "Mùng 1 tết";
                }
                if( DateTime.now().day == 2) {
                  day = "Mùng 2 tết";
                }
                if( DateTime.now().day == 3) {
                  day = "Mùng 3 tết";
                }
                  return Text(
                   day,// "Chúc Mừng Năm Mới",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: AppTheme.red,
                    ),
                  );
              }
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      itemTimer(
                        time.days != null
                            ? (time.days < 10
                                ? '0${time.days}'
                                : time.days.toString())
                            : '00',
                        'Ngày',
                        AppImages.ANH_NEN7,
                      ),
                      itemTimer(
                        time.hours != null
                            ? (time.hours < 10
                                ? '0${time.hours}'
                                : time.hours.toString())
                            : '00',
                        'Giờ',
                        AppImages.ANH_NEN8,
                      ),
                      itemTimer(
                        time.min != null
                            ? (time.min < 10
                                ? '0${time.min}'
                                : time.min.toString())
                            : '00',
                        'Phút',
                        AppImages.ANH_NEN7,
                      ),
                      itemTimer(
                        time.sec != null
                            ? (time.sec < 10
                                ? '0${time.sec}'
                                : time.sec.toString())
                            : '00',
                        'Giây',
                        AppImages.ANH_NEN8,
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  time != null
                      ? Text(
                          "Đếm ngược đoàn viên",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: AppTheme.red,
                          ),
                        )
                      : Container(),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
