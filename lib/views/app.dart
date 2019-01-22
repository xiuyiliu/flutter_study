import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

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
      ),
      home: Scaffold(
        body: PageView(
          controller: _controller,
          physics: NeverScrollableScrollPhysics(),
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


