import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import 'package:flutter_study/views/test/index.dart';
import 'package:flutter_study/views/order/order_confirm/index.dart';
import 'package:flutter_study/views/commodity_detail/index.dart';
import 'package:flutter_study/views/demo/frosted_glass.dart';
import 'package:flutter_study/views/demo/search_bar.dart';
import 'package:flutter_study/views/demo/datetime_picker.dart';
import 'package:flutter_study/views/demo/video_player.dart';
import 'package:flutter_study/views/demo/language_select.dart';
import 'package:flutter_study/views/demo/device_info.dart';
import 'package:flutter_study/views/demo/animation.dart';
import 'package:flutter_study/views/app.dart';
import 'package:flutter_study/views/demo/InitializationPage.dart';
import 'package:flutter_study/views/demo/pull_to_refresh.dart';
import 'package:flutter_study/views/demo/layout_debug.dart';
import 'package:flutter_study/views/demo/tab_bar.dart';


Handler rootHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new Test();
  });
Handler orderHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return new Order();
    });
Handler frostedGlassHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return new FrostedGlass();
    });
Handler searchBarHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return new SearchBarDemo();
    });
Handler commodityDetailHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return new CommodityDetail();
    });
Handler dateTimePickerHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return new DateTimePickerDemo();
    });
Handler videoPlayerHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return new VideoPlayerDemo();
    });
Handler languageSelectHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return new LanguageSelectDemo();
    });
Handler deviceInfoHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return new DeviceInfoDemo();
    });
Handler animationHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return new AnimationDemo();
    });
Handler applicationHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return new MyApp();
    });
Handler initializationPageHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String ,List<String>> params) {
    return new InitializationPage();
  });
Handler pullAndRefreshHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String ,List<String>> params) {
      return new PullAndRefreshDemo();
    });
Handler layoutDebugHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String ,List<String>> params) {
      return new LayoutDebug();
    });
Handler tabbarHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String ,List<String>> params) {
      return new TabsDemo();
    });