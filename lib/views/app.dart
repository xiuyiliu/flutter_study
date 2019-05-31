import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter_study/views/home/index.dart';
import 'package:flutter_study/views/categories/index.dart';
import 'package:flutter_study/views/cart/index.dart';
import 'package:flutter_study/views/account/index.dart';
import 'package:flutter_study/routes/routes.dart';
import 'package:flutter_study/routes/application.dart';
import 'package:flutter_study/language/translation.dart';
import 'package:flutter_study/utils/index.dart';


class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin{

  SpecificLocalizationDelegate _localeOverrideDelegate;

  _MyAppState() {
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  int _currentIndex = 0;
  PageController _controller = PageController(
    initialPage: 0
  );

  /// 更改语言包回调方法
  void changeLanguageCallback(languageCode) {
    setState(() {
      _localeOverrideDelegate = new SpecificLocalizationDelegate(new Locale(languageCode, ''));
      if (languageCode == 'en') {
        print('当前是英文环境,');
      } else {
        print('当前是中文环境');
      }
    });
  }

  /// 校验本地持久化语言类型方法
  void checkLocaleLanguage() {
    Utils.getLanguage().then((languageCode){
      if (languageCode != null) {
        changeLanguageCallback(languageCode);
      }
    });
  }

  /// 每次选择一种新的语言时，都会创造一个新的SpecificLocalizationDelegate实例，强制Translations类刷新
  void onLocaleChange(Locale locale) {
    Utils.saveLanguage(locale.languageCode);
    changeLanguageCallback(locale.languageCode);
  }


  /// 当允许用户自己滚动时，保持页面和底部导航栏同步
//  void _pageChanged(int index) {
//    setState(() {
//      if (_currentIndex != index) {
//        _currentIndex = index;
//      }
//    });
//  }

  /// 四个页面列表
  List<Widget> pageList = [
    HomePage(),
    CategoriesPage(),
    CartPage(),
    AccountPage()
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    _controller.dispose();

    /// 初始化一个新的Localization Delegate,当用户选择一种新的工作语言时，可以强制初始化一个新的Translations
    _localeOverrideDelegate = new SpecificLocalizationDelegate(new Locale('en', ''));

    /// 校验本地持久化语言类型
    checkLocaleLanguage();

    /// 保存这个方法的指针，当用户改变语言时，可以强制App刷新
    appLanguage.onLocaleChanged = onLocaleChange;
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
//      debugShowMaterialGrid: true,
      title: 'flutter app',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.orange,
        primaryColor: Colors.white,
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        _localeOverrideDelegate,
        const TranslationsDelegate(),
      ],
      supportedLocales: appLanguage.supportedLocales(),
      home: Scaffold(
        /// 使用PageView实现方式，通过子页面state实现AutomaticKeepAliveClientMixin
        /// 达到切换各各面保持状态的效果
        body: PageView(
          controller: _controller,
          /// 不允许用户自己滚动
//          physics: NeverScrollableScrollPhysics(),
          /// 如果允许用户自己滚动，需要监听滚动，保持页面和底部导航栏同步
//          onPageChanged: _pageChanged,
          children: <Widget>[
            HomePage(),
            CategoriesPage(),
            CartPage(),
            AccountPage()
          ],
        ),

//        body: IndexedStack(
//          index: _currentIndex,
//          children: pageList,
//        ),

//       body: new Container(
//         child: pageList[_currentIndex],
//       ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.orange,
          onTap: (index) {
            _controller.animateToPage(index,duration: const Duration(milliseconds: 2000),curve: Curves.easeIn);
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),title: Text('Home')),
            BottomNavigationBarItem(icon: Icon(Icons.dashboard),title: Text('Categories')),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),title: Text('Cart')),
            BottomNavigationBarItem(icon: Icon(Icons.account_box),title: Text('Account')),
          ],
        ),
      ),
    );
  }
}


