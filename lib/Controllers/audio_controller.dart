import 'package:audio_player_test/Constant/url_const.dart';
import 'package:audio_player_test/Models/audio_model.dart';
import 'package:audio_player_test/Services/dio_connection.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class MusicControllerT extends GetxController {
  // var audioUrl = 'https://www.dlfile.qassabi.ir/api/Al-e%20Yasin.mp3';
  RxList<AudioModel> audiolist = RxList();
  final player = AudioPlayer();
  RxBool isPlaying = false.obs;
  late var playList;
  RxInt currentpodcast = (-1).obs;
  RxBool loading = false.obs;
  @override
  void onInit() async {
    super.onInit();
    playList = ConcatenatingAudioSource(useLazyPreparation: true, children: []);
    player.currentIndexStream.listen((index) {
      if (index != null) {
        currentpodcast.value = index;
        print("🎵 آهنگ در حال پخش: ${currentpodcast.value}");
      }
    });
    await playaudio();
    await player.setAudioSource(playList,
        initialIndex: 0, initialPosition: Duration.zero);
  }

  playaudio() async {
    loading.value = true;
    var response = await DioServices().getMethod(UrlConst.apiurl);
    var musics = response.data["musics"];
    if (response.statusCode == 200) {
      for (var elements in response.data["musics"]) {
        audiolist.add(AudioModel.fromJson(elements));
        playList.add(AudioSource.uri(
            Uri.parse(AudioModel.fromJson(elements).podcastUrl!)));
      }

      print(musics);
      loading.value = false;
    }
  }
}
