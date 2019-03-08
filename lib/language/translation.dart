import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert' show json;

/// 自定义一个LocaleChangeCallback类型
typedef void LocaleChangeCallback(Locale locale);

class AppLanguage {
  /// 支持的语言列表
  final List<String> supportedLanguages = ['en', 'zh'];

  /// 支持的Locales列表
  Iterable<Locale> supportedLocales() => supportedLanguages.map<Locale>((lang) => new Locale(lang, ''));

  /// 当语言改变时调用的方法
  LocaleChangeCallback onLocaleChanged;

  static final AppLanguage _appLanguage = new AppLanguage._internal();

  factory AppLanguage() {
    return _appLanguage;
  }

  AppLanguage._internal();
}

AppLanguage appLanguage = new AppLanguage();



/// 自定义多语言实现
class Translations {

  Locale locale;
  static Map<dynamic, dynamic> _localizedValues;

  Translations(Locale locale) {
    this.locale = locale;
    _localizedValues = null;
  }

  /// 加载国际化翻译文件
  static Future<Translations> load(Locale locale) async{
    Translations translations = new Translations(locale);
    /// 加载文件
    String jsonContent = await rootBundle.loadString("locale/i18n_${locale.languageCode}.json");
    _localizedValues = json.decode(jsonContent);
    /// 返回实例
    return translations;
  }

  /// 返回翻译文件映射对应的key
  String text(String key) {
    if (_localizedValues != null) {
      return _localizedValues[key] ?? '** $key not found';
    }
    return '';
  }

  /// 通过 Localizations 加载当前的 Translations
  static Translations of(BuildContext context) {
    return Localizations.of<Translations>(context, Translations);
  }

  /// 获取当前使用语言
  String get currentLanguage => locale.languageCode;

}

/// Delegate类的实现 验证支持的语言，初始化我们的自定义Translations类（核心是load）
class TranslationsDelegate extends LocalizationsDelegate<Translations> {
  const TranslationsDelegate();

  @override
  bool isSupported(Locale locale) => appLanguage.supportedLanguages.contains(locale.languageCode);

  @override
  Future<Translations> load(Locale locale) => Translations.load(locale);

  @override
  bool shouldReload(TranslationsDelegate old) => false;
}

/// Delegate类的实现，每次选择一种新的语言时，强制初始化一个新的Translationss类
/// 核心是load和shouldReload
class SpecificLocalizationDelegate extends LocalizationsDelegate<Translations> {
  final Locale overriddenLocale;

  const SpecificLocalizationDelegate(this.overriddenLocale);

  @override
  bool isSupported(Locale locale) => overriddenLocale != null;

  @override
  Future<Translations> load(Locale locale) => Translations.load(overriddenLocale);

  /// 如果应通过调用[load]方法再次加载此委托的资源，则返回true。
  /// 只要重建其[Localizations]窗口小部件，就会调用此方法。 如果返回true，则在[load]完成后将重建依赖小部件。
  @override
  bool shouldReload(LocalizationsDelegate<Translations> old) => true;
}
