import 'package:shared_preferences/shared_preferences.dart';

/// 本地轻量存储配置（适合做一些轻量级的数据存储，如用户信息、应用配置信息等）
class LightweightStorage {
  /// 存储字符串数据
  static Future saveString(String key, String value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(key, value);
  }

  /// 存储字符串数组数据
  static Future saveListString(String key, List<String> list) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setStringList(key, list);
  }

  /// 读取数据
  static Future getStringList(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> list = sharedPreferences.get(key);
    return list;
  }

  /// 读取数据
  static Future get(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String _storageString = sharedPreferences.get(key);
    return _storageString;
  }

  /// 删除数据
  static Future remove(List<String> listKey) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    listKey.forEach((String key){
      sharedPreferences.remove(key);
    });
  }
}

/// SqLite 数据库存储配置（适合存储需要长期存储在客户端的数据）----留作将来做扩展
class SqLiteStorage {

}