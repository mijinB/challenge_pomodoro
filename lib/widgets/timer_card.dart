import 'package:flutter/material.dart';

class TimerCard extends StatelessWidget {
  final String timertime;

  const TimerCard({
    super.key,
    required this.timertime,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Transform.translate(
          offset: const Offset(0, 50),
          child: Container(
            width: 110,
            height: 30,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor.withOpacity(.60),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        Transform.translate(
          offset: const Offset(0, 25),
          child: Container(
            width: 120,
            height: 30,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor.withOpacity(.70),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 35,
              horizontal: 25,
            ),
            child: Text(
              timertime,
              style: TextStyle(
                color: Theme.of(context).scaffoldBackgroundColor,
                fontSize: 70,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
