import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:happy_new_year/localizations.dart';
import 'package:happy_new_year/res/resources.dart';
import 'package:happy_new_year/routes.dart';
import 'package:happy_new_year/ui/widget/widget.dart';
import 'package:happy_new_year/utils/ultils.dart';

class LoiChucScreen extends StatelessWidget {
  Widget ItemLoiChuc(BuildContext context, String title) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.loi_chuc_detail, arguments: title);
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
              Language.of(context).getText('loi_chuc.$title'),
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

  List<String> listTitle = [
    'tao_loi_chuc',
    'tin_nhan_hinh',
    'tho_chuc_tet',
    "chuc_tet_ong_ba",
    "chuc_tet_bo_me",
    "chuc_tet_co_di_chu_bac",
    "chuc_tet_thay_co",
    "chuc_tet_vo_chong",
    "chuc_tet_sep",
  ] ;

  @override
  Widget build(BuildContext context) {
    final double itemHeight = (DeviceUtil.getDeviceHeight(context)) / 2;
    final double itemWidth = DeviceUtil.getDeviceWidth(context) / 1.7;
    return BaseScreen(
      title: 'loi_chuc.title',
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
                itemCount: listTitle.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2,
                ),
                itemBuilder: (context, index) {
                  return ItemLoiChuc(context, listTitle[index]);
                },
              ),
            )
          ],
        ),
      )
    );
  }
}
