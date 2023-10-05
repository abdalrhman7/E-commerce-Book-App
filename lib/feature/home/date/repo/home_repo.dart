import 'package:book_store/core/network/wep_services.dart';
import 'package:book_store/feature/home/date/model/Category.dart';
import 'package:book_store/feature/home/date/model/products.dart';

import '../../../../core/network/api_constants.dart';

class HomeRepo {
  final WebService webService;

  HomeRepo(this.webService);

  Future<List<Books>> getBestSeller() async {
    var response =
        await webService.getData(endPoint: ApiConstants.bestSeller);
    List<Books> products = _getProductsList(response.data);
    return products;
  }

  Future<List<Books>> getNewArrival() async {
    var response =
    await webService.getData(endPoint: ApiConstants.newArrivals);
    List<Books> products = _getProductsList(response.data);
    return products;
  }

  Future<List<Category>> getCategories() async {
    var response =
    await webService.getData(endPoint: ApiConstants.allCategory);
    List<Category> categories = _getCategoriesList(response.data);
    return categories;
  }




  List<Books> _getProductsList(Map<String, dynamic> data) {
    List<Books> products = [];

    for (var product in data['data']['products']) {
      products.add(Books.fromJson(product));
    }
    return products;
  }

  List<Category> _getCategoriesList(Map<String, dynamic> data) {
    List<Category> categories = [];

    for (var product in data['data']['categories']) {
      categories.add(Category.fromJson(product));
    }
    return categories;
  }
}
