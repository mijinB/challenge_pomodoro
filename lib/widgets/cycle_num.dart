import 'package:flutter/material.dart';

class CycleNum extends StatelessWidget {
  final String attainment;
  final String target;
  final String engText;

  const CycleNum({
    super.key,
    required this.engText,
    required this.target,
    required this.attainment,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$attainment/$target',
          style: TextStyle(
            color: Theme.of(context).cardColor.withOpacity(.70),
            fontSize: 31,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          engText,
          style: TextStyle(
            color: Theme.of(context).cardColor,
            fontSize: 17,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.5,
          ),
        ),
      ],
    );
  }
}
