import 'dart:async' show Stream;
import 'package:flutter_study/blocs/bloc_helpers/bloc_event_state.dart';
import 'package:flutter_study/blocs/blocs/initialization_page/init_event_bloc.dart';
import 'package:flutter_study/blocs/blocs/initialization_page/init_state_bloc.dart';

/// 具体的初始化过程（eventHandler）
class AppInitBloc extends BlocEventStateBase<AppInitEvent, AppInitState> {

  AppInitBloc() : super(initialState: AppInitState.notInitialized());

  /// 定义事件处理器
  @override
  Stream<AppInitState> eventHandler(AppInitEvent event, AppInitState currentState) async* {
    /// 如果初始化没有结束，更新相应状态
    if (!currentState.isInitialized) {
      yield AppInitState.notInitialized();
    }
    /// 如果初始化过程开始，更新相应状态
    if (event.type == AppInitEventType.start) {
      for(int progress = 0; progress < 101; progress += 10) {
        await Future.delayed(const Duration(milliseconds: 300));
        yield AppInitState.progressing(progress);
        if (progress == 100) {
          emitEvent(AppInitEvent(type: AppInitEventType.stop));
        }
      }
    }

    if (event.type == AppInitEventType.stop) {
      yield AppInitState.initialized();
    }

  }
}