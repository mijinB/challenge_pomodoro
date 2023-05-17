import 'package:challenge_pomodoro/ui_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const PomoTimer());
}

class PomoTimer extends StatelessWidget {
  const PomoTimer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF5DDCA4),
        cardColor: const Color(0xFFF2F2F2),
      ),
      home: const UIScreen(),
    );
  }
}
