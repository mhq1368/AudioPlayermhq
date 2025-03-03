import 'package:audio_player_test/Controllers/music_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MusicListSinger extends StatelessWidget {
  final int singerId; // دریافت آی‌دی خواننده
  MusicListSinger({super.key, required this.singerId});
  final MusicsController controller = Get.put(MusicsController());
  @override
  Widget build(BuildContext context) {
    controller.getmusiclistbysinger(singerId);

    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
          child: Stack(children: [
        SizedBox(
          height: size.height * 1,
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: size.height / 3,
                width: double.infinity,
                child: Obx(
                  () => ListView.builder(
                      itemCount: controller.musiclistbysinger.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () async {},
                            child: Obx(
                              () => Text(
                                "${controller.musiclistbysinger[index].musicName!} ",
                              ),
                            ));
                      }),
                ),
              ),
            ],
          ),
        ),
      ])),
    );
  }
}
