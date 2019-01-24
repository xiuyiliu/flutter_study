import 'package:flutter/material.dart';

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
    return Container(
        child: new Center(
          child: new RaisedButton(
            onPressed: () {
              Application.router.navigateTo(context, '/order');
            },
            child: new Text('navigator'),
          )

        )
    );
  }
}
