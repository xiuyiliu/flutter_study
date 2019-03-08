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
var searchBarHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return new SearchBarDemo();
    });
var commodityDetailHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return new CommodityDetail();
    });
var dateTimePickerHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return new DateTimePickerDemo();
    });
var videoPlayerHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return new VideoPlayerDemo();
    });
var languageSelectHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return new LanguageSelectDemo();
    });
var deviceInfoHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return new DeviceInfoDemo();
    });
var AnimationHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return new AnimationDemo();
    });