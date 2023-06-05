import 'dart:async';

import 'package:flutter/material.dart';

class CustomStopWatch extends StatefulWidget {
  const CustomStopWatch({super.key});

  @override
  State<CustomStopWatch> createState() => _CustomStopWatchState();
}

class _CustomStopWatchState extends State<CustomStopWatch> {
  final _stopwatch = Stopwatch();
  late Timer _timer;
  String _result = '00:00:00:00';

  void _start() {
    _timer = Timer.periodic(const Duration(milliseconds: 10), (Timer timer) {
      setState(() {
        _result =
            '${_stopwatch.elapsed.inHours.toString().padLeft(2, 
            '0')}:${_stopwatch.elapsed.inMinutes.toString().padLeft(2, 
            '0')}:${(_stopwatch.elapsed.inSeconds % 60).toString().padLeft(2, 
            '0')}:${(_stopwatch.elapsed.inMilliseconds % 100).toString().padLeft(2, 
            '0')}';
      });
    });
    _stopwatch.start();
  }

  void _stop() {
    _timer.cancel();
    _stopwatch.stop();
  }

  void _reset() {
   // _stop();
    _stopwatch.reset();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          _result,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: 20.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: _start, child: const Text('Start')),
            ElevatedButton(
                onPressed: _stop,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text('Pause')),
            ElevatedButton(
                onPressed: _reset,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text('Reset')),
          ],
        ),
      ],
    );
  }
}
