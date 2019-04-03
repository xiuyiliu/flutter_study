import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage>{



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('account');
  }
  @override
  Widget build(BuildContext context) {
    print('build--------------account');
    return Container(
      child: new Center(
        child: new Text('account'),
      )
    );
  }
}

