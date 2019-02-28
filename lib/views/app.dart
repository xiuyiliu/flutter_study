import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter_study/views/home/index.dart';
import 'package:flutter_study/views/categories/index.dart';
import 'package:flutter_study/views/cart/index.dart';
import 'package:flutter_study/views/account/index.dart';
import 'package:flutter_study/routes/routes.dart';
import 'package:flutter_study/routes/application.dart';


class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin{

  _MyAppState() {
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  int _currentIndex = 0;
  var _controller = PageController(
    initialPage: 0
  );
  /// 当允许用户自己滚动时，保持页面和底部导航栏同步
//  void _pageChanged(int index) {
//    setState(() {
//      if (_currentIndex != index) {
//        _currentIndex = index;
//      }
//    });
//  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'flutter app',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.orange,
        primaryColor: Colors.white,
      ),
      localizationsDelegates: [                             //此处
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en','US'),//此处
        const Locale('zh','CH'),
      ],
      home: Scaffold(
        /// 使用PageView实现方式，通过子页面state实现AutomaticKeepAliveClientMixin
        /// 达到切换各各面保持状态的效果
        body: PageView(
          controller: _controller,
          /// 不允许用户自己滚动
          physics: NeverScrollableScrollPhysics(),
          /// 如果允许用户自己滚动，需要监听滚动，保持页面和底部导航栏同步
//          onPageChanged: _pageChanged,
          children: <Widget>[
            HomePage(),
            CategoriesPage(),
            CartPage(),
            AccountPage()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.orange,
          onTap: (index) {
            _controller.jumpToPage(index);
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


