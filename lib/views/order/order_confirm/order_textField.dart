import 'package:flutter/material.dart';
import 'package:flutter_study/styles/index.dart';
import 'package:flutter_study/views/order/order_confirm/index.dart';

/// 页面输入框
class OrderTextField extends StatefulWidget {
  OrderTextField({
    Key key,
    this.hintText,
    this.keyboardType,
    this.type
  }) : super(key:key);

  String hintText;
  TextInputType keyboardType;
  String type;

  @override
  _OrderTextFieldState createState() => _OrderTextFieldState();
}

class _OrderTextFieldState extends State<OrderTextField> {
  @override
  Widget build(BuildContext context) {
    MyInheritedWidgetState state = MyInheritedWidget.of(context);
    return Container(
      margin: const EdgeInsets.only(left: 10.0),
      padding: const EdgeInsets.only(right: 10.0),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.color_eee,width: 1.0))
      ),
      child: new TextField(
        cursorWidth: 1.0,
        cursorColor: AppColors.color_000,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.hintText,
          hintStyle: TextStyle(fontWeight: FontWeight.w300)
        ),
        controller: TextEditingController.fromValue(TextEditingValue(text: state.orderData[widget.type])),
      ),
    );
  }
}