import 'package:book_store/core/network/api_constants.dart';
import 'package:book_store/core/network/wep_services.dart';

import '../model/my_order_model.dart';

class MyOrderRepo {
  final WebService webService;

  MyOrderRepo(this.webService);

  Future<List<MyOrderModel>> getMyOrders() async {
    var response = await webService.getData(endPoint: ApiConstants.myOrders);
    List<MyOrderModel> myOrders = _getMyOrdersList(response.data);
    return myOrders;
  }

  List<MyOrderModel> _getMyOrdersList(Map<String, dynamic> data) {
    List<MyOrderModel> myOrders = [];
    for (var order in data['data']['orders']) {
      myOrders.add(MyOrderModel.fromJson(order));
    }
    return myOrders;
  }
}
