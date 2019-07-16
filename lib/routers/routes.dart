import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/routers/route_handlers.dart';

class Routes {

  static String layoutDebug = '/layout-debug';
  static String dateTimePicker = '/date-time-picker';
  static String contextExplore = '/context-explore';
  static String stateExplore = '/state-explore';
  static String customStepper = '/custom-stepper';
  static String widgetStudy = '/widget-study';


  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        print("ROUTE WAS NOT FOUND !!!");
      });

    router.define(layoutDebug, handler: layoutDebugHandler);
    router.define(dateTimePicker, handler: dateTimePickerHandler);
    router.define(contextExplore, handler: contextExploreHandler);
    router.define(stateExplore, handler: stateExploreHandler);
    router.define(customStepper, handler: customStepperHandler);
    router.define(widgetStudy, handler: widgetStudyHandler);
  }
}

