import 'package:flutter_study/blocs/bloc_helpers/bloc_event_state.dart';

/// 事件类型
enum AppInitEventType {
  start,
  stop
}
/// 事件流
class AppInitEvent extends BlocEvent {

  final AppInitEventType type;

  AppInitEvent({
    this.type = AppInitEventType.start
  }): assert(type != null);

}
