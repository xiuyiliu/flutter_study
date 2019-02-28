import 'package:flutter/material.dart';

import 'package:flutter_study/styles/index.dart';
import 'package:flutter_study/views/commodity_detail/config.dart';
import 'package:flutter_study/widgets/rating_plugin.dart';

class CommodityInfo extends StatefulWidget {
  @override
  _CommodityInfoState createState() => _CommodityInfoState();
}

class _CommodityInfoState extends State<CommodityInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        /// 第一行为商品价格和喜欢分享等
          new Row(
            children: <Widget>[
              new Text('€5.98',style: TextStyle(color: AppColors.color_main,fontSize: 20.0,fontWeight: FontWeight.w600)),
              new Padding(padding: const EdgeInsets.only(right: 15.0)),
              new Text('€15.98',style: TextStyle(color: AppColors.color_666,fontSize: 16.0,decoration: TextDecoration.lineThrough)),
              new Padding(padding: const EdgeInsets.only(right: 15.0)),
              new Container(
                width: 65.0,
                height: 20.0,
                decoration: BoxDecoration(
                  color: AppColors.color_main,
                  borderRadius: BorderRadius.circular(10.0)
                ),
                child: new Center(
                  child: new Text('51% off',style: TextStyle(color: AppColors.color_fff))
                ),
              ),
              /// 用Expanded去占剩余的空间，去适应不用大小的屏幕
              new Expanded(
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    new Container(
                      width: 16.0,
                      height: 16.0,
                      decoration: BoxDecoration(
//                        color: AppColors.color_main
                      ),
                      child: Image.asset(ImagePath.like),
                    ),
                    new Padding(padding: const EdgeInsets.only(right: 15.0)),
                    new Container(
                      width: 45.0,
                      height: 23.0,
                      decoration: BoxDecoration(
                        
                      ),
                      child: Image.asset(ImagePath.share),
                    )
                  ],
                ),
              )
            ],
          ),
        /// 第二行为商品名称，最多支持两行
          new Container(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: new Text(
              'Women`s Align Dress Patchwork Polka Dot Short Sleeve Dreess',
              style: TextStyle(color: AppColors.color_333,fontSize: 16.0,fontWeight: FontWeight.w600,height: 1.2),
              maxLines: 2,
              overflow: TextOverflow.fade,
            ),
          ),
        /// 第三行为商品评分
        new Row(
          children: <Widget>[
            new StaticRatingBar(
              rate: 3.5,
              size: 16.0
            ),
            new Padding(padding: const EdgeInsets.only(right: 20.0),),
            new Text('Sold: 8370',style: TextStyle(color: AppColors.color_666,fontSize: 14.0),)
          ],
        ),
        /// 第四行为商品标签，支持换行
          new Container(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child:  new Wrap(
              spacing: 10.0,
              runSpacing: 8.0,
              alignment: WrapAlignment.start,
              children: createTag(commodityTag),
            ),
          )
        ],
      ),
    );
  }
}

/// 商品信息标签
class CommodityTag extends StatelessWidget {
  CommodityTag({Key key,@required this.tag}):super(key:key);
  String tag;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.color_main),
        borderRadius: BorderRadius.circular(15.0)
      ),
      child: new Text(tag,style: TextStyle(color: AppColors.color_main),),
    );
  }
}

List<Widget> createTag(List<String> tagList) {
  return tagList.map((item) => CommodityTag(tag: item)).toList();
}

List<String> commodityTag = [
  'Free Shipping',
  'Support COD',
  'Easy Return',
  'Peace And Love'
];
