

class Utils {
  /// 获取本地图片资源路径
  static String GetImagePath (String name, {String format: 'png'}) {
    return 'assets/images/$name.$format';
  }
}