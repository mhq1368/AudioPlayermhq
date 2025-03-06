import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';

final Dio dio = Dio(BaseOptions(
  connectTimeout: const Duration(seconds: 15),
  receiveTimeout: const Duration(seconds: 15),
  sendTimeout: const Duration(seconds: 15),
));

class DioServices {
  // DioServices() {
  //   // غیرفعال کردن بررسی SSL
  //   (dio.httpClientAdapter as dynamic).onHttpClientCreate =
  //       (HttpClient client) {
  //     client.badCertificateCallback =
  //         (X509Certificate cert, String host, int port) => true;
  //     return client;
  //   };
  // }
  Future<dynamic> getMethod(String url) async {
    dio.options.headers['content-Type'] = 'application/json'; //تعیین نوع هدر
    return await dio
        .get(url,
            options: Options(responseType: ResponseType.json, method: 'GET'))
        .then((responseval) {
      log(responseval.toString());
      return responseval;
    });
  }

  Future<dynamic> postMethod(String url, String mobile) async {
    return await dio.post(url, data: {
      "mobile": mobile.trim(),
      "templateId": 0,
      "parameters": [
        {"key": "string", "value": "string"}
      ]
    });
  }
}
