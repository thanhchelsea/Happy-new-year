import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happy_new_year/localizations.dart';
import 'package:happy_new_year/res/colors.dart';
import 'package:happy_new_year/res/images.dart';
import 'package:happy_new_year/ui/widget/base_screen_widget.dart';
import 'package:happy_new_year/utils/device.dart';

class TaoThiepScreen extends StatefulWidget {
  @override
  _TaoThiepScreenState createState() => _TaoThiepScreenState();
}

class _TaoThiepScreenState extends State<TaoThiepScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      iconBack: true,
      title: "home.tao_thiep",
      body: BodyThiep(),
    );
  }
}

class BodyThiep extends StatefulWidget {
  @override
  _BodyThiepState createState() => _BodyThiepState();
}

class _BodyThiepState extends State<BodyThiep> {
  bool isShowSelection=false;
  Widget item(String title, IconData icon){
    return InkWell(
      onTap: (){
        setState(() {
          isShowSelection=!isShowSelection;
        });
      },
      child: Container(
        margin: EdgeInsets.only(top:5,bottom: 5,left: 12,right: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: Icon(
                icon,
                color: AppTheme.nealyRed,
                size: 24,
              ),
            ),
            Container(
              child: Text(Language.of(context).getText(title),style: AppTheme.caption,),
            ),

          ],
        ),
      ),
    );
  }

  Widget ItemSelect(){
    return Container(
      width: DeviceUtil.getDeviceWidth(context),
      padding: EdgeInsets.all(20),
      //  height: 50,
      color: Colors.white.withOpacity(0.6),
      child: Text("fdfdfd"),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nealyRed,
      width: DeviceUtil.getDeviceWidth(context),
      height: DeviceUtil.getDeviceHeight(context)-70,
      child: Container(
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 20,bottom: 20),
              alignment: Alignment.center,
              // color: Colors.redAccent,
              // width: DeviceUtil.getDeviceWidth(context),
              height: (7/8) * DeviceUtil.getDeviceHeight(context)-70,
              //margin: EdgeInsets.all(20),
              child: Image(
                image: AssetImage(AppImages.THIEP1),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                     isShowSelection ? ItemSelect():Container(),
                      Container(
                        alignment: Alignment.center,
                        color: AppTheme.white,
                        width: DeviceUtil.getDeviceWidth(context),
                        height:(1/8)* DeviceUtil.getDeviceHeight(context),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              item("tao_thiep.loi_chuc", Icons.title),
                              item("tao_thiep.doi_phong_nen", Icons.aspect_ratio),
                              item("tao_thiep.font_chuc", Icons.format_italic),
                              item("tao_thiep.thu_vien_loi_chuc", Icons.receipt),
                              item("tao_thiep.chia_se", Icons.share),
                              item("tao_thiep.luu", Icons.save_alt),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}
