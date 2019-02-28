import 'package:flutter/material.dart';

class CustomDivide extends StatelessWidget {

  CustomDivide({Key key, this.height = 5.0,this.color = 0xfff5f5f5}):super(key:key);

  double height;
  int color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Color(color)
      ),
    );
  }
}

