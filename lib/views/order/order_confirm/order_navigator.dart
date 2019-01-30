import 'package:flutter/material.dart';
import 'package:flutter_study/styles/index.dart';

/// 页面项目导航栏
class OrderNavigator extends StatelessWidget {

  OrderNavigator({
    Key key,
    @required this.icon,
    @required this.title
  }) : super(key:key);

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.color_eee)
        )
      ),
      child: new Row(
        children: <Widget>[
          new Icon(icon,color: AppColors.color_ddd,),
          new Container(width: 10.0,),
          new Text(title,style: TextStyle(color: AppColors.color_333,fontSize: 16.0),)
        ],
      ),
    );
  }
}