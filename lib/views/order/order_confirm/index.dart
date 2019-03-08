import 'package:flutter/material.dart';

import 'package:flutter_study/styles/index.dart';
import 'order_textField.dart';
import 'dropdown_textField.dart';
import 'order_navigator.dart';
import 'order_summary.dart';

List<String> country = [
  '中国',
  '美国',
  '法国',
  '英国',
  '韩国',
  '日本',
  '加拿大',
];

//Map<String,dynamic> orderData = {
//  "country": null,
//  "city": null,
//};

List<String> city = [
  '东京',
  '北京',
  '西京',
  '南京',
];

List<String> paymentMethod = [
  'cach on delivery'
];

Map<String,dynamic> payment = {
  "payment": null
};


/// 自定义Inherited组件，用于Order下的子组件共享Order信息
class _MyInherited extends InheritedWidget {
  _MyInherited({
    Key key,
    @required Widget child,
    @required this.data
  }) : super(key:key, child:child);

  final MyInheritedWidgetState data;

  @override
  bool updateShouldNotify(_MyInherited oldWidget) => true;
}

class MyInheritedWidget extends StatefulWidget {
  MyInheritedWidget({
    Key key,
    this.child,
  }): super(key: key);

  final Widget child;

  @override
  MyInheritedWidgetState createState() => MyInheritedWidgetState();

  static MyInheritedWidgetState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_MyInherited) as _MyInherited).data;
  }
}

class MyInheritedWidgetState extends State<MyInheritedWidget> { /// 订单信息
  Map<String, dynamic> orderData = {
    "userShippingAddressId":"",
    "fullName":"",
    "address":"",
    "State":null,
    "province":null,
    "amphoe":null,
    "district":null,
    "zipCode":"",
    "phoneNumber":"",
    "Cash on delivery":"Cash on delivery"
  };

  /// 输入框控制器
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _adressController = new TextEditingController();
  TextEditingController _stateController = new TextEditingController();
  TextEditingController _cityController = new TextEditingController();
  TextEditingController _zipCodeController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new _MyInherited(
      child: widget.child,
      data: this
    );
  }
}


class ParentOrderWidget extends StatefulWidget {

  @override
  _ParentOrderWidgetState createState() => _ParentOrderWidgetState();
}

class _ParentOrderWidgetState extends State<ParentOrderWidget> {
  @override
  Widget build(BuildContext context) {
    return new MyInheritedWidget(
      child: new Order(),
    );
  }
}


class Order extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {

  @override
  Widget build(BuildContext context) {
    MyInheritedWidgetState state = MyInheritedWidget.of(context);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('My Order'),
        centerTitle: true,
        elevation: 0.3,
      ),
      body: new CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: new OrderNavigator(icon: Icons.location_on, title: "Shipping Address"),
          ),
          SliverToBoxAdapter(
            child: new OrderTextField(hintText: 'Full Name',),
          ),
          SliverToBoxAdapter(
            child: new OrderTextField(hintText: 'Address',),
          ),
          SliverToBoxAdapter(
            child: new DropdownTextField(hintText: 'State',optionList: country,formData: state.orderData,type: 'country',),
          ),
          SliverToBoxAdapter(
            child: new DropdownTextField(hintText: 'City',optionList: city,formData: state.orderData,type: 'city',),
          ),
          SliverToBoxAdapter(
            child: new OrderTextField(hintText: 'Zip Code',),
          ),
          SliverToBoxAdapter(
            child: new OrderTextField(hintText: 'Phone Number',),
          ),
          SliverToBoxAdapter(
            child: new OrderSummary(),
          ),
          SliverToBoxAdapter(
            child: new OrderNavigator(icon: Icons.payment, title: "Method of Payment"),
          ),
          SliverToBoxAdapter(
              child: new Container(
                padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 20.0),
                decoration: BoxDecoration(
                    color: Color(0xfff7f7f7)
                ),
                child:  new DropdownTextField(
                  hintText: 'Cach on delivery',
                  prefixIcon: Icon(Icons.list),
                  formData: payment,
                  type:'type',
                  optionList: paymentMethod,
                ),
              )
          ),
          SliverToBoxAdapter(
            child: new Container(
              width: MediaQuery.of(context).size.width,
              child: new RaisedButton(
                onPressed: () {
                  print(state.orderData);
                },
                child: new Text('Submit Order'),
                color: AppColors.color_main,
                textColor: AppColors.color_fff,
              ),
            ),
          )
        ],
      ),
    );
  }
}







