import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_study/routes/route_handlers.dart';

class Routes {
  static String root = '/';
  static String order = '/order';
  static String commodityDetail = '/commodity-detail';
  /// demo
  static String frostedGlass = '/frosted-glass';
  static String searchBar = '/search-bar';
  static String dateTimePicker = '/datetime-picker';
  static String videoPlayer = '/video-player';
  static String languageSelect = '/language-selcet';
  static String deviceInfo = '/device-info';
  static String animation = '/animation';

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        print("ROUTE WAS NOT FOUND !!!");
      });

    router.define(root, handler: rootHandler);
    router.define(order, handler: orderHandler);
    router.define(frostedGlass, handler: frostedGlassHandler);
    router.define(searchBar, handler: searchBarHandler);
    router.define(commodityDetail, handler: commodityDetailHandler);
    router.define(dateTimePicker, handler: dateTimePickerHandler);
    router.define(videoPlayer, handler: videoPlayerHandler);
    router.define(languageSelect, handler: languageSelectHandler);
    router.define(deviceInfo, handler: deviceInfoHandler);
    router.define(animation, handler: AnimationHandler);
  }
}

