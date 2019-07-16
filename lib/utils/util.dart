import 'package:intl/intl.dart';

class Utils {
  /// 时间格式化 默认 yyyy-MM-dd HH:mm:ss
  static getLocalTime(String time, {String format = 'yyyy-MM-dd HH:mm:ss'}) {
    DateFormat formatter = new DateFormat(format);
    return formatter.format(DateTime.parse(time).toLocal());
  }
}