import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happy_new_year/localizations.dart';
import 'package:happy_new_year/res/colors.dart';
import 'package:happy_new_year/res/images.dart';
import 'package:happy_new_year/utils/device.dart';

class BaseScreen extends StatelessWidget {
  final String title;
  final bool iconMoreMenu;
  final bool iconBack;
  final Widget body;
  final Widget iconMenu;
  final Function menuMethod;
  BaseScreen(
      {this.title,
      this.iconMoreMenu,
      this.iconBack,
      this.body,
      this.iconMenu,
      this.menuMethod});

  Widget getAppBarUI(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.APP_BAR),
          fit: BoxFit.fitWidth,
        ),
        color: AppTheme.nearlyYellow,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            offset: const Offset(0, 2),
            blurRadius: 8.0,
          ),
        ],
      ),
      child: Container(
        child: Padding(
          padding: EdgeInsets.only(
            // top: MediaQuery.of(context).padding.top,
            left: 8,
            right: 8,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                width: DeviceUtil.getDeviceWidth(context),
                alignment: Alignment.centerLeft,
                height: 70,
                child: Container(
                  color: Colors.transparent,
                  child: iconBack != null && iconBack
                      ? IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: AppTheme.nearlyYellow,
                            size: 30,
                          ),
                        )
                      : Container(),
                ),
              ),
              Container(
                width: DeviceUtil.getDeviceWidth(context),
                alignment: Alignment.center,
                child: Text(
                  Language.of(context).getText(title),
                  style: AppTheme.headline,
                  maxLines: 1,
                ),
              ),
              Container(
                width: DeviceUtil.getDeviceWidth(context),
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    iconMenu != null
                        ? Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(32.0),
                              ),
                              onTap: () {
                                menuMethod();
                              },
                              child: Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: AppTheme.nearlyYellow,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                child: iconMenu,
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          getAppBarUI(context),
          Expanded(
            child: body != null ? body : Container(),
          ),
        ],
      ),
    );
  }
}
