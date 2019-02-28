
import 'package:flutter/material.dart';
import 'package:flutter_study/utils/index.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

/// chewie 在video_player基础上做了UI层面的封装，因此，chewie依赖于video_player,
/// 并且要求video_player的版本在0.7以上

class VideoPlayerDemo extends StatefulWidget {
  @override
  _VideoPlayerDemoState createState() => _VideoPlayerDemoState();
}

class _VideoPlayerDemoState extends State<VideoPlayerDemo> {

  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network( 'http://www.w3school.com.cn/example/html5/mov_bbb.mp4');
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: false,
      autoInitialize: true,
    );
  }

  /// 该生命周期函数在dispose之前调用，在重新进入到该页面时也会调用
  /// 这里的目的是防止离开了本页面，视频还在播放的情况发生
  @override
  void deactivate() {
    super.deactivate();
    _videoPlayerController.pause();
  }

  /// 组件销毁时调用，移除监听，清理环境
  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
    _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: new Text('脸色立刻付款'),
            expandedHeight: 200.0,
            pinned: true, /// AppBar固定在顶部
            floating: false, /// 是否随着滑动隐藏标题
            snap: false, /// 与floating 保持一致
            flexibleSpace: FlexibleSpaceBar(
              background: Chewie(
                controller: _chewieController,
              )
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              new Container(
                height: 1000.0,
                decoration: BoxDecoration(
                  color: Colors.orange,
                ),
              )
            ]),
          )
        ],
      )
    );
  }
}
