import 'package:book_store/core/network/api_constants.dart';
import 'package:book_store/core/network/wep_services.dart';

class ProductDetailsRepo {
  final WebService webService;

  ProductDetailsRepo(this.webService);

  Future<void> addToCart(
      {required int productId}) async {
    await webService.postData(
      endPoint: ApiConstants.addToCart,
      data: {'product_id': productId},
    );
  }

  Future<void> addToFavorite(
      {required int productId}) async {
    await webService.postData(
      endPoint: ApiConstants.addToFavorite,
      data: {'product_id': productId},
    );
  }

  Future<void> removeFromFavorite(
      {required int productId}) async {
    await webService.postData(
      endPoint: ApiConstants.removeFromFavorite,
      data: {'product_id': productId},
    );
  }
}
