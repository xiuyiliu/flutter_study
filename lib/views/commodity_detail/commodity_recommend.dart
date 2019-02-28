
import 'package:flutter/material.dart';

import 'package:flutter_study/widgets/commodity_card.dart';
import 'package:flutter_study/widgets/custom_navigator.dart';

class Recommend extends StatefulWidget {
  @override
  _RecommendState createState() => _RecommendState();
}

class _RecommendState extends State<Recommend> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 5,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return new CommodityCard();
        }
      )
    );
  }
}
