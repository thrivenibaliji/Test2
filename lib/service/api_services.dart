
/*import 'package:dio/dio.dart';

import 'package:triveni_3399/utils/server_constants.dart';

class ApiServices {
  final Dio _dio = Dio();

  ApiServices() {
    _dio.options.baseUrl = ServerConstants.baseUrl;
  }

  Future<dynamic> getCall(String url) async {
    try {
      final response = await _dio.get(url);
      return response;
    } catch (e) {
      return e;
    }
  }

  Future<dynamic> postCall(String path, dynamic data) async {
    try {
      final response = await _dio.post(path, data: data);
      return response;
    } catch (e) {
      return e;
    }
  }

  Future<dynamic> postCallWithFormData(String path, dynamic data) async {

    
    print(path);
    print(data);
    final formData = FormData.fromMap(data);
    try {
      var dio = Dio();
      var response = await dio.request(
        'https://iz7kupp3qbqyzrts5om4bw7p3q0pmscg.lambda-url.eu-north-1.on.aws/api/cars/add/6767c2612f27cbc29511b3fd',
        options: Options(
          method: 'POST',
        ),
        data: formData,
      );
      // final response = await _dio.post(path, data: formData);
      return response;
    } catch (e) {
      return e;
    }
  }

  static signout() {}
  
  
} */
