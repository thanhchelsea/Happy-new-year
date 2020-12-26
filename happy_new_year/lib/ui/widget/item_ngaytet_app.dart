import 'package:flutter/material.dart';
import 'package:happy_new_year/res/colors.dart';
import 'package:happy_new_year/utils/device.dart';
class ItemAppNgayTet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
     // margin: EdgeInsets.only(left: 10),
      width:DeviceUtil.getDeviceWidth(context)/2-20,
      height: DeviceUtil.getDeviceHeight(context)/7,
      decoration: BoxDecoration(
        color: AppTheme.nearlyWhite,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            child: Text("gf"),
          ),
          Container(
            child: Text("gf"),
          ),
        ],
      ),
    );
  }
}
