import 'package:flutter/material.dart';

import 'package:flutter_study/widgets/toast.dart';
import 'package:flutter_study/routes/application.dart';
import 'package:flutter_study/routes/routes.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {

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
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Home'),
        centerTitle: true,
      ),
      body: new SafeArea(
        top: true,
        child: new WillPopScope(
          onWillPop: _onWillPop,
          child: new Center(
            child: new RaisedButton(
              onPressed: () {
//              Application.router.navigateTo(context, '/order');
//              Toast.toast(context: context,msg: '克莱斯勒看');
//                Application.router.navigateTo(context, '/frosted-glass');
//              Application.router.navigateTo(context, '/search-bar');
//              Application.router.navigateTo(context, Routes.dateTimePicker);
              Application.router.navigateTo(context, Routes.videoPlayer);
              },
              child: new Text('navigator'),
            )
          )
        ),
      ),
    );
  }
}
