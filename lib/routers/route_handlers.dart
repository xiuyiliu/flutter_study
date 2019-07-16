import 'package:flutter/material.dart' show BuildContext;
import 'package:fluro/fluro.dart' show Handler;

import 'package:flutter_study/views/demo/layout_debug.dart';
import 'package:flutter_study/views/demo/date_time_picker.dart';
import 'package:flutter_study/views/demo/context.dart';
import 'package:flutter_study/views/demo/state.dart';
import 'package:flutter_study/views/demo/custom_stepper.dart';
import 'package:flutter_study/views/demo/widget_study.dart';


Handler layoutDebugHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String ,List<String>> params) {
      return new LayoutDebug();
    });
Handler dateTimePickerHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String ,List<String>> params) {
      return new PickerPage();
    });
Handler contextExploreHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String ,List<String>> params) {
      return new ContextPage();
    });
Handler stateExploreHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String ,List<String>> params) {
      return new StatePage();
    });
Handler customStepperHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String ,List<String>> params) {
      return new CustomStepperDemo();
    });
Handler widgetStudyHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String ,List<String>> params) {
      return new WidgetStudyPage();
    });