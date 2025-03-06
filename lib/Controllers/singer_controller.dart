import 'package:audio_player_test/Constant/url_const.dart';
import 'package:audio_player_test/Models/singers_model.dart';
import 'package:audio_player_test/Services/dio_connection.dart';
import 'package:get/get.dart';

class SingerController extends GetxController {
  RxBool isloading = false.obs;
  RxList<SingersModel> singerlist = RxList();

  @override
  void onInit() {
    super.onInit();
    showsingerslist();
  }

  showsingerslist() async {
    isloading.value = true;
    var response = await DioServices().getMethod(UrlConst.apiurl);

    if (response.statusCode == 200) {
      var singers = response.data['singers'];

      singerlist.value = (singers as List)
          .map((e) => SingersModel.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    isloading.value = false;
  }
}
