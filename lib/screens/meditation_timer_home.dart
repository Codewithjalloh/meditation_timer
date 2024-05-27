import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/timer_model.dart';

class MeditationTimerHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final timerModel = Provider.of<TimerModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Meditation Timer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${timerModel.minutes}:${timerModel.seconds.toString().padLeft(2, '0')}',
              style: TextStyle(fontSize: 48),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                timerModel.startTimer();
              },
              child: Text('Start Timer'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                timerModel.stopTimer();
              },
              child: Text('Stop Timer'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                timerModel.playSound();
              },
              child: Text('Play Sound'),
            ),
          ],
        ),
      ),
    );
  }
}
