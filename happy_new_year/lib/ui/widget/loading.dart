import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
class LoadingApp{
  static Widget loading1(){
    return SpinKitThreeBounce(
      size: 22,
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index.isEven ? Colors.red : Colors.green,
          ),
        );
      },
    );
}
}