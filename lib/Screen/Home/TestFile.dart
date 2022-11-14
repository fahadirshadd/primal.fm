import 'dart:async';
import 'dart:convert';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:just_audio/just_audio.dart';
import 'dart:io' as io;
import 'package:just_audio_background/just_audio_background.dart';
import 'package:primal_fm/constants/api_model.dart';
import 'package:audio_service/audio_service.dart';
class MusicProvier extends ChangeNotifier {
  MusicProvier() {
    startTimer();
    Stream();
  }

  static const urlandroid = 'https://stream.primal.fm';
  static const urlios = 'https://stream.primal.fm/mp3';

  String? presongname;
  bool firstTime = true;
  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  bool isPaused = false;
  bool isPlaying = false;
  ApiResponse currentSong = ApiResponse();
  Timer? timer;
  String coverImage =
      "https:\/\/api.primal.fm\/media\/cover\/da9cabe4b3e70db9dfad.jpg";

  Stream() {
    // audioPlayer.playingStream.listen(
    //   (event) {
    isPlaying = true;
    notifyListeners();
    print("Stream has been called new value = $isPlaying");
    //   },
    // );
  }
  late MediaItem mediaItem;
  startTimer() async {
    timer = Timer.periodic(
      Duration(milliseconds: 100),
          (timer) async {
        final result = await http.get(
          Uri.parse("https://api.primal.fm"),
        );
        final body = jsonDecode(
          result.body,
        );
        final ApiResponse x = ApiResponse.fromJson(body["Stream"]);
        if (firstTime) {
          print("first time");
          currentSong = x;
          await initializemusic();
          firstTime = false;
          notifyListeners();
        }
        if (x.title != currentSong.title) {
          print("Song Changed: ${x.title}");
          currentSong = x;
          // audioPlayer.updateCurrentAudioNotification(metas: Metas(
          //   id: "",
          //   image: MetasImage.network(''),
          //   artist: '',
          //   title: '',
          //
          // ));
          audioPlayer.updateCurrentAudioNotification(
              metas: Metas(
                id: songTitle.value!,
                title: currentSong.name,
                // displayTitle: currentSong.name, //"PRIMAL.FM - UNITED AS ONE",
                // artUri: Uri.parse(
                //   currentSong.cover!,
                // ),
                image: MetasImage.network(currentSong.cover!),
                album: currentSong.artist!,
                artist: currentSong.title!,
                // displaySubtitle:
                // "${currentSong.artist! + " - " + currentSong.title!}",
              )
          );

          // firsttimeplayed = true;
          final bool temp = isPlaying;

          notifyListeners();
        } else {}
      },
    );
  }

  // setPlayer(id, ablum, title, displaytitle, arturi, artist) async {
  //   // print();
  //   if (!firsttimeplayed) {
  //     presongname = displaytitle;
  //     firsttimeplayed = true;
  //     initializemusic(id, ablum, title, displaytitle, arturi, artist);
  //   }

  //   if (firsttimeplayed) {
  //     if (presongname != displaytitle) {
  //       presongname = displaytitle;
  //       await audioPlayer.stop().then((value) async {
  //         await initializemusic(id, ablum, title, displaytitle, arturi, artist);
  //       }).then((value) {
  //         // audioPlayer.play();
  //       });
  //     }
  //   }
  // }


  @override
  Future<void> play() async {
    MediaItem(
      id: currentSong.title!,
      title: "",
      displayTitle: currentSong.name, //"PRIMAL.FM - UNITED AS ONE",
      artUri: Uri.parse(
        currentSong.cover!,
      ),
      displaySubtitle:
      "${currentSong.artist! + " - " + currentSong.title!}",
    );

    audioPlayer.play();
  }

  RxString songTitle="".obs;

  initializemusic() async {
    songTitle.value=currentSong.title.toString();
    // audioPlayer.
    if (!firstTime) {
      print("Resetting the Player");

      await audioPlayer.stop();
    }
    // audioPlayer = AudioPlayer();
    if (io.Platform.isAndroid) {
      // await audioPlayer.;
      await audioPlayer.open(
        Audio.liveStream(urlandroid),
        //Uri.parse(),
        showNotification: true,

      );
      audioPlayer.updateCurrentAudioNotification(
          metas: Metas(
            id: songTitle.value!,
            title: currentSong.name,
            // displayTitle: currentSong.name, //"PRIMAL.FM - UNITED AS ONE",
            // artUri: Uri.parse(
            //   currentSong.cover!,
            // ),
            image: MetasImage.network(currentSong.cover!),
            album: currentSong.artist!,
            artist: currentSong.title!,
            // displaySubtitle:
            // "${currentSong.artist! + " - " + currentSong.title!}",
          )
      );
      notifyListeners();
    } else {
      await audioPlayer.open(
        Audio.liveStream(urlios),
      );
    }
    notifyListeners();
  }

  playaudio() {
    audioPlayer.play();
    print("Play");
    isPlaying = true;
    notifyListeners();
  }

  pause() {
    audioPlayer.pause();
    isPlaying = false;
    print("Pause");
    notifyListeners();
  }

  stop() {
    audioPlayer.stop();
    isPlaying = false;
    print("Stop");
    notifyListeners();
  }

  //  a() {
  //   audioPlayer.playingStream.listen((event) {
  //    return event;
  //   });
  // }

  @override
  void dispose() {
    print("Dispose called");
    audioPlayer.dispose();
    timer!.cancel();
    super.dispose();
  }
}
