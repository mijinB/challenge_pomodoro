import 'dart:async';

import 'package:challenge_pomodoro/widgets/choose_card.dart';
import 'package:challenge_pomodoro/widgets/cycle_num.dart';
import 'package:challenge_pomodoro/widgets/timer_card.dart';
import 'package:flutter/material.dart';

class UIScreen extends StatefulWidget {
  const UIScreen({super.key});

  @override
  State<UIScreen> createState() => _UIScreenState();
}

class _UIScreenState extends State<UIScreen> {
  int totalSeconds = 900;
  int round = 0;
  int goal = 0;
  bool fifteenchooseTap = true;
  bool twentychooseTap = false;
  bool twentyFivechooseTap = false;
  bool thirtychooseTap = false;
  bool thirtyFivechooseTap = false;

  late Timer timer;
  bool isRunning = false;
  bool breakTime = false;

  final ScrollController _scrollController = ScrollController();
  int _index = 1;

  void _focusCard() {
    const cardWidth = 70;
    final indexOffset = (_index * cardWidth) - (400 / 2) + (cardWidth / 2);

    _scrollController.animateTo(
      indexOffset,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void onTimerSet(int minute, int index) {
    setState(() {
      totalSeconds = minute;
      _index = index;

      switch (minute) {
        case 900:
          fifteenchooseTap = true;
          twentychooseTap = false;
          twentyFivechooseTap = false;
          thirtychooseTap = false;
          thirtyFivechooseTap = false;
          break;
        case 1200:
          twentychooseTap = true;
          fifteenchooseTap = false;
          twentyFivechooseTap = false;
          thirtychooseTap = false;
          thirtyFivechooseTap = false;
          break;
        case 1500:
          twentyFivechooseTap = true;
          fifteenchooseTap = false;
          twentychooseTap = false;
          thirtychooseTap = false;
          thirtyFivechooseTap = false;
          break;
        case 1800:
          thirtychooseTap = true;
          fifteenchooseTap = false;
          twentychooseTap = false;
          twentyFivechooseTap = false;
          thirtyFivechooseTap = false;
          break;
        case 2100:
          thirtyFivechooseTap = true;
          fifteenchooseTap = false;
          twentychooseTap = false;
          twentyFivechooseTap = false;
          thirtychooseTap = false;
          break;
      }
    });
    _focusCard();
  }

  void onTick(Timer timer) {
    if (breakTime) {
      if (totalSeconds == 0) {
        setState(() {
          isRunning = false;
          breakTime = false;
        });
        timer.cancel();
      } else {
        setState(() {
          totalSeconds--;
        });
      }
    } else {
      if (totalSeconds == 0) {
        setState(() {
          round++;
          isRunning = false;
          breakTime = true;
          totalSeconds = 300;
        });
        timer.cancel();
        if (round == 4) {
          setState(() {
            round = 0;
            goal++;
          });
        }
      } else {
        setState(() {
          totalSeconds--;
        });
      }
    }
  }

  void onTimerStart() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );
    setState(() {
      isRunning = true;
    });
  }

  void onTimerStop() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void onReset() {
    setState(() {
      totalSeconds = 0;
      isRunning = false;
      timer.cancel();
    });
  }

  String timeFormat(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split(".").first.substring(2, 7);
  }

  String minute(String time) {
    return time.toString().split(":").first;
  }

  String second(String time) {
    return time.toString().split(":").last;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'POMOTIMER',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).cardColor,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TimerCard(
                    timertime: minute(timeFormat(totalSeconds)),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Transform.translate(
                    offset: const Offset(0, 25),
                    child: Text(
                      ':',
                      style: TextStyle(
                        color: Theme.of(context).cardColor.withOpacity(.70),
                        fontSize: 60,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  TimerCard(
                    timertime: second(timeFormat(totalSeconds)),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 45,
                width: 400,
                child: ListView(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  children: [
                    InkWell(
                      onTap: () {
                        onTimerSet(900, 1);
                      },
                      child: ChooseCard(
                        minutes: '15',
                        cardReverse: fifteenchooseTap,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    InkWell(
                      onTap: () {
                        onTimerSet(1200, 2);
                      },
                      child: ChooseCard(
                        minutes: '20',
                        cardReverse: twentychooseTap,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    InkWell(
                      onTap: () {
                        onTimerSet(1500, 3);
                      },
                      child: ChooseCard(
                        minutes: '25',
                        cardReverse: twentyFivechooseTap,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    InkWell(
                      onTap: () {
                        onTimerSet(1800, 4);
                      },
                      child: ChooseCard(
                        minutes: '30',
                        cardReverse: thirtychooseTap,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    InkWell(
                      onTap: () {
                        onTimerSet(2100, 5);
                      },
                      child: ChooseCard(
                        minutes: '35',
                        cardReverse: thirtyFivechooseTap,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: isRunning ? onTimerStop : onTimerStart,
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(12),
                      backgroundColor: Colors.black.withOpacity(.20),
                      elevation: (0),
                    ),
                    child: Icon(
                      isRunning
                          ? Icons.pause_rounded
                          : Icons.play_arrow_rounded,
                      color: Theme.of(context).cardColor,
                      size: 60,
                    ),
                  ),
                  TextButton(
                    onPressed: onReset,
                    child: Text(
                      'reset',
                      style: TextStyle(
                        color: Theme.of(context).cardColor,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CycleNum(
                    attainment: '$round',
                    target: '4',
                    engText: 'ROUND',
                  ),
                  const SizedBox(
                    width: 120,
                  ),
                  CycleNum(
                    attainment: '$goal',
                    target: '12',
                    engText: 'GOAL',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
