import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class TimerModel extends ChangeNotifier {
  int minutes = 5;
  int seconds = 0;
  bool isRunning = false;
  late AudioPlayer audioPlayer;
  late AudioCache audioCache;

  TimerModel() {
    audioPlayer = AudioPlayer();
    audioCache = AudioCache(fixedPlayer: audioPlayer);
  }

  void startTimer() {
    if (isRunning) return;
    isRunning = true;
    minutes = 5;
    seconds = 0;
    _tick();
  }

  void stopTimer() {
    isRunning = false;
  }

  void _tick() async {
    while (isRunning && (minutes > 0 || seconds > 0)) {
      await Future.delayed(Duration(seconds: 1));
      if (seconds == 0) {
        if (minutes > 0) {
          minutes--;
          seconds = 59;
        } else {
          isRunning = false;
        }
      } else {
        seconds--;
      }
      notifyListeners();
    }
  }

  void playSound() {
    audioCache.play('meditation_bell.mp3');
  }
}
