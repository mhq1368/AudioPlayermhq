import 'package:audio_player_test/Controllers/singer_controller.dart';
import 'package:audio_player_test/Views/music_list.dart';
import 'package:audio_player_test/Views/singers_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final SingerController singerController = Get.put(SingerController());
  final GlobalKey<ScaffoldState> drawer = GlobalKey();
  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      key: drawer,
      drawer: Drawer(
        backgroundColor: Theme.of(context).drawerTheme.backgroundColor,
      ),
      appBar: AppBar(
          title: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "آوادیس",
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.search))
          ],
        ),
      )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 20, 5),
              child: Text(
                "خوانندگان برتر",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            SingersList(),
            //صداهای تازه
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 20, 5),
              child: Text(
                "صداهای تازه",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            MusicList()
          ],
        ),
      ),
    ));
  }
}
