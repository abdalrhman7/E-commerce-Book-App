import 'package:book_store/core/network/wep_services.dart';
import 'package:book_store/feature/home/date/model/products.dart';

import '../../../../core/network/api_constants.dart';

class BookRepo {
  final WebService webService;

  BookRepo(this.webService);

  Future<List<Books>> getAllBooks() async {
    var response = await webService.getData(endPoint: ApiConstants.getAllBooks);
    List<Books> products = _getAllBooks(response.data);
    return products;
  }

  List<Books> _getAllBooks(Map<String, dynamic> data) {
    List<Books> books = [];

    for (var book in data['data']['products']) {
      books.add(Books.fromJson(book));
    }
    return books;
  }
}
