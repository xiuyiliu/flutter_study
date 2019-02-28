
import 'package:flutter/material.dart';

import 'package:flutter_study/utils/index.dart';

class CommodityCard extends StatefulWidget {
  @override
  _CommodityCardState createState() => _CommodityCardState();
}

class _CommodityCardState extends State<CommodityCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
      elevation: 0.7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Expanded(
            child: new FadeInImage.assetNetwork(
              placeholder: Utils.GetImagePath('common/placeholder'),
              image: 'https://taoke-prod.oss-cn-hangzhou.aliyuncs.com/task/20181129/foyv6tx0lnb1889210529'
            ),
          )
        ],
      ),
    );
  }
}
