import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:happy_new_year/localizations.dart';
import 'package:happy_new_year/res/colors.dart';
import 'package:happy_new_year/res/images.dart';
import 'package:happy_new_year/utils/device.dart';
import 'package:path/path.dart';

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
      child: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.only(left: 8, right: 8),
        decoration: ShapeDecoration(
          shadows: [
            BoxShadow(
              offset: const Offset(3.0, 3.0),
              blurRadius: 3.0,
              spreadRadius: 1.0,
            ),
          ],
          color: AppTheme.nearlyYellow,
          shape: PolygonBorder(
            sides: 8,
            borderRadius: 8.0,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: CircleAvatar(
                backgroundImage: AssetImage(image),
                radius: 30,
              
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              flex: 2,
              child: Text(
                Language.of(context).getText(title),
                textAlign: TextAlign.center,
                style:TextStyle(
                  color: AppTheme.nealyRed,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
      // child: Card(
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(40.0),
      //   ),
      //   child: Container(
      //     decoration: BoxDecoration(
      //       borderRadius: BorderRadius.circular(16),
      //       image: DecorationImage(
      //         fit: BoxFit.cover,
      //         image: AssetImage(image),
      //       ),
      //     ),
      //     alignment: Alignment.center,
      //     // margin: EdgeInsets.only(left: 10),
      //     child: Text(
      //       Language.of(context).getText(title),
      //       style: AppTheme.title,
      //     ),
      //   ),
      // ),
    );
  }
}
