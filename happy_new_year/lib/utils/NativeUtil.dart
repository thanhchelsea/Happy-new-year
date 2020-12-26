import 'package:flutter/services.dart';

class NativeUtil {
  static const platform = const MethodChannel('com.vnpt.vnptKiot');

  static void openFaceTracking(String title) async {
    await platform.invokeMethod('openFaceTracking', title);
  }

  static void closeFaceTracking() async {
    await platform.invokeMethod('closeFaceTracking');
  }

}
