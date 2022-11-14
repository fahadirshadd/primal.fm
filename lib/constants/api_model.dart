import 'package:get/get.dart';

class ApiResponse {
  String? artist;
  String? title;
  String? cover;
  String? name;
  String? currentStreamer;
  bool? isDJ;
  String? starttime;
  String? streamOpus;
  String? streamMp3;
  int? listeners;
  String? genre;

  ApiResponse(
      {this.artist,
      this.title,
      this.cover,
      this.name,
      this.currentStreamer,
      this.isDJ,
      this.starttime,
      this.streamOpus,
      this.streamMp3,
      this.listeners,
      this.genre});

  ApiResponse.fromJson(Map<String, dynamic> json) {
    artist = json['artist'];
    title = json['title'];
    cover = json['cover'];
    name = json['name'];
    currentStreamer = json['current_streamer'];
    isDJ = json['isDJ'];
    starttime = json['starttime'];
    streamOpus = json['stream_opus'];
    streamMp3 = json['stream_mp3'];
    listeners = json['listeners'];
    genre = json['genre'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['artist'] = this.artist;
    data['title'] = this.title;
    data['cover'] = this.cover;
    data['name'] = this.name;
    data['current_streamer'] = this.currentStreamer;
    data['isDJ'] = this.isDJ;
    data['starttime'] = this.starttime;
    data['stream_opus'] = this.streamOpus;
    data['stream_mp3'] = this.streamMp3;
    data['listeners'] = this.listeners;
    data['genre'] = this.genre;
    return data;
  }
}



class ApiResponseRx {
  RxString? artist="".obs;
  RxString? title;
  RxString? cover;
  RxString? name;
  RxString? currentStreamer;
  RxBool? isDJ;
  RxString? starttime;
  RxString? streamOpus;
  RxString? streamMp3;
  RxInt? listeners;
  RxString? genre;

  ApiResponseRx(
      {this.artist,
        this.title,
        this.cover,
        this.name,
        this.currentStreamer,
        this.isDJ,
        this.starttime,
        this.streamOpus,
        this.streamMp3,
        this.listeners,
        this.genre});

  ApiResponseRx.fromJson(Map<String, dynamic> json) {
    artist?.value = json['artist'];
    title?.value = json['title'];
    cover?.value = json['cover'];
    name?.value = json['name'];
    currentStreamer?.value = json['current_streamer'];
    isDJ?.value = json['isDJ'];
    starttime?.value = json['starttime'];
    streamOpus?.value = json['stream_opus'];
    streamMp3?.value = json['stream_mp3'];
    listeners?.value = json['listeners'];
    genre?.value = json['genre'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['artist'] = this.artist;
    data['title'] = this.title;
    data['cover'] = this.cover;
    data['name'] = this.name;
    data['current_streamer'] = this.currentStreamer;
    data['isDJ'] = this.isDJ;
    data['starttime'] = this.starttime;
    data['stream_opus'] = this.streamOpus;
    data['stream_mp3'] = this.streamMp3;
    data['listeners'] = this.listeners;
    data['genre'] = this.genre;
    return data;
  }
}
