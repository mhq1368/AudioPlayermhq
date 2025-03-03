import 'package:audio_player_test/Controllers/music_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MusicList extends StatelessWidget {
  MusicList({super.key});
  final MusicsController musicsController = Get.put(MusicsController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Obx(
      () => SizedBox(
        width: double.infinity,
        height: size.height / 4,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: musicsController.musiclist.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: GestureDetector(
                onTap: () {},
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.network(
                    musicsController.musiclist[index].musicCover.toString(),
                    fit: BoxFit.cover,
                    width: size.width / 2,
                    height: size.height / 2,
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
