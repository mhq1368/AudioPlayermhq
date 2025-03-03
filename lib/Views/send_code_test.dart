import 'package:flutter/material.dart';

class SendCodeTest extends StatelessWidget {
  const SendCodeTest({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Center(
        child: ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: const Text('این یک پیام Snackbar است'),
                duration: const Duration(seconds: 3),
                action: SnackBarAction(
                  label: 'بستن',
                  onPressed: () {
                    // کد مربوط به دکمه اکشن
                  },
                ),
              ));
            },
            child: Text("ورود کاربر")),
      ),
    )));
  }
}
