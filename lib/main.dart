import 'package:flutter/material.dart';
import 'package:flutter_study/views/app.dart';
import 'dart:io' show Platform;
import 'package:flutter/services.dart' show SystemUiOverlayStyle,SystemChrome;

void main() {
  runApp(MyApp());

  /// 以下两行 设置android状态栏为透明的沉浸。
  /// 写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}