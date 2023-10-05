import 'package:dio/dio.dart';

import '../local_database/secure_storage.dart';

class WebService {
  final Dio _dio;
  final SecureStorage secureStorage;

  WebService(this._dio , this.secureStorage);

  Future<String?> getToken() async {
    return await secureStorage.readSecureData('token');
  }

  Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? data,
  }) async {
    final String? token = await getToken();
    Response response = await _dio.get(endPoint,
        queryParameters: data,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${token ?? ''}',
          },
        ));
    return response;
  }

  Future<Response> postData({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    final String? token = await getToken();
    Response response = await _dio.post(endPoint,
        data: data,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${token ?? ''}',
          },
        ));
    return response;
  }
}
