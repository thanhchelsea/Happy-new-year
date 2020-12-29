import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happy_new_year/localizations.dart';
import 'package:happy_new_year/res/colors.dart';
import 'package:happy_new_year/res/images.dart';
import 'package:happy_new_year/utils/device.dart';

class ItemAppNgayTet extends StatelessWidget {
  String title, image;
  ItemAppNgayTet(this.title, this.image, this.method);
  Function method;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        method();
      },
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(24)),
            child: Image(
              image: AssetImage(image),
              fit: BoxFit.cover,
              width: DeviceUtil.getDeviceWidth(context) / 2 - 20,
              height: DeviceUtil.getDeviceHeight(context) / 7,
              alignment: Alignment.center,
            ),
          ),
          Container(
            alignment: Alignment.center,
            // margin: EdgeInsets.only(left: 10),
            child: Text(
              Language.of(context).getText(title),
              style: AppTheme.title,
            ),
          )
        ],
      ),
    );
  }
}
