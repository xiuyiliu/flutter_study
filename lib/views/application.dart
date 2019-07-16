import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import 'package:flutter_study/routers/index.dart';

import 'package:flutter_study/views/account/index.dart';
import 'package:flutter_study/views/cart/index.dart';
import 'package:flutter_study/views/categories/index.dart';
import 'package:flutter_study/views/home/index.dart';



class Application extends StatefulWidget {

  /// 导航页面下标识
  final int pageIndex;

  Application({Key key, this.pageIndex = 0}): super(key: key);

  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {

  _ApplicationState() {
    /// 初始化路由配置
    final Router router = new Router();
    Routes.configureRoutes(router);
    ApplicationRouter.router = router;
  }

  PageController _pageController;
  int _currentIndex;
  final List<Widget> _pageListView = [
    HomePage(),
    CategoriesPage(),
    CartPage(),
    AccountPage(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentIndex = widget.pageIndex;
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        body: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: _pageListView
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (int index) {
            _pageController.jumpToPage(index);
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
      )
    );
  }
}
