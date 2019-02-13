import 'package:flutter/material.dart';

import 'package:flutter_study/widgets/toast.dart';
import 'package:flutter_study/routes/application.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('Home');
  }
  @override
  Widget build(BuildContext context) {
//    RefreshIndicator();
    return Container(
        child: new Center(
          child: new RaisedButton(
            onPressed: () {
//              Application.router.navigateTo(context, '/order');
//              Toast.toast(context: context,msg: '克莱斯勒看');
              Application.router.navigateTo(context, '/frosted-glass');
            },
            child: new Text('navigator'),
          )

        )
    );
  }
}
