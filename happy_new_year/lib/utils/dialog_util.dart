import 'package:flutter/material.dart';
import 'package:happy_new_year/ui/widget/widget.dart';

class DialogUtil {
  static void showSaveEdit(
      {BuildContext context, bool isShowSaveImage, int index}) {
    showDialog<dynamic>(
      context: context,
      builder: (BuildContext context) => DialogConfirmText(
        barrierDismissible: true,
        isShowSaveImage: isShowSaveImage,
        isTaoThiepScreen: false,
        index: index,
      ),
    );
  }
}
