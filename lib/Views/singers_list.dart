import 'package:audio_player_test/Controllers/singer_controller.dart';
import 'package:audio_player_test/Views/musics_list_singer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingersList extends StatelessWidget {
  SingersList({super.key});
  final SingerController singerController = Get.put(SingerController());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Obx(
      () => SizedBox(
        width: double.infinity,
        height: size.height / 4,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: singerController.singerlist.length,
          itemBuilder: (context, index) {
            var singer = singerController.singerlist[index]; // خواننده موردنظر
            return Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: GestureDetector(
                onTap: () {
                  Get.to(() => MusicListSinger(singerId: singer.singerid!));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.network(
                    singerController.singerlist[index].singerpicurl.toString(),
                    fit: BoxFit.cover,
                    width: size.width / 2,
                    height: size.height / 4,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
