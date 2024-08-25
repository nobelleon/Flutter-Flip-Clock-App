import 'package:flutter/material.dart';

class FlipCard extends StatefulWidget {
  final int value;

  const FlipCard({super.key, required this.value});

  @override
  State<FlipCard> createState() => _FlipCardState();
}

class _FlipCardState extends State<FlipCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late int _previousValue;

  @override
  void initState() {
    super.initState();
    _previousValue = widget.value;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(FlipCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _previousValue = oldWidget.value;
      _controller.forward(from: 0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        final isFirstHalf = _animation.value < 0.5;
        final displayValue = isFirstHalf ? _previousValue : widget.value;
        final transformValue =
            isFirstHalf ? _animation.value * 2 : (1 - _animation.value) * 2;

        return Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateX(transformValue * 3.14),
          alignment: Alignment.center,
          child: Container(
            width: 50,
            height: 80,
            decoration: BoxDecoration(
              // color: Colors.grey[800],
              gradient: const LinearGradient(
                  colors: [Colors.deepPurpleAccent, Colors.greenAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0, 1]),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                '$displayValue',
                style: const TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
