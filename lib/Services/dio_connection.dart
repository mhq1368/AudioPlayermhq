import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'dart:convert';

final Dio dio = Dio();

class DioServices {
  DioServices() {
    // غیرفعال کردن بررسی SSL
    (dio.httpClientAdapter as dynamic).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }
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

//
  Future<void> sendVerificationCode(String email) async {
    Dio dio = Dio();

    try {
      final response = await dio.post(
        'http://localhost:5272/api/Auth/send-code',
        data: jsonEncode({'UserEmail': email}),
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      if (response.statusCode == 200) {
        print('کد ارسال شد');
      } else {
        print('خطا: ${response.data}');
      }
    } catch (e) {
      print('خطا: $e');
    }
  }
}
