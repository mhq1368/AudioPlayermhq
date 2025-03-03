import 'package:audio_player_test/Constant/url_const.dart';
import 'package:audio_player_test/Models/music_model.dart';
import 'package:audio_player_test/Services/dio_connection.dart';
import 'package:get/get.dart';

class MusicsController extends GetxController {
  RxBool loading = false.obs;
  RxInt currentpodcast = (-1).obs;
  RxList<MusicModel> musiclist = RxList();
  RxList<MusicModel> musiclistbysinger = RxList();
  int singerid = 0;
  @override
  void onInit() {
    super.onInit();
    getmusiclist();
    getmusiclistbysinger(singerid);
  }

  getmusiclist() async {
    loading.value = true;
    var response = await DioServices().getMethod(UrlConst.apilasttenmusic);

    if (response.statusCode == 200) {
      var musics = response.data['lastTenMusics'];
      for (var elements in musics) {
        musiclist.add(MusicModel.fromJson(elements));
      }
      loading.value = false;
    }
  }

  getmusiclistbysinger(singerid) async {
    musiclistbysinger.clear(); // پاک کردن لیست قبلی

    var response1 = await DioServices()
        .getMethod(UrlConst.apimusiclistsinger + singerid.toString());
    if (response1.statusCode == 200) {
      for (var items in response1.data['musics']) {
        musiclistbysinger.add(MusicModel.fromJson(items));
      }
    }
  }
}
