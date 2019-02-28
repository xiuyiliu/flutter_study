
import 'package:flutter/material.dart';

import 'package:flutter_study/styles/index.dart';
import 'package:flutter_study/widgets/rating_plugin.dart';
import 'package:flutter_study/views/commodity_detail/config.dart';

List<Map<String,dynamic>> reviewList = [
  {
    'avatar': 'assets/images/common/avatar.jpeg',
    'name': 'wrenstar',
    'date': '2019-1-12',
    'time': '13:45',
    'rate': 4.5,
    'review': 'Ability to work independent1y, mature and resourceful. Bright,aggressive applicants. Initiative, independent and good communication skill'
  },
  {
    'avatar': 'assets/images/common/avatar.jpeg',
    'name': 'curry',
    'date': '2019-2-12',
    'time': '13:45',
    'rate': 3.5,
    'review': 'Ability to work independent1y'
  },
  {
    'avatar': 'assets/images/common/avatar.jpeg',
    'name': 'allen',
    'date': '2019-1-16',
    'time': '4:45',
    'rate': 4.3,
    'review': 'Very nice!! Bright,aggressive applicants. Initiative, independent and good communication skill'
  },
];

class CommodityReview extends StatefulWidget {
  @override
  _CommodityReviewState createState() => _CommodityReviewState();
}

class _CommodityReviewState extends State<CommodityReview> {
  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        /// reivew navigator
        new Container(
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: AppColors.color_f5f5))
          ),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Column(
                children: <Widget>[
                  new Text('Reviews (165)',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16.0)),
                  new Padding(padding: const EdgeInsets.only(top: 5.0)),
                  new StaticRatingBar(rate: 3.5, size: 16.0)
                ],
              ),
              new Expanded(
                child: new Container(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Text('View All',style: TextStyle(color: AppColors.color_999,fontWeight: FontWeight.w600,fontSize: 16.0),),
                      new Padding(padding: const EdgeInsets.only(left:10.0),),
                      new Image.asset(ImagePath.arrow,width: 16.0,height: 16.0)
                    ],
                  ),
                )
              )
            ],
          )
        ),
        /// review info
        new Column(
          children: createReview(reviewList),
        )
      ],
    );
  }
}

class ReviewInfo extends StatelessWidget {

  ReviewInfo({Key key,@required this.info}):assert(info != null),super(key:key);

  Map<String,dynamic> info;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        border: Border(bottom:BorderSide(color: AppColors.color_f5f5)),
      ),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new CircleAvatar(
                backgroundImage: AssetImage(info['avatar']),
              ),
              new Padding(padding: const EdgeInsets.only(left: 10.0),),
              new Text(info['name'],style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w600),),
              new Expanded(
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    new Text(info['date'],style: TextStyle(color: AppColors.color_999,fontSize: 14.0),),
                    new Padding(padding: const EdgeInsets.only(left: 10.0),),
                    new Text(info['time'],style: TextStyle(color: AppColors.color_999,fontSize: 14.0)),
                    new Padding(padding: const EdgeInsets.only(left: 10.0),),
                    new StaticRatingBar(rate: info['rate'],size: 16.0,)
                  ],
                )
              )
            ],
          ),
          new Container(
            padding: const EdgeInsets.only(left: 50.0),
            child: new Text(
              info['review'],
              style: TextStyle(color: AppColors.color_999,fontSize: 14.0,height: 1.2),
            ),
          )
        ],
      ),
    );
  }
}

List<Widget> createReview(List<Map<String,dynamic>> list) {
  return list.map((item) => ReviewInfo(info: item)).toList();
}


