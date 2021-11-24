import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happy_new_year/localizations.dart';
import 'package:happy_new_year/res/colors.dart';
import 'package:happy_new_year/res/images.dart';
import 'package:happy_new_year/utils/device.dart';

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
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(image),
            ),
          ),
          alignment: Alignment.center,
          // margin: EdgeInsets.only(left: 10),
          child: Text(
            Language.of(context).getText(title),
            style: AppTheme.title,
          ),
        ),
      ),
    );
  }
}
