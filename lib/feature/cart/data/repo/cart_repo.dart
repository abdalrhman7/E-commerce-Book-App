import 'package:book_store/core/network/api_constants.dart';
import 'package:book_store/core/network/wep_services.dart';

import '../model/cart_model.dart';

class CartRepo {
  final WebService webService;

  CartRepo(this.webService);

  Future<List<CartItems>> getAllCartItems() async {
    final response = await webService.getData(endPoint: ApiConstants.showCart);
    List<CartItems> carts = _getAllCarts(response.data);
    return carts;
  }

  List<CartItems> _getAllCarts(Map<String, dynamic> data) {
    List<CartItems> carts = [];

    for (var item in data['data']['cart_items']) {
      carts.add(CartItems.fromJson(item));
    }
    return carts;
  }

  Future<String> getTotalPrice() async {
    var response = await webService.getData(endPoint: ApiConstants.showCart);
    return response.data['data']['total'];
  }

  Future<void> removeFromCart(int itemId) async {
    await webService.postData(
      endPoint: ApiConstants.removeFromCart,
      data: {'cart_item_id': itemId},
    );
  }

  Future<void> updateCart(int itemId, int quantity) async {
    await webService.postData(
      endPoint: ApiConstants.updateCart,
      data: {'cart_item_id': itemId, 'quantity': quantity},
    );
  }
}
