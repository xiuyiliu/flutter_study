import 'package:flutter/material.dart';

import 'package:flutter_study/styles/index.dart';
import 'package:flutter_study/utils/index.dart';
import 'package:flutter_study/blocs/blocs/order_confirm_page/page_bloc.dart';
import 'package:flutter_study/models/order_confirm_page.dart';
import 'package:flutter_study/blocs/bloc_helpers/bloc_provider.dart';

import 'mock.dart';

class OrderSummary extends StatefulWidget {
  @override
  _OrderSummaryState createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {

  OrderConfirmPageBloc orderConfirmPageBloc;
  OrderSummaryModel _initialData;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initialData = OrderSummaryModel.fromJson(initialOrderSummaryData);
    orderConfirmPageBloc = new OrderConfirmPageBloc();
    orderConfirmPageBloc.getOrderSummary();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    orderConfirmPageBloc?.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrderConfirmPageBloc>(
      bloc: orderConfirmPageBloc,
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: AppColors.color_eee))
        ),
        child: StreamBuilder(
          stream: orderConfirmPageBloc.orderSummaryStream,
          initialData: _initialData,
          builder: (BuildContext context,AsyncSnapshot<OrderSummaryModel> snapshot) {
            return ExpansionTile(
              initiallyExpanded: true,
              title: new Row(
                children: <Widget>[
                  new Icon(Icons.add_shopping_cart),
                  new Padding(padding: const EdgeInsets.only(left: 10.0)),
                  new Text('Order Summary'),
                  new Expanded(
                    child: new Text('THB ${(snapshot.data.total / 100).toStringAsFixed(2)}',textAlign: TextAlign.right,),
                  )
                ],
              ),
              children: <Widget>[
                new OrderSummaryContent()
              ],
            );
          },
        ),
      )
    );
  }
}

/// OrderSummaryContent
class OrderSummaryContent extends StatefulWidget {
  @override
  _OrderSummaryContentState createState() => _OrderSummaryContentState();
}

class _OrderSummaryContentState extends State<OrderSummaryContent> {
  OrderSummaryModel _initialData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initialData = OrderSummaryModel.fromJson(initialOrderSummaryData);
  }
  @override
  Widget build(BuildContext context) {
    OrderConfirmPageBloc orderConfirmPageBloc = BlocProvider.of<OrderConfirmPageBloc>(context);
    return Container(
      color: Color(0xfff7f7f7),
      padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.color_fff,
            borderRadius: BorderRadius.circular(15.0)
        ),
        child: StreamBuilder(
          stream: orderConfirmPageBloc.orderSummaryStream,
          initialData: _initialData,
          builder: (BuildContext context,AsyncSnapshot<OrderSummaryModel> snapshot) {
            return new Column(
              children: <Widget>[
                /// goods info
                new ListView.builder(
                  shrinkWrap: true,
                  physics: new NeverScrollableScrollPhysics(),
                  itemBuilder:(BuildContext context,int index) {
                    return new SummaryGoodsInfo(info: snapshot.data.goodsInfoList[index]);
                  },
                  itemCount: snapshot.data.goodsInfoList.length,
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
                            child: new Text('฿ ${(snapshot.data.subtotal / 100).toStringAsFixed(2)}',textAlign: TextAlign.right,),
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
                            child: new Text(snapshot.data.shipping,textAlign: TextAlign.right,),
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
                            child: new Text('฿ ${(snapshot.data.discount / 100).toStringAsFixed(2)}',textAlign: TextAlign.right,),
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
                        child: new Text('฿ ${(snapshot.data.total / 100).toStringAsFixed(2)}',textAlign: TextAlign.right,style: TextStyle(color: AppColors.color_main,fontSize: 14.0,fontWeight: FontWeight.w600),),
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        )
      ),
    );
  }
}

class SummaryGoodsInfo extends StatelessWidget {

  SummaryGoodsInfo({Key key,@required this.info}) :super(key:key);

  GoodsInfo info;

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
                new Text(info.title,maxLines: 1,overflow: TextOverflow.ellipsis,),
                new Padding(padding: const EdgeInsets.only(top: 5.0)),
                new Text(info.desc,maxLines: 1,overflow: TextOverflow.ellipsis,),
                new Padding(padding: const EdgeInsets.only(top: 5.0)),
                new Text(info.sku),
                new Padding(padding: const EdgeInsets.only(top: 5.0)),
                new Row(
                  children: <Widget>[
                    new Text('฿ ${(info.priceAfter / 100).toStringAsFixed(2)}',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16.0,color: AppColors.color_main),),
                    new Padding(padding: const EdgeInsets.only(right: 10.0)),
                    new Text('฿ ${(info.priceBefore / 100).toStringAsFixed(2)}',style: TextStyle(color: AppColors.color_666,decoration: TextDecoration.lineThrough),),
                    new Expanded(
                      child: new Text('x ${info.count}',textAlign: TextAlign.right,style: TextStyle(color: AppColors.color_666),),
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
