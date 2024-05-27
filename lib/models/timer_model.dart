import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class TimerModel extends ChangeNotifier {
  int minutes = 5;
  int seconds = 0;
  bool isRunning = false;
  AudioPlayer audioPlayer;

  TimerModel() : audioPlayer = AudioPlayer();

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

  void playSound() async {
    await audioPlayer.play('assets/meditation_bell.mp3');
  }
}
