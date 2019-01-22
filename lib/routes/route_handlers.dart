import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import 'package:flutter_study/views/home/index.dart';
import 'package:flutter_study/views/test/index.dart';

var rootHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new Test();
  });