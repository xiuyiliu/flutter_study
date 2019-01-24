import 'package:flutter/material.dart';

import 'package:flutter_study/styles/index.dart';
import 'package:flutter_study/utils/index.dart';
import 'order_textField.dart';
import 'dropdown_textField.dart';
import 'order_navigator.dart';
import 'order_summary.dart';

List<String> Country = [
  '中国',
  '美国',
  '法国',
  '英国',
  '韩国',
  '日本',
  '加拿大',
];

List<String> City = [
  '东京',
  '北京',
  '西京',
  '南京',
];

List<String> PaymentMethod = [
  'cach on delivery'
];

Map<String,dynamic> orderData = {
  "city": null,
  "country": null
};

Map<String,dynamic> PayMent = {
  "payment": null
};

class Order extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
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
            child: new DropdownTextField(hintText: 'State',optionList: Country,formData: orderData,type: 'country',),
          ),
          SliverToBoxAdapter(
            child: new DropdownTextField(hintText: 'City',optionList: City,formData: orderData,type: 'city',),
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
                formData: PayMent,
                type:'type',
                optionList: PaymentMethod,
              ),
            )
          ),
          SliverToBoxAdapter(
            child: new Container(
              width: MediaQuery.of(context).size.width,
              child: new RaisedButton(
                onPressed: () {
                  print('asdlf');
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







