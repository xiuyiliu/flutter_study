import 'package:flutter/material.dart';

import 'package:flutter_study/widgets/custom_navigator.dart';
import 'package:flutter_study/styles/index.dart';
import 'package:flutter_study/utils/index.dart';

List<Map<String,dynamic>> infoList = [
  {'key': 'Material','value': '100% cotton'},
  {'key': 'Style','value': 'Commuter'},
  {'key': 'Color','value': 'Red Black'},
  {'key': 'Size','value': 'XL XXL'},
];

class ProductInfo extends StatefulWidget {
  @override
  _ProductInfoState createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new CustomNavigator(title: 'Product Infomation'),
        new Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15.0),
          child: Table(
            columnWidths: const <int, TableColumnWidth> {
              0: FlexColumnWidth(1.0),
              1: FlexColumnWidth(2.0),
            },
            border: TableBorder.all(color: AppColors.color_ddd),
            children: createTableRow(infoList),
          ),
        ),
        new CustomNavigator(title: 'Product Infomation'),
        new Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Image.asset(Utils.GetImagePath('order/books',format: 'jpg'),width: MediaQuery.of(context).size.width,fit: BoxFit.fitWidth,),
              new Text('Decoration: Embroidery',style: TextStyle(color: AppColors.color_666,height: 1.3),maxLines: 1,overflow: TextOverflow.ellipsis,),
              new Text('Sleeve Length(cm): Full',style: TextStyle(color: AppColors.color_666,height: 1.3),maxLines: 1,overflow: TextOverflow.ellipsis,),
            ],
          )
        )
      ],
    );
  }
}

List<TableRow> createTableRow(List list) {
  return list.map((item){
    return TableRow(
      children: [
        new TableCell(
          child: new Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: new Center(
              child: new Text(item['key']),
            ),
          )
        ),
        new TableCell(
          child: new Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: new Center(
              child: new Text(item['value']),
            ),
          )
        ),
      ]
    );
  }).toList();
}



