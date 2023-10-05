import 'package:book_store/core/network/wep_services.dart';

import '../../../../core/network/api_constants.dart';
import '../../../home/date/model/products.dart';

class FavoriteRepo{
  final WebService webService ;

  FavoriteRepo(this.webService);

  Future<List<Books>> getFavorite() async {
    var response =
    await webService.getData(endPoint: ApiConstants.getFavorite );
    List<Books> favorites = _getProductsList(response.data);
    return favorites;
  }

  List<Books> _getProductsList(Map<String, dynamic> data) {
    List<Books> favorites = [];

    for (var favorite in data['data']['data']) {
      favorites.add(Books.fromJson(favorite));
    }
    return favorites;
  }
}