import 'package:rxdart/rxdart.dart';

import 'package:flutter_study/blocs/bloc_helpers/bloc_provider.dart';
import 'package:flutter_study/models/order_confirm_page.dart';
import 'package:flutter_study/views/order/order_confirm/mock.dart';
import 'package:flutter_study/models/order_confirm_page.dart';

class OrderConfirmPageBloc implements BlocBase{
  /// OrderSummaryBloc
  BehaviorSubject<OrderSummaryModel> _orderSummaryController = BehaviorSubject<OrderSummaryModel>();
  Function(OrderSummaryModel) get _orderSummarySink => _orderSummaryController.sink.add;
  Stream<OrderSummaryModel> get orderSummaryStream => _orderSummaryController.stream;

  /// 获取OrderSummary数据
  void getOrderSummary() {
    var summaryData = OrderSummaryModel.fromJson(orderSummaryData);
    _orderSummarySink(summaryData);
  }

  @override
  dispose() {
    _orderSummaryController.close();
  }

}
