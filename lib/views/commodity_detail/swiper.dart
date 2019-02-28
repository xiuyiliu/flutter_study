import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_study/styles/index.dart';

List<String> swiperList = [
  "https://taoke-prod.oss-cn-hangzhou.aliyuncs.com/task/20181129/foyv6tx0lnb1889210529",
  "https://taoke-prod.oss-cn-hangzhou.aliyuncs.com/task/20181213/p6qxecjact2557426482",
  "https://taoke-prod.oss-cn-hangzhou.aliyuncs.com/task/20181129/zxhz0vmh4391757955463"
];

class CommoditySwiper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 240.0,
          decoration: BoxDecoration(
            border:Border(
              bottom: BorderSide(color: AppColors.color_f5f5)
            )
          ),
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return Image.network(swiperList[index],fit: BoxFit.fill,);
            },
            itemCount: swiperList.length,
            autoplay: true,
            pagination: new SwiperPagination(
              builder: DotSwiperPaginationBuilder(
                color: Colors.black54,
                activeColor: Colors.white,
              )
            ),
            onTap: (int index) {
              print('你点击了第${index + 1 }个');
            },
          ),
        ),
        Positioned(
          right: 15.0,
          bottom: 10.0,
          child: new Container(
            width: 64.0,
            height: 24.0,
            decoration: BoxDecoration(
              color: AppColors.color_fff,
              borderRadius: BorderRadius.circular(12.0)
            ),
            child: new Center(
              child:  new Text('1 / ${swiperList.length.toString()}'),
            ),
          ),
        )
      ],
    );
//
  }
}
