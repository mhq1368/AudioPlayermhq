import 'dart:async';

import 'package:audio_player_test/Controllers/mobile_send_code_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SmsVerifyPage extends StatelessWidget {
  SmsVerifyPage({super.key});
  final SmsVerifyController smsVC = Get.put(SmsVerifyController());
  final TextEditingController _mobilephone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "ارسال کد تایید",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          height: size.height / 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    "شماره همراه",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ),
              SizedBox(
                height: size.height / 100,
              ),
              //تکست فیلد برای ورود شماره همراه کاربر
              Padding(
                padding: const EdgeInsets.only(right: 50, left: 50),
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  width: size.width / 1,
                  // height: size.height / 4,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: _mobilephone,
                    autocorrect: true,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "نمونه درست : 9121234567",
                        hintStyle: Theme.of(context).textTheme.labelMedium),
                    cursorColor: Colors.black45,
                  ),
                ),
              ),
              SizedBox(
                height: size.height / 20,
              ),
              //دکمه تایید ارسال کد
              Center(
                  child: ElevatedButton(
                      style: Theme.of(context).elevatedButtonTheme.style,
                      onPressed: () {
                        if (smsVC.isLoading.value ||
                            smsVC.remainSeconds.value > 0) {
                          null;
                        } else {
                          smsVC.sendVerificationCode(_mobilephone.text);
                        }
                      },
                      child: Obx(() {
                        return smsVC.isLoading.value == true ||
                                smsVC.remainSeconds.value > 0
                            ? Text(
                                smsVC.remainSeconds.value.toString(),
                                style: Theme.of(context).textTheme.labelSmall,
                              )
                            : Text(
                                "ارسال کد",
                                style: Theme.of(context).textTheme.displaySmall,
                              );
                      }))),
              Obx(() => Text(smsVC.resultMessage.value)),
            ],
          ),
        ),
      ),
    );
  }
}
