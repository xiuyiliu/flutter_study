import 'package:flutter/material.dart';
import 'dart:async' show Future;

import 'package:flutter_study/routers/index.dart';

/// 按钮
class ButtonItem {
  ButtonItem({this.routePath,this.text});
  final String routePath;
  final String text;
}
/// 按钮路径及文本列表数据
List<Map<String,String>> buttonListData = [
  {"text": "调试", "path":"/layout-debug"},
  {"text": "时间选择器", "path":"/date-time-picker"},
  {"text": "context探索", "path":"/context-explore"},
  {"text": "state探索", "path":"/state-explore"},
  {"text": "custom-stepper", "path":"/custom-stepper"},
  {"text": "widget-study", "path":"/widget-study"},
];
/// 按钮路径及文本列表
List<ButtonItem> buttonList = buttonListData.map((item) => ButtonItem(routePath: item['path'],text: item['text'])).toList();

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin{


  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  int lastTap = 0;

  Future<bool> _onWillPop() {
    int nowTap = DateTime.now().millisecond;
    if (nowTap - lastTap > 800) {
      lastTap = DateTime.now().millisecond;
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Home'),
        centerTitle: true,
      ),
      body: new SafeArea(
        top: true,
        child: new WillPopScope(
          onWillPop: _onWillPop,
          child: new Wrap(
            spacing: 15.0,
            runSpacing: 15.0,
            children: buttonList.map((item) => RaisedButton(
              child: Text(item.text),
              onPressed: () {
                ApplicationRouter.router.navigateTo(context, item.routePath);
              },
            )).toList()
          )
        ),
      ),
    );
  }
}

