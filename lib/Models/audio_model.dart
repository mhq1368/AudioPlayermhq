class AudioModel {
  int? podcastId = 0;
  String? podcastTitle = '';
  String? podcastUrl = '';

  AudioModel({this.podcastId, this.podcastTitle, this.podcastUrl});

  AudioModel.fromJson(Map<String, dynamic> items) {
    podcastId = items['podcastId'];
    podcastTitle = items['podcastTitle'];
    podcastUrl = items['podcastUrl'];
  }
}
