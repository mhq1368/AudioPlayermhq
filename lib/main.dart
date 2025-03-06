import 'package:audio_player_test/Controllers/theme_controller.dart';
// import 'package:audio_player_test/Views/home_page.dart';
import 'package:audio_player_test/Views/sms_verify_send.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(ThemeController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Locale('fa'),
      theme: lightTheme,
      darkTheme: darkTheme,
      home: SmsVerifyPage(),
    );
  }
}
