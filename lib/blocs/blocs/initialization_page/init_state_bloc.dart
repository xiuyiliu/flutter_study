import 'package:flutter_study/blocs/bloc_helpers/bloc_event_state.dart';

/// 定义状态流
class AppInitState extends BlocState {

  AppInitState({
    this.isInitialized,
    this.isInitializing: false,
    this.progress: 0,
  });
  /// 所需要的状态
  /// 是否已经加载完成
  final bool isInitialized;
  /// 是否正在加载中
  final bool isInitializing;
  /// 加载进度
  final int progress;

  /// 定义工厂函数
  factory AppInitState.notInitialized() {
    return AppInitState(isInitialized: false);
  }

  factory AppInitState.progressing(int progress) {
    return AppInitState(
      isInitialized: progress == 100,
      isInitializing: true,
      progress: progress
    );
  }

  factory AppInitState.initialized() {
    return AppInitState(
      isInitializing: false,
      progress: 100,
      isInitialized: true
    );
  }
}