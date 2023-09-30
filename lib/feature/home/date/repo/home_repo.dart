import 'package:book_store/core/network/wep_services.dart';
import 'package:book_store/feature/home/date/model/Category.dart';
import 'package:book_store/feature/home/date/model/products.dart';
import 'package:dio/dio.dart';

import '../../../../core/network/api_constants.dart';

class HomeRepo {
  final WebService webService;

  HomeRepo(this.webService);

  Future<List<Products>> getBestSeller() async {
    var response =
        await webService.getData(endPoint: ApiConstants.bestSeller);
    List<Products> products = _getProductsList(response.data);
    return products;
  }

  Future<List<Products>> getNewArrival() async {
    var response =
    await webService.getData(endPoint: ApiConstants.newArrivals);
    List<Products> products = _getProductsList(response.data);
    return products;
  }

  Future<List<Category>> getCategories() async {
    var response =
    await webService.getData(endPoint: ApiConstants.allCategory);
    List<Category> categories = _getCategoriesList(response.data);
    return categories;
  }




  List<Products> _getProductsList(Map<String, dynamic> data) {
    List<Products> products = [];

    for (var product in data['data']['products']) {
      products.add(Products.fromJson(product));
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
