import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happy_new_year/res/resources.dart';
import 'package:happy_new_year/utils/ultils.dart';


class DialogConfirmReport extends StatefulWidget {
  const DialogConfirmReport({
    Key key,
    this.barrierDismissible = true,
  }) : super(key: key);
  final bool barrierDismissible;
  @override
  DialogConfirmReportState createState() => DialogConfirmReportState();
}

class DialogConfirmReportState extends State<DialogConfirmReport>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey1 = new GlobalKey<ScaffoldState>();


  Widget ButtonWidget() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // key: _scaffoldKey1,
      backgroundColor: Colors.transparent,
      body:Center(
        child: Container(
          width: 300,
          height: 0.7*DeviceUtil.getDeviceHeight(context),
       //   color: Colors.white,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Image(
                image: AssetImage(AppImages.ANH_NEN2),
                // fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
              Container(
                width: 300,
                height: 0.7*DeviceUtil.getDeviceHeight(context),
                alignment: Alignment.topCenter,
                child: Image(
                  image: AssetImage(AppImages.ANH_GIF5),
                 // fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
              Text("500.000 vnd")
            ],
          ),
        ),
      ),
    );
  }
}
