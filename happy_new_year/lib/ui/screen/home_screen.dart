import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_new_year/blocs/blocs.dart';
import 'package:happy_new_year/res/images.dart';
import 'package:happy_new_year/res/resources.dart';
import 'package:happy_new_year/routes.dart';
import 'package:happy_new_year/ui/widget/item_app_widget.dart';
import 'package:happy_new_year/ui/widget/widget.dart';
import 'package:happy_new_year/utils/device.dart';

import '../../localizations.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

String imageBackground = "";

class _HomeScreenState extends State<HomeScreen> {
  void initState() {
    super.initState();
    // final random = new Random(); //7  9 8
    // int i = random.nextInt(11);
    // if (i != 7 &&
    //     i != 8 &&
    //     i != 9 &&
    //     i != 10 &&
    //     i != 2 &&
    //     i != 0 &&
    //     i != 4 &&
    //     i != 6) {
    //   imageBackground = "assets/images/anhnen${i}.jpg";
    // } else
    imageBackground = "assets/images/anhnen3.jpg";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: DeviceUtil.getDeviceHeight(context),
      width: DeviceUtil.getDeviceWidth(context),
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Image(
              image: AssetImage(imageBackground),
              fit: BoxFit.cover,
              height: DeviceUtil.getDeviceHeight(context),
              width: DeviceUtil.getDeviceWidth(context),
              alignment: Alignment.center,
            ),
            Container(
              //   color: Colors.blue,
              child: Image(
                image: AssetImage(AppImages.ANH_NEN12),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 100),
              alignment: Alignment.topLeft,
              width: 300,
              height: 0.7 * DeviceUtil.getDeviceHeight(context),
              child: Image(
                width: 100,
                height: 100,
                image: AssetImage(AppImages.ANH_GIF3),
                // fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
            Container(
              // color:Colors.yellow,
              alignment: Alignment.topRight,
              width: DeviceUtil.getDeviceWidth(context),
              height: 0.7 * DeviceUtil.getDeviceHeight(context),
              child: Image(
                width: 100,
                height: 100,
                image: AssetImage(AppImages.ANH_GIF2),
                // fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
            Container(
              // color:Colors.blue,
              alignment: Alignment.center,
              width: DeviceUtil.getDeviceWidth(context),
              height: 0.45 * DeviceUtil.getDeviceHeight(context),
              child: Image(
                width: 100,
                height: 100,
                image: AssetImage(AppImages.ANH_GIF1),
                // fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
            Positioned(
              bottom: 0.07 * DeviceUtil.getDeviceHeight(context),
              child: Column(
                children: <Widget>[
                  Countdown(),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(top: 20),
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
                                child: ItemApp(
                                  AppImages.ICON_THIEP_TET,
                                  "home.tao_thiep",
                                  method: () {
                                    BlocProvider.of<TaoThiepBloc>(context).add(ChangeText(""));
                                    Navigator.pushNamed(
                                      context,
                                      Routes.taothiep,
                                    );
                                  },
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: ItemApp(
                                  AppImages.ICON_THIEP,
                                  "home.loi_chuc_tet",
                                  method: () {
                                    Navigator.pushNamed(
                                      context,
                                      Routes.loichuc,
                                    );
                                  },
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: ItemApp(
                                  AppImages.ICON_THO_CUNG,
                                  "home.van_khan_tet",
                                  method: () {
                                    Navigator.pushNamed(
                                      context,
                                      Routes.van_khan_screen,
                                    );
                                  },
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: ItemApp(
                                  AppImages.ICON_SMS,
                                  "home.sms_teen",
                                  method: () {
                                    Navigator.pushNamed(
                                      context,
                                      Routes.sms,
                                    );
                                  },
                                ),
                              ),
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
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          width: DeviceUtil.getDeviceWidth(context),
                          height: DeviceUtil.getDeviceHeight(context) / 5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: ItemAppNgayTet("home.cam_nang_tet", AppImages.ICON_TET, () {
                                  Navigator.pushNamed(
                                    context,
                                    Routes.cam_nang,
                                  );
                                }),
                              ),
                              // SizedBox(width: 16),
                              Expanded(
                                child: ItemAppNgayTet(
                                  "home.li_xi",
                                  AppImages.ICON_GIADINH_LIXI,
                                  () {
                                    Navigator.pushNamed(
                                      context,
                                      Routes.lixi,
                                    );
                                  },
                                ),
                              ),
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
