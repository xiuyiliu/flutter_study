
/// OrderSummary
class OrderSummaryModel {
  int subtotal;
  int discount;
  int total;
  String shipping;
  List goodsInfoList;

  OrderSummaryModel.fromJson(dynamic json) {
    subtotal = json['subtotal'];
    discount = json['discount'];
    total = json['total'];
    shipping = json['shipping'];
    goodsInfoList = json['goodsInfoList'].map((item) => GoodsInfo.fromJson(item)).toList();
  }
}

/// GoodsInfo
class GoodsInfo {
  String title;
  String desc;
  String sku;
  int priceBefore;
  int priceAfter;
  int count;
  GoodsInfo.fromJson(Map<String,dynamic> json) {
    title = json['title'];
    desc = json['desc'];
    sku = json['sku'];
    priceBefore = json['priceBefore'];
    priceAfter = json['priceAfter'];
    count = json['count'];
  }
}