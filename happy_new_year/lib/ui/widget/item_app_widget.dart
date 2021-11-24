import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happy_new_year/localizations.dart';
import 'package:happy_new_year/res/resources.dart';
import 'package:flutter_polygon/flutter_polygon.dart';

class ItemApp extends StatelessWidget {
  String imageIcon;
  String title;
  Function method;
  ItemApp(this.imageIcon, this.title, {this.method});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        method();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8),
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
                sides: 6,
                borderRadius: 8.0,
               // border: BorderSide(color: AppTheme.nealyRed, width: 3),
              ),
            ),
            child: Image(
              image: AssetImage(imageIcon),
              width: 65,
              height: 65,
            ),
          ),
          Container(
            width: 80,
            alignment: Alignment.center,
            child: Text(
              Language.of(context).getText(title),
              style: AppTheme.subtitle,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
