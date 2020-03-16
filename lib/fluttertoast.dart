import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum ToastLength { LENGTH_SHORT, LENGTH_LONG }

class FlutterToast {
  static const MethodChannel _channel =
      const MethodChannel('bksapps/fluttertoast');

  static Future<bool> showToast({
    @required String message,
    ToastLength toastLength,
    int timeInSecForIos = 1,
  }) async {
    String toastDuration = "short";
    if (toastLength == ToastLength.LENGTH_LONG) {
      toastDuration = "long";
    }

    final Map<String, dynamic> params = <String, dynamic>{
      'message': message,
      'duration': toastDuration,
      'time': timeInSecForIos,
    };

    bool res = await _channel.invokeMethod('showToast', params);
    return res;
  }
}

