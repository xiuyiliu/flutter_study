
import 'package:flutter/material.dart';

import 'package:flutter_study/views/commodity_detail/swiper.dart';
import 'package:flutter_study/views/commodity_detail/commodity_info.dart';
import 'package:flutter_study/views/commodity_detail/config.dart';
import 'package:flutter_study/views/commodity_detail/commodity_review.dart';
import 'package:flutter_study/views/commodity_detail/product_info.dart';
import 'package:flutter_study/views/commodity_detail/commodity_recommend.dart';
import 'package:flutter_study/widgets/custom_divide.dart';
import 'package:flutter_study/widgets/custom_navigator.dart';


class CommodityDetail extends StatefulWidget {
  @override
  _CommodityDetailState createState() => _CommodityDetailState();
}

class _CommodityDetailState extends State<CommodityDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: new Scaffold(
        body: new CustomScrollView(
          slivers: <Widget>[
            /// 轮播图
            SliverToBoxAdapter(
              child: new CommoditySwiper(),
            ),
            /// 商品信息模块
            SliverToBoxAdapter(
              child: new CommodityInfo(),
            ),
            /// 分隔线
            SliverToBoxAdapter(
              child: new CustomDivide(height: 10.0,)
            ),
            /// 分隔nav
            SliverToBoxAdapter(
              child: new CustomNavigator(
                title: 'Product Options',
                prefixIcon: Image.asset(ImagePath.menu,width: 18.0,height: 18.0),
                suffixIcon: Image.asset(ImagePath.arrow,width: 16.0,height: 16.0),
              ),
            ),
            SliverToBoxAdapter(
                child: new CustomDivide()
            ),
            /// commodity reviews
            SliverToBoxAdapter(
              child: new CommodityReview(),
            ),
            /// 华丽的分隔线
            SliverToBoxAdapter(
              child: new CustomDivide(),
            ),
            /// product info
            SliverToBoxAdapter(
              child: new ProductInfo(),
            ),
            SliverToBoxAdapter(
              child: new CustomNavigator(title: 'You May Also Like'),
            ),
            new Recommend()
          ],
        ),
      ),
    );
  }
}
