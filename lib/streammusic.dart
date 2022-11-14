import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:just_audio/just_audio.dart';
import 'dart:io' as io;

import 'package:just_audio_background/just_audio_background.dart';

class musicModel {
  static String? presongname;
  static bool firsttimeplayed = false;
  static late AudioPlayer audioPlayer;
  bool isPaused = false;

  static Stream<http.Response> GetStream() async* {
    yield* Stream.periodic(Duration(milliseconds: 500), (_) {
      return http.get(Uri.parse('https://primal.fm/'));
    }).asyncMap((event) async {
      print("stream call back is called");
      var document;
      event.then((value) {
        document = parser.parse(value.body);

        print(
          document
              .getElementsByClassName('container')[0]
              .children[0]
              .children[1]
              .children[0]
              .children[3]
              .text
              .toString()
              .toUpperCase(),
        );

        setPlayer(
          document
              .getElementsByClassName('container')[0]
              .children[0]
              .children[1]
              .children[0]
              .children[3]
              .text
              .toString()
              .toUpperCase(),
          document
              .getElementsByClassName('container')[0]
              .children[0]
              .children[1]
              .children[0]
              .children[3]
              .text
              .toString()
              .toUpperCase(),
          document
              .getElementsByClassName('container')[0]
              .children[0]
              .children[1]
              .children[0]
              .children[2]
              .text
              .toString()
              .toUpperCase(),
          document
              .getElementsByClassName('container')[0]
              .children[0]
              .children[1]
              .children[0]
              .children[2]
              .text
              .toString()
              .toUpperCase(),
          Uri.parse(
            '${document.getElementsByClassName('container')[0].getElementsByClassName('cover-container')[0].querySelector('img').attributes['src']}',
          ),
          document
              .getElementsByClassName('container')[0]
              .children[0]
              .children[1]
              .children[0]
              .children[3]
              .text
              .toString()
              .toUpperCase(),
        );
      });
      return await event;
    });
  }

  static setPlayer(id, ablum, title, displaytitle, arturi, artist) async {
    // print();
    if (!firsttimeplayed) {
      presongname = displaytitle;
      firsttimeplayed = true;
      initializemusic(id, ablum, title, displaytitle, arturi, artist);
    }

    if (firsttimeplayed) {
      if (presongname != displaytitle) {
        presongname = displaytitle;
        await audioPlayer.stop().then((value) async {
          await initializemusic(id, ablum, title, displaytitle, arturi, artist);
        }).then((value) {
          // audioPlayer.play();
        });
      }
    }
  }

  static const urlandroid = 'https://stream.primal.fm';
  static const urlios = 'https://stream.primal.fm/mp3';
  static initializemusic(id, ablum, title, displaytitle, arturi, artist) async {
    audioPlayer = AudioPlayer();
    if (io.Platform.isAndroid) {
      await audioPlayer.setAudioSource(
        AudioSource.uri(
          Uri.parse(urlandroid),
          tag:
              // MediaItem(
              //   // Specify a unique ID for each media item:
              //   id: id, // Metadata to display in the notification:
              //   album: ablum,
              //   title: title,
              //   displayTitle: "PRIMAL_FM - UNITED AS ONE",
              //   artUri: arturi,
              //   displaySubtitle: displaytitle,
              //   displayDescription: "Hey there this is the description",
              //   artist: "artist",
              //   extras: {"Name": "imaasfdd"},
              // ),
              MediaItem(
                  // Specify a unique ID for each media item:
                  // Metadata to display in the notification:
                  id: id,
                  album: ablum,
                  title: "artist - Name", // Showing in my case
                  // displayDescription:
                  //     " UNITED AS ONE", // shown on very top in front of app name
                  displayTitle:
                      "PRIMAL.FM - UNITED AS ONE", //title, //This is the first Bold line
                  artUri: arturi,
                  displaySubtitle:
                      "${title + " " + artist}" // plus artist names
                  // "artist name", // this is the artist name below the first line

                  // artist: "artist",
                  // extras: {"Name": "imaasfdd"},
                  ),
        ),
      );
    } else {
      await audioPlayer.setUrl(
        urlios,
      );
    }
  }

  static playaudio() {
    audioPlayer.play();
  }

  static pause() {
    audioPlayer.pause();
  }

  static stop() {
    audioPlayer.stop();
  }
}
