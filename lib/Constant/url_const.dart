class UrlConst {
  static String baseapi = "http://192.168.0.106:5272/api/";
  // static const String apiurl = 'http://10.0.2.2:5129/api/Podcast'; //لوکال هاست و نمایش روی وب
  static String apiurl =
      '${baseapi}Singers'; //لوکال هاست و نمایش در دیوایس واقعی

  static String apilasttenmusic = "${baseapi}Musics/GetLastTenRecords";
  static String apimusiclistsinger = "${baseapi}Musics/";
}
