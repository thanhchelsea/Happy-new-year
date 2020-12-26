import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happy_new_year/localizations.dart';
import 'package:happy_new_year/res/images.dart';
import 'package:happy_new_year/res/resources.dart';
import 'package:happy_new_year/ui/widget/item_app_widget.dart';
import 'package:happy_new_year/ui/widget/widget.dart';
import 'package:happy_new_year/utils/device.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Container(
      color: Colors.red,
      height: DeviceUtil.getDeviceHeight(context),
      width: DeviceUtil.getDeviceWidth(context),
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Image(
              image: AssetImage(AppImages.ANH_NEN),
              fit: BoxFit.cover,
              height: DeviceUtil.getDeviceHeight(context),
              width: DeviceUtil.getDeviceWidth(context),
              alignment: Alignment.center,
            ),
            Positioned(
              bottom: 0.07 * DeviceUtil.getDeviceHeight(context),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 16),
                          child: Text(
                            Language.of(context).getText("home.chuc_tet"),
                            style: AppTheme.headline,
                          ),
                        ),
                        Container(
                          height: DeviceUtil.getDeviceHeight(context) / 5,
                          width: DeviceUtil.getDeviceWidth(context),
                          child: ListView(
                            padding: EdgeInsets.only(top: 0),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              Container(
                                  alignment: Alignment.center,
                                  child: ItemApp(AppImages.ICON_THIEP_TET,
                                      "home.tao_thiep")),
                              Container(
                                  alignment: Alignment.center,
                                  child: ItemApp(AppImages.ICON_THIEP,
                                      "home.loi_chuc_tet")),
                              Container(
                                  alignment: Alignment.center,
                                  child: ItemApp(
                                      AppImages.ICON_THU_VIEN_THIEP_TET,
                                      "home.danh_sach_anh_thiep")),
                              Container(
                                  alignment: Alignment.center,
                                  child: ItemApp(AppImages.ICON_CAM_NANG,
                                      "home.van_khan_tet")),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(top: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 8, bottom: 20),
                          child: Text(
                            Language.of(context).getText("home.ngay_tet"),
                            style: AppTheme.headline,
                          ),
                        ),
                        Container(
                          // padding: EdgeInsets.only(right: 16),
                          width: DeviceUtil.getDeviceWidth(context),
                          height: DeviceUtil.getDeviceHeight(context) / 5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ItemAppNgayTet(),
                              ItemAppNgayTet(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
