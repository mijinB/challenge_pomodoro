import 'package:flutter/material.dart';

class ChooseCard extends StatelessWidget {
  final String minutes;
  final bool cardReverse;

  const ChooseCard({
    super.key,
    required this.minutes,
    required this.cardReverse,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Theme.of(context).cardColor,
          width: 2,
        ),
        color: cardReverse
            ? Theme.of(context).cardColor
            : Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 18,
        ),
        child: Text(
          minutes,
          style: TextStyle(
            color: cardReverse
                ? Theme.of(context).scaffoldBackgroundColor
                : Theme.of(context).cardColor,
            fontSize: 22,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
