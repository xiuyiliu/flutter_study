import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class LayoutDebug extends StatefulWidget {
  @override
  _LayoutDebugState createState() => _LayoutDebugState();
}

class _LayoutDebugState extends State<LayoutDebug> {
  /// switch 状态
  bool _switchSelected = true;
  /// checkbox 状态
  bool _checkboxSelected = true;
  @override
  Widget build(BuildContext context) {
//    debugPaintSizeEnabled = true;
//    debugPaintBaselinesEnabled = true;
//    debugPaintLayerBordersEnabled = true;
//    debugPaintPointersEnabled = true;
//    debugRepaintRainbowEnabled = true;
//    debugRepaintTextRainbowEnabled = true;
//    debugCheckElevationsEnabled = true;
//    debugPrintMarkNeedsLayoutStacks = true;
//    debugPrintMarkNeedsPaintStacks = true;
//    debugPrintStack(label: "====================================================",maxFrames: 2);
    return Scaffold(
      appBar: AppBar(
        title: Text("布局调试"),
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.pinkAccent
        ),
        /// 如果Container不包含子节点，会试图变得足够大，外面包一层UnconstrainedBox，会试图变得足够小
        /// 如果Container包含子节点，会根据子节点尺寸调节自己的尺寸,BoxConstraints可以调节最大，最小宽高；
        child: Column(
          children: <Widget>[
            Expanded(
              child:  ListView.builder(
                shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  itemCount: 10,
                  itemExtent: 50.0,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(title: Text("$index"));
                  }
              ),
            )

//            Expanded(
//              child: ListView.builder(
//                  shrinkWrap: true,
//                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                  itemCount: 100,
//                  itemExtent: 50.0,
//                  itemBuilder: (BuildContext context, int index) {
//                    return ListTile(title: Text("$index"));
//                  }
//              ),
//            )
          ],
          )
      ),
      floatingActionButton: Column(
        children: <Widget>[
          FlatButton(
            child: Text("repaint"),
            onPressed: () {
              debugDumpRenderTree();
            },
          ),
        ],
      ),
      drawer: MyDrawer(),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        // DrawerHeader consumes top MediaQuery padding.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.asset(
                        "imgs/avatar.png",
                        width: 80,
                      ),
                    ),
                  ),
                  Text(
                    "Wendux",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text('Add account'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Manage accounts'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

