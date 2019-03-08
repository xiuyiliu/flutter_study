
import 'package:flutter_study/storage/index.dart';
class Utils {
  /// 获取本地图片资源路径
  static String GetImagePath (String name, {String format: 'png'}) {
    return 'assets/images/$name.$format';
  }

  /// 保存用户语言
  static Future saveLanguage(String language) async {
    await LightweightStorage.saveString('languageCode', language);
  }

  /// 获取用户语言
  static Future getLanguage() async {
    String language = await LightweightStorage.get('languageCode');
    if (language != null) {
      return language;
    } else {
      return null;
    }
  }
}