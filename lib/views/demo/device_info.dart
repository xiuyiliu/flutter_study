import 'package:flutter/material.dart';
import 'dart:io';
import 'package:device_info/device_info.dart';
import 'package:flutter_study/utils/index.dart';
import 'dart:ui';

class DeviceInfoDemo extends StatefulWidget {
  @override
  _DeviceInfoDemoState createState() => _DeviceInfoDemoState();
}

class _DeviceInfoDemoState extends State<DeviceInfoDemo> {
  String _platForm;
  String _release;

  @override
  void initState(){
    // TODO: implement initState
    /// 引入"dart:ui"后，可以获得设备像素比率，在引入图像资源时，可以引入主资源和变体资源，
    /// 以便用来适配不同设备像素比例的手机，主资源默认1.0x,（在yaml文件中只需要声明主资源即可）在同级目录中创建2.0x和3.0x的目录，
    /// 目录下放入同名但不同像素的图片资源，在构建过程中，会在相邻子目录中查找具有相同名称的文件
    /// 设备像素比1.8会选择2.0x下的图片，2.8的会选择3.0x下的图片
    print(window.devicePixelRatio);
  }
  Future _getDeviceInfo() async{
    if (Platform.isAndroid) {
      DeviceInfoPlugin deviceInfo = new DeviceInfoPlugin();
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      print('deviceinfo');
      setState(() {
        _platForm = androidDeviceInfo.model;
        _release = androidDeviceInfo.version.release;
      });

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Device Info'),
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new RaisedButton(
            child: new Text('获取设备信息'),
            onPressed: _getDeviceInfo
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text('model:'),
              new Padding(padding: const EdgeInsets.only(left: 20.0),),
              new Text(_platForm ?? '')
            ],
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text('release:'),
              new Padding(padding: const EdgeInsets.only(left: 20.0),),
              new Text(_release ?? '')
            ],
          ),
          new Image.asset('assets/images/common/placeholder.png')
        ],
      ),
    );
  }
}
