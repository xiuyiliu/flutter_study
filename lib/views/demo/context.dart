import 'package:flutter/material.dart';

class ContextPage extends StatefulWidget {
  @override
  _ContextPageState createState() => _ContextPageState();
}

class _ContextPageState extends State<ContextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('context explore'),
      ),
      body: Container(
        width: 100.0,
        height: 100.0,
        decoration: BoxDecoration(
          color: Colors.pink
        ),
        child: Builder(
          builder: (BuildContext context) {
            return Column(
              children: <Widget>[
                InkWell(
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                        color: Colors.greenAccent
                    ),
                    child: Text('context'),
                  ),
//                  child: Text('context'),
                  onTap: () {
//                    print(context.widget); // Builder
//                    print(context.size); // Size(100.0,100.0)
//                    print(context.ancestorInheritedElementForWidgetOfExactType(Container).widget);
                    print(context.ancestorWidgetOfExactType(Container));
                  },
                )
              ],
            );
          },
        ),
      ),
      floatingActionButton: FlatButton(
        child: Text('context'),
        onPressed: () {
//          print(context.size);
//          print(context.widget);
          debugDumpRenderTree();
        },
      ),
    );
  }
}

/*
* BuildContext 抽象类 是操作widget所对应的element的接口
*
* 除了单个同步函数之外，不因该缓存该类中方法的返回值,因为当widget在树中移动时，对应当context可以随时更改位置
*
*
*
**/