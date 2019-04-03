import 'package:flutter/material.dart';

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> with AutomaticKeepAliveClientMixin{

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('Categories');
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);//必须
    print('build --------------categories');
    return Container(
        child: new Center(
          child: new Text('Categories'),
        )
    );
  }
}