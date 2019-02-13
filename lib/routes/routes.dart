import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_study/routes/route_handlers.dart';

class Routes {
  static String root = '/';
  static String order = '/order';
  /// demo
  static String frostedGlass = '/frosted-glass';

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        print("ROUTE WAS NOT FOUND !!!");
      });

    router.define(root, handler: rootHandler);
    router.define(order, handler: orderHandler);
    router.define(frostedGlass, handler: frostedGlassHandler);
  }
}

