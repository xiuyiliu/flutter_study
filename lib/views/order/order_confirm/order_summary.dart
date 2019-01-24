import 'package:flutter/material.dart';

import 'package:flutter_study/styles/index.dart';
import 'package:flutter_study/utils/index.dart';

List goodInfoList = [1,2,3];

class OrderSummary extends StatefulWidget {
  @override
  _OrderSummaryState createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.color_eee))
      ),
      child: ExpansionTile(
        initiallyExpanded: true,
        title: new Row(
          children: <Widget>[
            new Icon(Icons.add_shopping_cart),
            new Padding(padding: const EdgeInsets.only(left: 10.0)),
            new Text('Order Summary'),
            new Expanded(
              child: new Text('THB 682.21',textAlign: TextAlign.right,),
            )
          ],
        ),
        children: <Widget>[
          new OrderSummaryContent()
        ],
      ),
    );
  }
}

/// OrderSummaryContent
class OrderSummaryContent extends StatefulWidget {
  @override
  _OrderSummaryContentState createState() => _OrderSummaryContentState();
}

class _OrderSummaryContentState extends State<OrderSummaryContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff7f7f7),
      padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.color_fff,
            borderRadius: BorderRadius.circular(15.0)
        ),
        child: new Column(
          children: <Widget>[
            /// goods info
            new ListView(
              shrinkWrap: true,
              physics: new NeverScrollableScrollPhysics(),
              children: goodInfoList.map((item) => new SummaryGoodsInfo()).toList(),
            ),
            /// enter the discount code
            new Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: AppColors.color_eee))
              ),
              child: new Row(
                children: <Widget>[
                  new Expanded(
                    child: new TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter the discount code',
                        border: OutlineInputBorder(),
                        contentPadding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15.0)
                      ),
                    ),
                  ),
                  new Container(width: 15.0,),
                  new RaisedButton(
                    color: AppColors.color_main,
                    textColor: AppColors.color_fff,
                    onPressed: () {
                      print('dlkd');
                    },
                    child: new Text('Apply'),
                  )
                ],
              ),
            ),
            /// price info
            new Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: AppColors.color_eee))
              ),
              child: new ListView(
                physics: new NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: <Widget>[
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new Expanded(
                        child: new Text('Subtotal',textAlign: TextAlign.right,),
                      ),
                      new Container(
                        width: 150.0,
                        child: new Text('฿ 692.84',textAlign: TextAlign.right,),
                      ),
                    ],
                  ),
                  new Container(height: 5.0,),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new Expanded(
                        child: new Text('Shipping',textAlign: TextAlign.right,),
                      ),
                      new Container(
                        width: 150.0,
                        child: new Text('Free',textAlign: TextAlign.right,),
                      ),
                    ],
                  ),
                  new Container(height: 5.0,),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new Expanded(
                        child: new Text('Discount code',textAlign: TextAlign.right,),
                      ),
                      new Container(
                        width: 150.0,
                        child: new Text('฿ 10.0',textAlign: TextAlign.right,),
                      ),
                    ],
                  )
                ],
              )
            ),
            /// Total price
            new Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: AppColors.color_eee))
              ),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  new Expanded(
                    child: new Text('Total',textAlign: TextAlign.right,style: TextStyle(color: AppColors.color_main,fontSize: 14.0,fontWeight: FontWeight.w600),),
                  ),
                  new Container(
                    width: 150.0,
                    child: new Text('฿ 682.84',textAlign: TextAlign.right,style: TextStyle(color: AppColors.color_main,fontSize: 14.0,fontWeight: FontWeight.w600),),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SummaryGoodsInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.color_eee))
      ),
      child: new Row(
        children: <Widget>[
          new Image.asset(
            Utils.GetImagePath('order/books',format: 'jpg'),
            width: 85.0,
            height: 85.0,
            fit: BoxFit.fill,
          ),
          new Padding(padding: const EdgeInsets.only(left: 10.0)),
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Text('Printed Short Loose Sleeves Love And Peace HHHHHH',maxLines: 1,overflow: TextOverflow.ellipsis,),
                new Padding(padding: const EdgeInsets.only(top: 5.0)),
                new Text('cartoon kitten pattern ......',maxLines: 1,overflow: TextOverflow.ellipsis,),
                new Padding(padding: const EdgeInsets.only(top: 5.0)),
                new Text('Black, XXL'),
                new Padding(padding: const EdgeInsets.only(top: 5.0)),
                new Row(
                  children: <Widget>[
                    new Text('฿ 5.98',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16.0,color: AppColors.color_main),),
                    new Padding(padding: const EdgeInsets.only(right: 10.0)),
                    new Text('฿ 10.0',style: TextStyle(color: AppColors.color_666,decoration: TextDecoration.lineThrough),),
                    new Expanded(
                      child: new Text('x1',textAlign: TextAlign.right,style: TextStyle(color: AppColors.color_666),),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
