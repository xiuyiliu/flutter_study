import 'package:flutter/material.dart';

class WidgetStudyPage extends StatefulWidget {
  @override
  _WidgetStudyPageState createState() => _WidgetStudyPageState();
}

class _WidgetStudyPageState extends State<WidgetStudyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('widget study'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            width: 100.0,
            height: 100.0,
            margin: EdgeInsets.all(20.0),
//          color: Color(0xfff1f1f1),
            decoration: BoxDecoration(
                color: Color(0xffffffff),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffff0000),
                    blurRadius: 5.0,
                  ),
                ]
            ),
          ),
          Container(
            width: 100.0,
            height: 100.0,
            margin: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
                color: Color(0xffffffff),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffff0000),
                    spreadRadius: 5.0,
                  ),
                ]
            ),
          ),
          Container(
            width: 100.0,
            height: 100.0,
            margin: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              boxShadow: [
                BoxShadow(
                  color: Color(0xffff0000),
                  spreadRadius: 5.0,
                  offset: Offset(1.0, 3.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

