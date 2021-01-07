import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:happy_new_year/localizations.dart';

import '../../res/colors.dart';
import '../../res/resources.dart';
import '../../utils/ultils.dart';

class Countdown extends StatefulWidget {
  @override
  _CountdownState createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {
  CountdownTimerController controller;
  final DateTime lunarNewYear = DateTime(2021, 2, 12);

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

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  // Widget itemTimer(String time, String timeUnit) {
  //   return Container(
  //     width: 80,
  //     padding: EdgeInsets.all(8.0),
  //     decoration: BoxDecoration(
  //       color: Colors.red.withOpacity(0.8),
  //       borderRadius: BorderRadius.all(Radius.circular(4.0)),
  //     ),
  //     child: Column(
  //       children: [
  //         Text(
  //           time,
  //           style: TextStyle(
  //             fontSize: 26,
  //             fontWeight: FontWeight.bold,
  //             letterSpacing: 0.18,
  //             color: AppTheme.nearlyYellow,
  //           ),
  //         ),
  //         SizedBox(
  //           height: 5,
  //         ),
  //         Text(
  //           timeUnit,
  //           style: TextStyle(
  //             fontSize: 12,
  //             fontWeight: FontWeight.bold,
  //             letterSpacing: 0.18,
  //             color: AppTheme.nearlyYellow,
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  Widget itemTimer(String time, String timeUnit, String image) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: AppTheme.nearlyYellow.withOpacity(0.3),
              offset: const Offset(2.0, 2.0),
              blurRadius: 2.0,
              spreadRadius: 2.0,
            ),
          ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            child: Image(
              image: AssetImage(image),
              fit: BoxFit.cover,
              width: 80,
              height: DeviceUtil.getDeviceHeight(context) / 10,
              alignment: Alignment.center,
            ),
          ),
          Container(
            width: 80,
            padding: EdgeInsets.all(8.0),
            child: Column(
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
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      //height: 0.7*DeviceUtil.getDeviceHeight(context),
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),

      ),
      child: CountdownTimer(
        controller: controller,
        widgetBuilder: (_, CurrentRemainingTime time) {
          if (time == null) {
            return Text('Game Over');
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              itemTimer(
                time.days != null
                    ? (time.days < 10 ? '0${time.days}' : time.days.toString())
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
                    ? (time.min < 10 ? '0${time.min}' : time.min.toString())
                    : '00',
                'Phút',
                AppImages.ANH_NEN7,
              ),
              itemTimer(
                time.sec != null
                    ? (time.sec < 10 ? '0${time.sec}' : time.sec.toString())
                    : '00',
                'Giây',
                AppImages.ANH_NEN8,
              ),
            ],
          );
        },
      ),
    );
  }
}
