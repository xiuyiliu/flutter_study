import 'package:flutter/material.dart';
import 'package:flutter_study/routes/application.dart';

//class AnimationDemo extends StatefulWidget {
//
//  @override
//  _AnimationDemo createState() => new _AnimationDemo();
//}
//
//class _AnimationDemo extends State<AnimationDemo> with TickerProviderStateMixin {
//  AnimationController controller;
//  CurvedAnimation curve;
//
//  @override
//  void initState() {
//    controller = new AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
//    curve = new CurvedAnimation(parent: controller, curve: Curves.easeIn);
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text('Animation'),
//      ),
//      body: new Center(
//          child: new Container(
//              child: new FadeTransition(
//                  opacity: curve,
//                  child: new FlutterLogo(
//                    size: 100.0,
//                  )))),
//      floatingActionButton: new FloatingActionButton(
//        tooltip: 'Fade',
//        child: new Icon(Icons.brush),
//        onPressed: () {
//          controller.forward();
//        },
//      ),
//    );
//  }
//}



class AnimationDemo extends StatefulWidget {
  @override
  _AnimationDemoState createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo> with TickerProviderStateMixin{
  AnimationController controller;
  CurvedAnimation curve;

  Map<String,int> info = {
    "age": 12,
    "score": 60
  };
  
  Map<String,int> addMap = {
    "height": 180
  };

  List<int> list = [3,2,1,4];
  List<int> list2 = [5,6,7,8];

  MapEntry updateInfo(String k,int v) {
    MapEntry entry;
    entry = new MapEntry("new_" + k, v-5);
    return entry;
  }

  Map newInfo;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new AnimationController(duration: const Duration(milliseconds: 2000),vsync: this);
    curve = new CurvedAnimation(parent: controller, curve: Curves.easeIn);

    var temp = list.reduce((pre,curr) => pre + curr);
    print(temp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Animation'),
      ),
      body: new Center(
        child: FadeTransition(
          opacity: curve,
          child: new FlutterLogo(
            size: 100.0,
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: (){
//          controller.forward();
          Application.router.navigateTo(context, '/application');
        },
        child: new Icon(Icons.brush),
      ),
    );
  }
}
