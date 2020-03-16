package com.bksapps.fluttertoast;

import android.app.Activity;
import android.content.Context;
import android.widget.Toast;

import androidx.annotation.NonNull;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

public class FluttertoastPlugin implements FlutterPlugin, MethodCallHandler {
  private MethodChannel channel;
  private static Context mContext;


  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getFlutterEngine().getDartExecutor(), "bksapps/fluttertoast");
    mContext = flutterPluginBinding.getApplicationContext();
    channel.setMethodCallHandler(this);
  }

  public static void registerWith(Registrar registrar) {

    final MethodChannel channel = new MethodChannel(registrar.messenger(), "bksapps/fluttertoast");
    channel.setMethodCallHandler(new FluttertoastPlugin());
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("showToast")) {
      String message = call.argument("message").toString();
      String duration = call.argument("duration").toString();

      int length;
      if (duration.equals("long")) {
        length = Toast.LENGTH_LONG;
      } else {
        length = Toast.LENGTH_SHORT;
      }
      Toast.makeText(mContext, message, length).show();

      result.success(true);
    } else {
      result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
}
