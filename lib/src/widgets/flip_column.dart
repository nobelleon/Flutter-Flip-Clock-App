import 'package:flip_clock/src/widgets/flip_card.dart';
import 'package:flutter/material.dart';

class FlipColumn extends StatelessWidget {
  final int value;
  final String title;

  const FlipColumn({super.key, required this.value, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        FlipCard(value: value),
      ],
    );
  }
}
