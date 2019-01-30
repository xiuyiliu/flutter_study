import 'package:flutter/material.dart';
import 'package:flutter_study/styles/index.dart';

/// 页面Dropdown TextField
class DropdownTextField extends StatefulWidget {

  DropdownTextField({
    Key key,
    @required this.hintText,
    @required this.optionList,
    @required this.formData,
    @required this.type,
    this.prefixIcon
  }): super(key:key);

  String hintText;
  String type;
  List optionList;
  Widget prefixIcon;
  Map<String,dynamic> formData;

  @override
  _DropdownTextFieldState createState() => _DropdownTextFieldState();
}

class _DropdownTextFieldState extends State<DropdownTextField> {

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38.0,
      margin: const EdgeInsets.only(left: 10.0),
      decoration: BoxDecoration(
        color: AppColors.color_fff,
        border: Border(bottom: BorderSide(color: AppColors.color_eee,width: 1.0))
      ),
      child: InputDecorator(
        decoration: InputDecoration(
          prefixIcon: widget.prefixIcon,
          hintText: widget.hintText,
          contentPadding: EdgeInsets.zero,
          border: InputBorder.none,
        ),
        isEmpty: widget.formData[widget.type] == null,
        child: DropdownButtonHideUnderline(
          child:  DropdownButton<String>(
            isExpanded: true,
            elevation: 0,
            value: widget.formData[widget.type],
            items: widget.optionList.map((value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String newValue) {
              setState(() {
                widget.formData[widget.type] = newValue;
              });
            }
          ),
        )
      ),
    );
  }
}