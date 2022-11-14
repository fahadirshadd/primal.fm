import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:primal_fm/timer_functions.dart';
import './streammusic.dart';

class SleepTimerProvider extends ChangeNotifier {
  SleepTimerProvider() {
    print("Sleep Timer Provider has been initialzed");
    minutesTime = 0;
    secondsTime = 0;
    isActive = false;
    timerString = "00:00:00";
  }
  int minutesTime = 0;
  int secondsTime = 0;
  bool isActive = false;
  String timerString = "00:00:00";
  Timer? countDownTimer;

  startTimer() {
    print("Timer Started");
    if (countDownTimer != null && countDownTimer!.isActive) {
      countDownTimer!.cancel();
    }
    isActive = true;
    countDownTimer = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        if (secondsTime > 0) {
          secondsTime--;
          timerString = timerFormat(secondsTime.toString());
          // setState(() {});
          notifyListeners();
        } else {
          stopTimer();
          stopMusic();
          notifyListeners();
        }
      },
    );
  }

  stopMusic() {
    musicModel.stop();
  }

  stopTimer() {
    print("Timer Stopping Called");
    countDownTimer!.cancel();
    secondsTime = 0;
    timerString = "00:00:00";
    minutesTime = 0;
    isActive = false;
    // setState(() {});
    notifyListeners();
  }

  double _value = 40.0;
}
