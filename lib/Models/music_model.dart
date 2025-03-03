class MusicModel {
  int? musicId;
  int? singerId;
  String? musicName;
  String? musicCover;
  String? musicUrl;

  MusicModel({
    this.musicId,
    this.musicCover,
    this.musicName,
    this.musicUrl,
    this.singerId,
  });

  MusicModel.fromJson(Map<String, dynamic> items) {
    musicId = items['musicId'];
    singerId = items['singerid'];
    musicName = items['musicName'];
    musicCover = items['musiccover'];
    musicUrl = items['musicurl'];
  }
}
