import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/timer_model.dart';
import 'screens/meditation_timer_home.dart';

void main() {
  runApp(MeditationTimerApp());
}

class MeditationTimerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TimerModel(),
      child: MaterialApp(
        title: 'Meditation Timer',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MeditationTimerHome(),
      ),
    );
  }
}
