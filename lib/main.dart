import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:page_transition/page_transition.dart';
import 'package:primal_fm/Screen/Home/music_provider.dart';
import 'package:primal_fm/Screen/sleeptimer.dart';
import 'package:primal_fm/sleep_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screen/StartScreen/StartScreen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await AndroidAlarmManager.initialize();
  SharedPreferences _prefs = await SharedPreferences.getInstance();

  _prefs.setString('email', 'admin123@gmail.com');
  _prefs.setString('password', 'admin123');

  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true,
  );
  runApp(const PrimalApp());
}

class PrimalApp extends StatelessWidget {
  const PrimalApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: ((context) => SleepTimerProvider()),
        ),
        ChangeNotifierProvider(
          lazy: false,
          create: ((context) => MusicProvier()),
        ),
      ],
      child: GetMaterialApp(
        title: "Primal Fm",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          sliderTheme: SliderThemeData(),
        ),
        home: StartScreenpage(),
      ),
    );
  }
}
