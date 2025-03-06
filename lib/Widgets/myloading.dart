import 'package:audio_player_test/Constant/style.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

SpinKitFadingFour mainLoading(double appHeight) {
  return SpinKitFadingFour(
    color: MyColors.loadingcolor,
    size: appHeight / 15,
  );
}
