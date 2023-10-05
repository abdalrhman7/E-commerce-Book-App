import 'package:book_store/core/network/api_constants.dart';
import 'package:book_store/core/network/wep_services.dart';

import '../model/cheackout_model.dart';
import '../model/governorates_model.dart';
import '../model/placeorder_model.dart';

class CheckoutRepo {
  final WebService webService;

  CheckoutRepo(this.webService);

  Future<User> getUserInfo() async {
    var response = await webService.getData(endPoint: ApiConstants.checkout);
    User user = User.fromJson(response.data['data']['user']);
    return user;
  }

  Future<String> getCheckoutTotalPrice() async {
    var response = await webService.getData(endPoint: ApiConstants.checkout);
    return response.data['data']['total'];
  }

  Future<void> submitOrder(SubmitOrder submitOrder) async {
    await webService.postData(endPoint: ApiConstants.submitOrder , data: submitOrder.toJson());
  }

  Future<List<GovernoratesModel>> getGovernorates() async {
    var response =
        await webService.getData(endPoint: ApiConstants.getGovernorates);
    List<GovernoratesModel> governorates = _getGovernorates(response.data);
    return governorates;
  }

  List<GovernoratesModel> _getGovernorates(Map<String, dynamic> data) {
    List<GovernoratesModel> governorates = [];
    for (var item in data['data']) {
      governorates.add(GovernoratesModel.fromJson(item));
    }
    return governorates;
  }
}
