/**
 * 使用BackdropFilter实现毛玻璃效果，且子部件需要设置Opacity
 * ImageFilter.blur的sigmaX/Y决定了毛玻璃的模糊程度，值越高越模糊
 * 一般来说，为了防止模糊效果绘制出边界，需要使用ClipRect Widget包裹
 */
import 'package:flutter/material.dart';
/// 引入dart:ui 是为了使用ImageFilter
import 'dart:ui';

class FrostedGlass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Frosted Glass Demo'),
        centerTitle: true,
      ),
      body: new Stack(
        children: <Widget>[
          new ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: new FlutterLogo(),
          ),
          new Center(
            child: new ClipRect(
              child: new BackdropFilter(
                /// 决定了模糊程度
                filter: ImageFilter.blur(sigmaX: 10.0,sigmaY: 10.0),
                /// 子组件必须包一层Opacity
                child: Opacity(
                  opacity: 0.5,
                  child: new Container(
                    width: 300.0,
                    height: 300.0,
                    decoration: new BoxDecoration(
                      color: Colors.grey.shade200,
                    ),
                    child: new Center(
                      child: new Text('Frosted Glass'),
                    ),
                  ),
                ),
              ),
            )
          )
        ],
      )
    );
  }
}


