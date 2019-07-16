import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:intl/intl.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'package:flutter_study/utils/index.dart' show Utils;

class PickerPage extends StatefulWidget {
  @override
  _PickerPageState createState() => _PickerPageState();
}

class _PickerPageState extends State<PickerPage> {

  
  
  Future<void> _selectDate(BuildContext context) async{
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2018, 8),
        lastDate: DateTime(2100),
    );
//    if (picked != null) print(DateFormat.yMMMd().format(picked));
    if (picked != null) print(Utils.getLocalTime(picked.toString()));
  }

  _showDatePicker(BuildContext context) {
    return DatePicker.showDatePicker(context,
      showTitleActions: true,
      minTime: DateTime(2018,8),
      maxTime: DateTime(2100,8),
      onChanged: (date) {
        print('change $date');
      },
      onConfirm: (date) {
        print(Utils.getLocalTime(date.toString()));
      },
      currentTime: DateTime.now(),
      locale: LocaleType.zh
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('date-time-picker'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: RaisedButton(
              child: Text('show date picker'),
              onPressed: () {
//                _selectDate(context);
                _showDatePicker(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
