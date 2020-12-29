import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happy_new_year/localizations.dart';
import 'package:happy_new_year/res/resources.dart';
import 'package:polygon_clipper/polygon_border.dart';

class ItemApp extends StatelessWidget {
  String imageIcon;
  String title;
  ItemApp(this.imageIcon, this.title);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.only(left: 8, right: 8),
            decoration: ShapeDecoration(
              color: AppTheme.nearlyYellow,
              shape: PolygonBorder(
                sides: 6,
                borderRadius: 8.0,
                border: BorderSide(color: AppTheme.nealyRed, width: 3),
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
              style: AppTheme.subtitle,maxLines: 2,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
