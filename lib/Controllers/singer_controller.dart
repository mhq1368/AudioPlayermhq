import 'package:audio_player_test/Constant/url_const.dart';
import 'package:audio_player_test/Models/singers_model.dart';
import 'package:audio_player_test/Services/dio_connection.dart';
import 'package:get/get.dart';

class SingerController extends GetxController {
  RxBool loading = false.obs;
  RxList<SingersModel> singerlist = RxList();

  @override
  void onInit() {
    super.onInit();
    showsingerslist();
  }

  showsingerslist() async {
    loading.value = true;
    var response = await DioServices().getMethod(UrlConst.apiurl);

    if (response.statusCode == 200) {
      var singers = response.data['singers'];
      for (var elements in singers) {
        singerlist.add(SingersModel.fromJson(elements));
      }
    }
    loading.value = false;
  }
}
