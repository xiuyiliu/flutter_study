import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> with AutomaticKeepAliveClientMixin{

//  @override
//  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('Cart');
  }
  @override
  Widget build(BuildContext context) {
    print('cart ---------------------build');
    return Container(
        child: new Center(
          child: new Text('Cart'),
        )
    );
  }
}
