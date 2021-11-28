import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:happy_new_year/constants.dart';
import 'package:happy_new_year/data/model/model.dart';
import 'package:happy_new_year/localizations.dart';
import 'package:happy_new_year/res/resources.dart';
import 'package:happy_new_year/routes.dart';
import 'package:happy_new_year/ui/widget/widget.dart';
import 'package:happy_new_year/utils/utils.dart';

class CamNangScreen extends StatelessWidget {
  Widget ItemCamNang(BuildContext context, GroupModel group) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.cam_nang_detail, arguments: group);
      },
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
            child: Image(
              image: AssetImage(AppImages.ANH_NEN7),
              fit: BoxFit.cover,
              width: DeviceUtil.getDeviceWidth(context) / 2 - 40,
              height: DeviceUtil.getDeviceHeight(context) / 9,
              alignment: Alignment.center,
            ),
          ),
          Container(
            padding: EdgeInsets.all(4.0),
            width: DeviceUtil.getDeviceWidth(context) / 2 - 40,
            alignment: Alignment.center,
            child: AutoSizeText(
              Language.of(context).getText('cam_nang.${group.title}'),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                //letterSpacing: 0.18,
                color: AppTheme.nearlyYellow,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final double itemHeight = (DeviceUtil.getDeviceHeight(context)) / 2;
    // final double itemWidth = DeviceUtil.getDeviceWidth(context) / 1.7;
    return BaseScreen(
      title: 'cam_nang.title',
      iconBack: true,
      body: Container(
        height: DeviceUtil.getDeviceHeight(context),
        width: DeviceUtil.getDeviceWidth(context),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image(
              image: AssetImage(AppImages.BACKGROUND_LOICHUC),
              fit: BoxFit.fill,
              height: DeviceUtil.getDeviceHeight(context),
              width: DeviceUtil.getDeviceWidth(context),
              alignment: Alignment.center,
            ),
            Center(
              child: GridView.builder(
                itemCount: Constants.camNangGroups.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2,
                ),
                itemBuilder: (context, index) {
                  return ItemCamNang(context, Constants.camNangGroups[index]);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
