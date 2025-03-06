import 'dart:async';

import 'package:audio_player_test/Services/dio_connection.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../constant/url_const.dart'; // مسیر درست رو تنظیم کن

class SmsVerifyController extends GetxController {
  var isLoading = false.obs;
  var resultMessage = ''.obs;
  var remainSeconds = 0.obs;
  Timer? _timer;

  void startTimer() {
    remainSeconds.value = 60;
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainSeconds.value > 0) {
        remainSeconds.value--;
      } else {
        timer.cancel();
      }
    });
  }

  Future<void> sendVerificationCode(String mobileNumber) async {
    if (mobileNumber.isEmpty || mobileNumber.length != 10) {
      resultMessage.value = "شماره موبایل نامعتبر است";
      return;
    }

    isLoading.value = true;
    resultMessage.value = '';

    // try {
    try {
      final response =
          await DioServices().postMethod(UrlConst.sendCodeToUser, mobileNumber);
      resultMessage.value = response.data['message'] ?? 'کد تایید ارسال شد';
      startTimer();
    } on DioException catch (e) {
      resultMessage.value = _handleDioError(e);
    } catch (e) {
      resultMessage.value = 'خطای غیرمنتظره: $e';
    } finally {
      isLoading.value = false;
    }

    isLoading.value = false;
  }

  String _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return 'زمان اتصال به پایان رسید';
      case DioExceptionType.sendTimeout:
        return 'خطا در ارسال اطلاعات';
      case DioExceptionType.receiveTimeout:
        return 'دریافت اطلاعات طول کشید';
      case DioExceptionType.badResponse:
        return 'پاسخ نامعتبر از سرور';
      case DioExceptionType.cancel:
        return 'درخواست لغو شد';
      case DioExceptionType.connectionError:
        return 'خطا در اتصال به اینترنت';
      case DioExceptionType.unknown:
      default:
        return 'خطای نامشخص: ${e.message}';
    }
  }
}

// class SmsVerifyController extends GetxController {
//   final Dio _dio = Dio(); // دیو برای ارسال درخواست

//   RxBool isLoading = false.obs; // مدیریت لودینگ
//   var resultMessage = ''.obs; // پیام‌های دریافتی

//   void sendVerificationCode(String mobile) async {
//     // اینجا قراره درخواست به API رو بنویسی
//     if (mobile.isEmpty || mobile.length != 10) {
//       resultMessage.value = "شماره موبایل نامعتبر است";
//       return;
//     }

//     isLoading.value = true; // فعال کردن لودینگ

//     try {
//       final response = await _dio.post(
//         'http://192.168.0.106:5272/api/SmsVerify/send', // آدرس درست رو جایگزین کن
//         data: {"mobile": mobile.trim()},
//       );

//       resultMessage.value = response.data['message'] ?? 'کد تایید ارسال شد';
//     } catch (e) {
//       resultMessage.value = 'خطا در ارسال کد';
//     } finally {
//       isLoading.value = false; // خاموش کردن لودینگ
//     }
//   }
// }

// class MobileSendCodeController extends GetxController {
//   DioServices dio = DioServices();
//   final resultMessage = ''.obs;
//   final isloading = false.obs;

//   sendVeryficationCode(String mobileNumber) async {
//     if (mobileNumber.isEmpty || mobileNumber.length != 10) {
//       resultMessage.value = "شماره نامعبتر می باشد";
//       return;
//     }
//     isloading.value = true;
//     final url = 'http://192.168.0.106:5272/api/SmsVerify/send';
//     final data = {
//       "mobile": mobileNumber,
//       "templateId": 0,
//       "parameters": [
//         {"key": "string", "value": "string"}
//       ]
//     };

//   }
// }
