import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../../widgets/flip_column.dart';

class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  late Timer _timer;
  late DateTime _dateTime;

  @override
  void initState() {
    super.initState();
    _dateTime = DateTime.now();
    _timer = Timer.periodic(const Duration(seconds: 1), _updateTime);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _updateTime(Timer timer) {
    setState(() {
      _dateTime = DateTime.now();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent,
      body: Center(
        child: Container(
          height: 180,
          margin: const EdgeInsets.symmetric(horizontal: 1),
          padding: const EdgeInsets.symmetric(horizontal: 1),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.purple.withOpacity(0.2),
                  border: Border.all(
                      color: Colors.white.withOpacity(0.5), width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //------
                    // Hour
                    //------
                    FlipColumn(
                      value: _dateTime.hour ~/ 10,
                      title: 'H',
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    FlipColumn(
                      value: _dateTime.hour % 10,
                      title: 'H',
                    ),
                    Transform.translate(
                      offset: const Offset(0, 14),
                      child: const Text(
                        ":",
                        style: TextStyle(
                          fontSize: 60,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    //--------
                    // Minute
                    //--------
                    FlipColumn(
                      value: _dateTime.minute ~/ 10,
                      title: 'M',
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    FlipColumn(
                      value: _dateTime.minute % 10,
                      title: 'M',
                    ),
                    Transform.translate(
                      offset: const Offset(0, 14),
                      child: const Text(
                        ":",
                        style: TextStyle(
                          fontSize: 60,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    //--------
                    // Second
                    //--------
                    FlipColumn(
                      value: _dateTime.second ~/ 10,
                      title: 'S',
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    FlipColumn(
                      value: _dateTime.second % 10,
                      title: 'S',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
