import 'package:flutter/material.dart';
/// 知识点：
///
/// 1,Overlay
/// 创建一个overlay,通过加入overlay的堆栈，可以让一个独立的widget浮在另一个widget上
/// 2,OverlayState
/// 通过Overlay.of(context)来获取，其insert(OverlayEntry),insertAll(OverlayEntry),_remove(OverlayEntry)
/// 可以向overlay的堆栈中添加移除OverlayEntry
/// 3,OverlayEntry
/// 一个Overlay的条目，就是浮在上面的widget的具体内容，通过OverlayState.insert(OverlayEntry)来加入到堆栈中
/// 通过调用自身的remove将其从堆栈中移除，其markNeedsBuild方法下一个管道刷新期间重建，如果[builder]的输出已更改，则需要调用此函数
/// 4,AnimatedOpacity 透明度的动画widget
/// AnimatedOpacity(opacity,curve,duration)
/// 5,DateTime对象的difference方法，返回两个时间点的duration,
/// 6,Duration对象的inMilliseconds,返回此duration的整毫秒数

/// 轻提示
class Toast {
  /// 通过此对象定义显示在overlay上的内容
  static OverlayEntry _overlayEntry;
  ///toast是否正在showing
  static bool _showing = false;
  ///开启一个新toast的当前时间，用于对比是否已经展示了足够时间
  static DateTime _startTime;
  /// toast的内容
  static String _msg;

  static void toast({BuildContext context, String msg, int milliseconds = 2000,double position = 1/2,double margin = 15.0}) async {
    assert(msg != null);
    /// 获取OverlayState,用于向堆栈中添加OverlayEntry
    OverlayState overlayState = Overlay.of(context);
    _msg = msg;
    _startTime = DateTime.now();
    /// 此处的if判断是为了防止如果已经显示，重复绘制
    if (_overlayEntry == null && !_showing) {
      _showing = true;
      _overlayEntry = OverlayEntry(
        builder: (BuildContext context) => Positioned(
          ///top值，可以改变这个值来改变toast在屏幕中的位置
          top: MediaQuery.of(context).size.height * position,
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            child: Container(
              ///horizontal 距离两侧边框的距离
              padding: EdgeInsets.symmetric(horizontal: margin),
              child: AnimatedOpacity(
                opacity: _showing ? 0.7 : 0.0, //目标透明度
                duration: _showing
                  ? Duration(milliseconds: 100)
                  : Duration(milliseconds: 400),
                child: _buildToastWidget(),
              ),
            )
          ),
        )
      );
      /// 将其加入到堆栈
      overlayState.insert(_overlayEntry);
    } else {
      /// 重绘
      _overlayEntry.markNeedsBuild();
    }
    
    /// 等待两秒，两秒后消失
    await Future.delayed(Duration(milliseconds: milliseconds));
    if (DateTime.now().difference(_startTime).inMilliseconds >= milliseconds) {
      _showing = false;
//      _overlayEntry.markNeedsBuild();
      _overlayEntry.remove();
      _overlayEntry = null;
    }
  }

  //toast绘制
  static _buildToastWidget() {
    return new Container(
      child: Card(
        color: Colors.black87,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Text(
            _msg,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}