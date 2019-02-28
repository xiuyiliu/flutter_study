
import 'package:flutter/material.dart';

class CustomNavigator extends StatelessWidget {

  CustomNavigator({
    Key key,
    this.prefixIcon,
    this.suffixIcon,
    @required this.title,
    this.titleStyle,
    this.path,
    this.isShowBottomBorder = false
  }): assert(title != null), 
      super(key: key);


  ///  prefixIcon
  Widget prefixIcon;
  /// suffixIcon
  Widget suffixIcon;
  /// title
  String title;
  /// title TextStyle
  TextStyle titleStyle;
  /// path
  String path;
  /// if show bottomBorder
  bool isShowBottomBorder;
  


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xfff5f5f5),width: isShowBottomBorder ? 1.0 : 0.0))
      ),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          prefixIcon ??  new SizedBox(width: 0.0,height: 0.0,),
          new Offstage(
            offstage: prefixIcon == null,
            child: new Padding(padding: const EdgeInsets.only(right: 10.0)),
          ),
          new Text(title,style: titleStyle ?? TextStyle(color: Colors.black,fontSize: 16.0,fontWeight: FontWeight.w600),maxLines: 1,overflow: TextOverflow.ellipsis,),
          new Expanded(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                suffixIcon ?? new SizedBox(width: 0.0,height: 0.0,)
              ],
            )
          )
        ],
      ),
    );
  }
}
