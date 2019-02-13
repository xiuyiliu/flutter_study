import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import 'package:flutter_study/views/test/index.dart';
import 'package:flutter_study/views/order/order_confirm/index.dart';
import 'package:flutter_study/views/demo/frosted_glass.dart';

var rootHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new Test();
  });
var orderHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return new Order();
    });
var frostedGlassHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return new FrostedGlass();
    });