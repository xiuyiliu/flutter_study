import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:flutter_study/widgets/toast.dart';
import 'package:flutter_study/routes/application.dart';
import 'package:flutter_study/routes/routes.dart';
import 'package:flutter_study/language/translation.dart';

/// 按钮
class ButtonItem {
  ButtonItem({this.routePath,this.text});
  final String routePath;
  final String text;
}
/// 按钮路径及文本列表数据
List<Map<String,String>> buttonListData = [
  {"text": "订单", "path": "/order"},
  {"text": "毛玻璃", "path": "/frosted-glass"},
  {"text": "搜索框", "path": "/search-bar"},
  {"text": "日期选择", "path": "/datetime-picker"},
  {"text": "视频组件", "path": "/video-player"},
  {"text": "国际化", "path": "/language-selcet"},
  {"text": "获取设备信息", "path": "/device-info"},
  {"text": "动画", "path": "/animation"},
  {"text": "事件状态BloC", "path": "/initialization-page"},
  {"text": "pull-and-refresh", "path": "/pull-and-refresh"},
  {"text": "布局调试", "path":"/layout-debug"},
  {"text": "tabbar", "path":"/tab-bar"}
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
    print('Home');
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);//必须
    print('build-----------home');
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
            children: buttonList.map((item) => CustomRaisedButton(text: item.text,routePath: item.routePath,)).toList()
          )
        ),
      ),
      floatingActionButton: FlatButton(
        child: new Text('调试'),
        onPressed: () {
          debugDumpRenderTree();
        },
      )
    );
  }
}


class CustomRaisedButton extends StatelessWidget{

  CustomRaisedButton({Key key,this.routePath,this.text}):super(key:key);
  final String routePath;
  final String text;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
      onPressed: () {
        Application.router.navigateTo(context, this.routePath);
      },
      child: new Text(this.text),
    );
  }
}
